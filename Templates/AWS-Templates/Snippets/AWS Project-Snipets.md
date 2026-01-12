
---

# ✅ **AWS Project – File-by-File Write-Up (No Code)**

Use this as your Obsidian documentation for recruiters, class submissions, or your own reference.

---

## **1. VPC.tf — Virtual Private Cloud**

This file defines the **network boundary** for everything in the AWS project.  
The VPC provides the main IP range (CIDR) and enables DNS support.  
Every other resource — subnets, security groups, NAT, EC2, ALB — lives inside this VPC.

Add snippet link: _[VPC S[[1. VPC]]]_

---

## **2. Subnets.tf — Public and Private Subnets (Multi-AZ)**

This file divides the VPC into multiple subnets across different Availability Zones.

### Public Subnets

Used for resources that must be directly reachable from the internet, such as the ALB or bastion hosts.

### Private Subnets

Used for EC2 instances, database layers, application servers, and internal services that should **not** be directly exposed to the internet.

Add snippet links:  
• _[AWS/Templates/Snippets/2. Public Subnets (3 AZs).md]_  
• _[D:\New Obsidian\New Obsidian\AWS\Templates\Snippets\2. Private Subnets (3 AZs).md]_

---

## **3. Internet-Gateway.tf — Internet Access for Public Subnets**

This file creates an Internet Gateway (IGW) and attaches it to the VPC.  
An IGW allows resources in **public subnets** to send and receive traffic from the internet.

Add snippet link: [[3. Internet Gateway]]

---

## **4. NAT-Gateway.tf — Outbound Internet for Private Subnets**

This file creates a NAT Gateway and allocates it an Elastic IP address.  
Private subnet instances use the NAT to access the internet (e.g., OS updates) **without** exposing themselves publicly.

Add snippet links:  
• [[4. Elastic IP]]
•[[5. Nat Gateway]]

---

## **5. Route-Tables.tf — Public and Private Routing**

This file defines two separate route tables:

### Public Route Table

Routes `0.0.0.0/0` to the **Internet Gateway**, supporting public subnet traffic.
[[8. Public Route Table Associations (3)]]
### Private Route Table

Routes `0.0.0.0/0` to the **NAT Gateway**, so private instances can reach the internet safely.

Add snippet link: _[Route Tables Snippet][[9. Private Route Table Associations (3)]]_

---

## **6. Route-Table-Associations.tf — Subnet → Route Table Mappings**

This file attaches each subnet to the correct route table.

- **Public subnets → Public route table**
    [[8. Public Route Table Associations (3)]]
- **Private subnets → Private route table**
    [[9. Private Route Table Associations (3)]]

AWS requires each subnet to have _exactly one_ route table association.  
This file maps them correctly across all three AZs.

---

## **7. Security-Groups.tf — ALB + ASG Instance Firewall Rules**

This file defines the two main security groups used in the project:

### ALB Security Group

Allows inbound HTTP/HTTPS traffic from the internet.

### Target Group / EC2 Instance Security Group

Only allows HTTP traffic from the ALB SG and optional SSH from your admin IP.

These firewall rules protect the EC2 instances while still enabling load-balanced traffic.

Add snippet links:  
• _[ALB SG Snippet][[10. Security Group --- Load Balancer]]_  
• _[Target SG Snippet][[11. Security Group — Target Group Web ASG Instances]]_

---

## **8. Launch-Template.tf — EC2 Blueprint for Auto Scaling**

This file defines the EC2 launch configuration:

- AMI (OS image)
    
- Instance type
    
- Attached security groups
    
- User data script (installs web server and writes HTML)
    
- Tags applied at launch
    

The ASG uses this template to create consistent, identical application instances.

Add snippet link: _[Launch Template Snippet][[12. Launch Template]]_

---

## **9. Target-Group.tf — Health Checks + ALB Backend Pool**

This file defines the ALB Target Group, which contains:

- Port and protocol used by EC2 instances
    
- Health check configuration
    
- Target type (instance)
    

The ALB only routes traffic to **healthy** instances in the target group.

Add snippet link: _[Target Group Snippet][[13. Target Group]]_

---

## **10. Load-Balancer.tf — Application Load Balancer**

This file creates the ALB that distributes traffic across multiple Availability Zones.

The ALB:

- Uses public subnets
    
- Has a security group allowing HTTP/HTTPS
    
- Balances incoming traffic across healthy EC2 instances in the target group
    

Add snippet link: _[Load Balancer Snippet][[14. Load Balancer]]_

---

## **11. Listener.tf — ALB Listener Rule**

This file defines what the ALB does when receiving traffic.

A typical listener:

- Listens on port 80 (HTTP)
    
- Forwards requests to the Target Group
    

This is the traffic entry point that ties the ALB to the backend EC2 instances.

Add snippet link: _[Listener Snippet][[15. ALB Listener]]_

---

## **12. Auto-Scaling-Group.tf — Multi-AZ EC2 Cluster**

This file defines the Auto Scaling Group (ASG), which:

- Launches EC2 instances in all 3 public subnets
    
- Automatically replaces unhealthy instances
    
- Spreads workloads across multiple AZs
    
- Attaches EC2 instances to the Target Group
    

This gives your application high availability and resilience.

Add snippet link: _[ASG Snippet][[16. Auto Scaling Group]]_

---

## **13. Auto-Scaling-Policy.tf — CPU-Based Scaling**

This file adds dynamic scaling based on CPU utilization.

When average CPU rises above your threshold:

- ASG scales **out** (adds more EC2 instances)
    

When CPU drops below threshold:

- ASG scales **in** (removes EC2 instances)
    

This ensures performance without wasting cost.

Add snippet link: _[Auto Scaling Policy Snippet][[17. Auto Scaling Policy (CPU-based)]]_

---

## **14. Auto-Scaling-Attachment.tf (Optional)**

This file is sometimes used when attaching a Classic Load Balancer or attaching a Target Group in legacy setups.  
In your project, the ASG already includes `target_group_arns`, so this file is optional.

Add snippet link: [What is a Classic Load Balancer? - ELB](https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/introduction.html)