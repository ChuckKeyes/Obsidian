
## Goal checklist (what must be true)

- Two VPCs with **non-overlapping CIDRs** (example below)
    
- A **VPC peering connection** between them (cross-Region)
    
- **Routes added on both sides** pointing to the peering connection
    
- **Security groups** allow the traffic (ICMP/SSH or your app ports)
    
- (Optional) **DNS resolution** across the peer if you want name-based access [AWS Documentation+2AWS Documentation+2](https://docs.aws.amazon.com/vpc/latest/peering/create-vpc-peering-connection.html?utm_source=chatgpt.com)
    

---

## Part A — Create VPC + subnet in Virginia (us-east-1)

1. In the AWS console, switch Region (top right) to **US East (N. Virginia)**.
    
2. Go to **VPC** service.
    
3. Click **Create VPC** → choose **VPC and more**.
    
4. Use an example like:
    
    - VPC name: `vpc-va`
        
    - IPv4 CIDR: `10.10.0.0/16`
        
    - Number of AZs: 1 (fine for a demo)
        
    - Public subnets: 1 (for easy SSH)
        
    - (Optional) Enable “Auto-assign public IPv4” for the public subnet
        
5. Click **Create VPC**.
    

_(Any CIDR is fine as long as it doesn’t overlap with Paris.)_ [AWS Documentation](https://docs.aws.amazon.com/vpc/latest/peering/create-vpc-peering-connection.html?utm_source=chatgpt.com)

---

## Part B — Create VPC + subnet in Paris (eu-west-3)

1. Switch Region to **Europe (Paris)**.
    
2. VPC → **Create VPC** → **VPC and more**.
    
3. Example:
    
    - VPC name: `vpc-paris`
        
    - IPv4 CIDR: `10.20.0.0/16`
        
    - Public subnets: 1
        
4. **Create VPC**.
    

---

## Part C — Launch an EC2 VM in each Region

Do this twice: once in Virginia, once in Paris.

### C1) Virginia EC2 (us-east-1)

1. Switch to **Virginia**.
    
2. Go to **EC2 → Instances → Launch instance**. [AWS Documentation+1](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EC2_GetStarted.html?utm_source=chatgpt.com)
    
3. Set:
    
    - Name: `vm-va`
        
    - AMI: Amazon Linux (default is fine)
        
    - Instance type: `t2.micro` / `t3.micro` (whatever you have access to)
        
    - Key pair: create/select one (for SSH)
        
    - Network settings:
        
        - VPC: `vpc-va`
            
        - Subnet: your public subnet
            
        - Auto-assign public IP: **Enable**
            
        - Security group: create `sg-va` with inbound:
            
            - SSH (22) from **your IP** (recommended)
                
            - ICMP (ping) from `10.20.0.0/16` (Paris VPC CIDR) (we’ll use this later)
                
4. Launch.
    

### C2) Paris EC2 (eu-west-3)

1. Switch to **Paris**.
    
2. Launch instance:
    
    - Name: `vm-paris`
        
    - VPC: `vpc-paris`
        
    - SG: create `sg-paris` with inbound:
        
        - SSH (22) from your IP
            
        - ICMP from `10.10.0.0/16` (Virginia VPC CIDR)
            

Security groups are your main “allow list,” so keep them tight. [AWS Documentation+1](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-security-groups.html?utm_source=chatgpt.com)

---

## Part D — Create the VPC Peering connection (Virginia → Paris)

1. Switch to **Virginia**.
    
2. VPC console → **Peering connections** → **Create peering connection**. [AWS Documentation](https://docs.aws.amazon.com/vpc/latest/peering/create-vpc-peering-connection.html?utm_source=chatgpt.com)
    
3. Fill:
    
    - Name: `peer-va-paris`
        
    - **Requester VPC**: `vpc-va`
        
    - **Accepter**:
        
        - Account: (same account, if that’s what you’re doing)
            
        - Region: **Europe (Paris)**
            
        - VPC ID: select `vpc-paris`
            
4. Click **Create peering connection**.
    

---

## Part E — Accept the peering request (in Paris)

1. Switch Region to **Paris**.
    
2. VPC → **Peering connections**.
    
3. Select the pending connection → **Actions → Accept request**. [AWS Documentation](https://docs.aws.amazon.com/vpc/latest/peering/accept-vpc-peering-connection.html?utm_source=chatgpt.com)
    
4. Status should become **Active**.
    

---

## Part F — Add routes on BOTH sides (this is the #1 thing people miss)

### F1) Virginia route table

1. Switch to **Virginia**.
    
2. VPC → **Route tables**.
    
3. Select the route table that’s associated with the subnet your VM is in.
    
4. **Routes → Edit routes → Add route**
    
    - Destination: `10.20.0.0/16` (Paris VPC)
        
    - Target: **Peering connection** `peer-va-paris`
        
5. Save.
    

### F2) Paris route table

1. Switch to **Paris**.
    
2. Route tables → pick the subnet’s route table.
    
3. Add route:
    
    - Destination: `10.10.0.0/16` (Virginia VPC)
        
    - Target: the same peering connection
        
4. Save.
    

(Without routes on both sides, peering exists but nothing flows.)

---

## Part G — Test private connectivity (ping by private IP)

1. In EC2 console, open each instance and copy its **Private IPv4 address**.
    
2. SSH into `vm-va`.
    
3. Ping Paris private IP:
    
    - `ping <paris-private-ip>`
        
4. SSH into `vm-paris` and ping back.
    

If ping fails, 99% of the time it’s:

- missing route table entry, or
    
- SG doesn’t allow ICMP from the peer CIDR. [AWS Documentation+1](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-security-groups.html?utm_source=chatgpt.com)
    

---

## Optional: Enable DNS resolution across the peer

If you want the VPCs to resolve private DNS names across the peering connection:

1. VPC → Peering connections → select your connection
    
2. **Actions → Edit DNS settings**
    
3. Enable DNS resolution options as needed [AWS Documentation+1](https://docs.aws.amazon.com/vpc/latest/peering/vpc-peering-dns.html?utm_source=chatgpt.com)
    

---

## Quick “best practice” settings for your demo

- Use **tight CIDRs** and **tight SG rules** (only ports you need).
    
- Keep it simple: **one public subnet** per region for SSH, then you can later move to private-only + bastion/SSM.
    
- Turn on **VPC Flow Logs** if you need to troubleshoot later.