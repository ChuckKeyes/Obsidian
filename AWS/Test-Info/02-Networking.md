
# 02 – Networking

[[00-Dictionary Index|← Back to AWS Dictionary Index]]

---

## Application Load Balancer (ALB)

**Definition:**  
A Layer 7 load balancer designed for **HTTP and HTTPS** traffic. An ALB distributes application traffic across targets such as EC2 instances, containers, and IP addresses.

Supports advanced routing based on:

- Hostname
- URL path
- HTTP headers
- Query strings
- HTTP methods

**SAA Exam Tip:**  
Think:

**HTTP/HTTPS + intelligent routing → ALB**

Examples:

`example.com/images/*` → Image servers  
`example.com/api/*` → API servers

---

## Client VPN

**Definition:**  
A managed VPN service that allows individual users and devices to securely connect to AWS resources using a VPN client.

**SAA Exam Tip:**  

**Individual remote employees → Client VPN**

Do not confuse with Site-to-Site VPN, which connects entire networks.

---

## Cloud WAN

**Definition:**  
A managed wide-area networking service for building and centrally managing networks that connect VPCs, AWS Regions, branches, data centers, and other networks.

**SAA Exam Tip:**  
Think:

**Large global enterprise network + centralized WAN management → Cloud WAN**

---

## Direct Connect

**Definition:**  
Provides a dedicated private network connection between an organization's data center or network and AWS.

Traffic does not need to travel over the public Internet.

**Benefits:**

- Consistent network performance
- High bandwidth
- Private connectivity
- Reduced dependence on Internet connectivity

**SAA Exam Tip:**  

**Dedicated private connection from on-premises to AWS → Direct Connect**

Direct Connect normally takes longer to provision than a VPN.

---

## Elastic Load Balancing (ELB)

**Definition:**  
AWS service that automatically distributes incoming traffic across multiple healthy targets.

AWS provides several load balancer types:

- Application Load Balancer (ALB)
- Network Load Balancer (NLB)
- Gateway Load Balancer (GWLB)

**SAA Exam Tip:**  
Think:

**High Availability + distribute traffic across multiple targets → ELB**

---

## Gateway Load Balancer (GWLB)

**Definition:**  
A load balancer designed for deploying and scaling **third-party virtual network appliances**.

Examples:

- Firewalls
- Intrusion detection systems
- Intrusion prevention systems
- Deep packet inspection appliances

GWLB uses **GENEVE** to transport traffic to network appliances.

**SAA Exam Tip:**  

**Third-party firewall / security appliance fleet → GWLB**

---

## Global Accelerator

**Definition:**  
AWS networking service that improves the availability and performance of applications by routing traffic through the **AWS global network**.

Provides static anycast IP addresses that act as fixed entry points to applications.

**SAA Exam Tip:**  

**Global application + static IP addresses + TCP/UDP + improved performance → Global Accelerator**

Do not automatically choose CloudFront when the application is not HTTP/content-delivery based.

---

## Internet Gateway (IGW)

**Definition:**  
A horizontally scaled AWS networking component that allows communication between resources in a VPC and the Internet.

An Internet Gateway is attached to a VPC.

For an EC2 instance to communicate directly with the Internet, it generally needs:

- Route to an Internet Gateway
- Public IPv4 address or Elastic IP
- Appropriate Security Group/NACL rules

**SAA Exam Tip:**  

**Public subnet needs Internet access → Internet Gateway**

---

## NAT Gateway

**Definition:**  
A managed Network Address Translation service that allows resources in a **private subnet** to initiate outbound connections to the Internet while preventing unsolicited inbound Internet connections.

Typical architecture:

```text
Private EC2
    ↓
NAT Gateway
(Public Subnet)
    ↓
Internet Gateway
    ↓
Internet
```

**SAA Exam Tip:**  

**Private subnet needs outbound Internet access → NAT Gateway**

For Availability Zone resilience, NAT Gateways are normally deployed per AZ rather than forcing multiple AZs through one NAT Gateway.

---

## NAT Instance

**Definition:**  
An EC2 instance configured to perform Network Address Translation for resources in private subnets.

Unlike NAT Gateway, the customer manages:

- EC2 instance
- Patching
- Scaling
- Availability
- Security Groups

**SAA Exam Tip:**  
For most modern SAA architectures:

**Managed NAT required → NAT Gateway**

A NAT Instance may appear when the scenario requires capabilities or management characteristics not provided by NAT Gateway.

---

## Network Load Balancer (NLB)

**Definition:**  
A high-performance **Layer 4** load balancer designed for TCP, UDP, and TLS traffic.

NLB supports:

- TCP
- UDP
- TLS
- Very high connection volumes
- Static IP addresses
- Elastic IP addresses

**SAA Exam Tip:**

**TCP/UDP → NLB**

Remember:

```text
ALB = Layer 7
NLB = Layer 4
```

If the question emphasizes **UDP traffic**, strongly consider NLB.

---

## PrivateLink

**Definition:**  
Provides private connectivity between VPCs and services without exposing traffic to the public Internet.

AWS PrivateLink uses **interface VPC endpoints** to privately access supported services.

**SAA Exam Tip:**  

**Privately expose/access a service across VPCs without VPC peering or Internet → PrivateLink**

Useful for service-provider and SaaS architectures.

---

## Route 53

**Definition:**  
AWS highly available and scalable **Domain Name System (DNS)** service.

Route 53 provides:

- Domain registration
- DNS
- Health checks
- Traffic routing

### Important Routing Policies

- Simple
- Weighted
- Latency-based
- Failover
- Geolocation
- Geoproximity
- Multi-value answer

**SAA Exam Tips:**

**Active/passive DR → Failover routing**

**Send percentages of traffic to different resources → Weighted**

**Lowest network latency → Latency-based**

**Route based on user's geographic location → Geolocation**

---

## Route Table

**Definition:**  
Contains rules called **routes** that determine where network traffic from a subnet or gateway is directed.

Example:

```text
Destination        Target
10.0.0.0/16        local
0.0.0.0/0          igw-xxxx
```

**SAA Exam Tip:**  
A subnet becomes effectively public when its route table provides a route to an Internet Gateway and the resource has the necessary public addressing.

---

## Site-to-Site VPN

**Definition:**  
Creates an encrypted IPsec VPN connection between an on-premises network and an AWS VPC or AWS networking environment.

Traffic typically travels across the Internet in an encrypted tunnel.

**SAA Exam Tip:**

**On-premises network ↔ AWS quickly and securely → Site-to-Site VPN**

Compared with Direct Connect:

```text
VPN             = Internet + encrypted
Direct Connect  = Dedicated private connection
```

They can also be used together.

---

## Subnet

**Definition:**  
A range of IP addresses within a VPC.

Each subnet exists entirely within **one Availability Zone**.

### Public Subnet

Has routing that allows appropriate resources to reach an Internet Gateway.

### Private Subnet

Does not provide resources with a direct route to the Internet through an Internet Gateway.

Private resources can use a NAT Gateway for outbound Internet access.

**SAA Exam Tip:**

```text
ALB / NAT Gateway → commonly Public Subnet

Application EC2 → commonly Private Subnet

Database → commonly Private Subnet
```

---

## Transit Gateway (TGW)

**Definition:**  
A regional network transit hub used to connect multiple VPCs and on-premises networks.

Instead of creating many individual VPC peering connections:

```text
VPC ─┐
VPC ─┤
VPC ─┼── Transit Gateway
VPC ─┤
VPN ─┤
DX  ─┘
```

**SAA Exam Tip:**  

**Many VPCs + centralized connectivity → Transit Gateway**

This avoids large, complicated VPC peering meshes.

---

## VPC (Virtual Private Cloud)

**Definition:**  
A logically isolated virtual network in AWS where customers deploy AWS resources.

A VPC allows control over:

- IP address ranges
- Subnets
- Route tables
- Internet connectivity
- Security
- Network gateways

**SAA Exam Tip:**  

Think of the VPC as the **network boundary** for your AWS environment.

Know the relationship:

```text
VPC
│
├── Availability Zone A
│      ├── Public Subnet
│      └── Private Subnet
│
└── Availability Zone B
       ├── Public Subnet
       └── Private Subnet
```

---

## VPC Endpoints

**Definition:**  
Allow resources inside a VPC to privately access supported AWS services without requiring an Internet Gateway, NAT Gateway, VPN, or public IP address.

### Gateway Endpoints

Used for:

- Amazon S3
- DynamoDB

### Interface Endpoints

Use AWS PrivateLink and create private network interfaces inside the VPC.

**SAA Exam Tip:**

**Private S3/DynamoDB access → Gateway Endpoint**

**Private access to many other AWS services → Interface Endpoint / PrivateLink**

---

## VPC Peering

**Definition:**  
Creates private network connectivity between two VPCs using private IP addresses.

The VPCs can be in:

- Same AWS account
- Different AWS accounts
- Same Region
- Different Regions

**Important:**  
VPC peering is **non-transitive**.

If:

```text
VPC-A ↔ VPC-B ↔ VPC-C
```

VPC-A does **not** automatically communicate with VPC-C through VPC-B.

**SAA Exam Tip:**

**A few VPCs → VPC Peering**

**Many VPCs / centralized network → Transit Gateway**

---

# SAA Load Balancer Quick Reference

| Requirement | Load Balancer |
|---|---|
| HTTP/HTTPS | **ALB** |
| Layer 7 | **ALB** |
| Path-based routing | **ALB** |
| Host-based routing | **ALB** |
| TCP | **NLB** |
| UDP | **NLB** |
| Layer 4 | **NLB** |
| Static IP requirement | **NLB** |
| Security appliances | **GWLB** |
| Firewalls / IDS / IPS | **GWLB** |

---

# SAA Connectivity Quick Reference

| Question says... | Think... |
|---|---|
| Public subnet needs Internet | **Internet Gateway** |
| Private EC2 needs Internet outbound | **NAT Gateway** |
| Individual remote employees | **Client VPN** |
| On-premises ↔ AWS encrypted connection | **Site-to-Site VPN** |
| Dedicated on-premises ↔ AWS connection | **Direct Connect** |
| Two VPCs | **VPC Peering** |
| Many VPCs | **Transit Gateway** |
| Private S3/DynamoDB access | **Gateway VPC Endpoint** |
| Private AWS service access | **Interface Endpoint / PrivateLink** |
| Global enterprise WAN | **Cloud WAN** |
| Global static IP + TCP/UDP performance | **Global Accelerator** |

---

# SAA Networking Patterns

### Public Web Application

```text
Internet
   ↓
Internet Gateway
   ↓
Application Load Balancer
Public Subnets
   ↓
EC2 Auto Scaling
Private Subnets
   ↓
RDS
Private Subnets
```

### Private Server Internet Access

```text
EC2
Private Subnet
     ↓
NAT Gateway
Public Subnet
     ↓
Internet Gateway
     ↓
Internet
```

### Hybrid Enterprise

```text
Corporate Data Center
       │
       ├── Site-to-Site VPN
       │
       └── Direct Connect
                │
                ▼
         Transit Gateway
          /     |     \
       VPC-A   VPC-B   VPC-C
```

---

## Related AWS Dictionary Pages

- [[01-Compute]]
- [[GCP/Test-Info/Test-Dictionary/Google Cloud Platform (PCA)/03-Storage]]
- [[06-IAM & Security]]
- [[12-Hybrid & Multi-Cloud]]
- [[14-Disaster Recovery & HA]]
- [[15-SAA Exam Keywords]]
- [[20-DNS & Content Delivery]]

---

#AWS #SAA #SAA-C03 #Networking