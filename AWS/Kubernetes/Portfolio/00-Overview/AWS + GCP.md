
## 🧾 Executive Summary

This project demonstrates the design and deployment of a **secure, highly available, multi-cloud architecture** connecting **AWS and Google Cloud Platform (GCP)** using **BGP-based VPN, Transit Gateway (TGW), and Network Connectivity Center (NCC)**.

The system is built to simulate a **global enterprise environment** where application traffic is distributed across regions, while maintaining a **centralized, compliant database layer** in **AWS Tokyo (ap-northeast-1)**.

Users connect through a **single global entry point** using **Amazon CloudFront**, which enforces security via **WAF** and routes traffic to private application infrastructure. Cross-region and cross-cloud communication is handled securely through **dynamic routing (BGP)**, ensuring scalability and resilience.

---

## 🎯 Project Objectives

- Build a **multi-cloud architecture (AWS + GCP)**
- Implement **secure connectivity using HA VPN + BGP**
- Use **AWS Transit Gateway (TGW)** for regional routing
- Use **GCP Network Connectivity Center (NCC)** as a hub
- Enforce **centralized database compliance (Tokyo region)**
- Deploy infrastructure using **Terraform (IaC)**
- Automate deployments with **Jenkins CI/CD**
- Implement **monitoring and observability**

---

## 🌍 Regions & Topology

### AWS Regions:

- **Tokyo (ap-northeast-1)** → Primary (Database / Authority)
- **São Paulo (sa-east-1)** → Secondary (Compute only)

### GCP Regions:

- **Iowa (us-central1)** → Test environment
- **New York (simulated VPC)** → Branch network

---

## 🧱 Core Architecture Components

### 🌐 Global Entry Layer

- **Amazon CloudFront**
- **Amazon Route 53**
- AWS WAF (security layer)

---

### 🖥️ Application Layer

- EC2 instances (private subnets)
- Nginx (web layer)
- Stateless design for scalability

---

### 🗄️ Data Layer

- **Amazon RDS** (Tokyo)
- Centralized database for compliance (PHI/data control)

---

### 🔀 Networking Layer

- **AWS Transit Gateway**
- TGW Peering (Tokyo ↔ São Paulo)
- HA VPN (AWS ↔ GCP)
- **Google Cloud Network Connectivity Center**
- Dynamic routing via BGP

---

### 📊 Monitoring & Operations

- CloudWatch (AWS)
- GCP Monitoring
- Prometheus + Grafana (planned/extended)

---

### 🔄 CI/CD & Automation

- **Jenkins**
- GitHub (source control)
- Terraform (Infrastructure as Code)

---

## 🔐 Security Design

- CloudFront + WAF protects all inbound traffic
- ALB restricted to CloudFront only
- Private subnets for application servers
- No direct public access to compute or database
- Secure VPN tunnels for cross-cloud communication

---

## ⚙️ Key Technologies

- AWS (CloudFront, Route 53, EC2, RDS, TGW)
- GCP (NCC, HA VPN, VPC)
- Terraform (IaC)
- Jenkins (CI/CD)
- BGP (dynamic routing)
- Nginx (web server)

---

## 🧠 Architecture Highlights

- **Multi-cloud connectivity using dynamic BGP routing**
- **Centralized database with global access control**
- **Stateless compute for horizontal scalability**
- **Secure global entry point via CloudFront**
- **Fully automated deployment using Terraform + Jenkins**

---

## 🏁 Outcome

This architecture successfully demonstrates a **production-style global cloud system** with:

- Secure multi-region deployment
- Cross-cloud connectivity (AWS ↔ GCP)
- Scalable application infrastructure
- Centralized data governance
- Automated infrastructure provisioning

---

## 📌 What This Proves

This project showcases real-world capabilities in:

- Cloud Architecture Design
- Multi-Cloud Networking
- Infrastructure as Code (Terraform)
- CI/CD Automation
- Secure System Design
- Observability and Monitoring



🧭 TOP (Global Entry)
[ User / Internet ]
        ↓
[ CloudFront ]
        ↓
[ WAF ]
        ↓

☁️ AWS TOKYO (CENTER)
[ ALB ]
   ↓
[ EC2 - Private Subnets ]
   ↓
[ RDS - Primary DB ]

🌎 AWS SÃO PAULO (LEFT or RIGHT)
[ EC2 - Compute Only ]
   ↓
[ TGW Connection ]

🌐 GCP SIDE
[ NCC Hub ]
   ↓
[ HA VPN ]
   ↓
[ Iowa VPC ]
[ NY VPC ]

🔀 NETWORK CORE
[ AWS TGW Tokyo ]
   ↔
[ AWS TGW São Paulo ]
   ↔
[ VPN to GCP NCC ]

# 🔥 Pro Tips (THIS MAKES IT LOOK PROFESSIONAL)

- Use **official AWS + GCP icons only**
- No generic boxes or circles
- Label flows:
    - “HTTPS”
    - “BGP”
    - “Private Traffic”
- Keep **left → right flow**
- Use **color grouping**:
    - Blue = AWS
    - Green = GCP

🎯 Draw.io Layout (AWS Tokyo Diagram)

🌐 TOP (Edge Layer)
[ Route 53 ]
     ↓
[ CloudFront ]
     ↓
[ WAF ]

☁️ MIDDLE (Application Layer)
[ ALB ]
   ↓
[ EC2 - Private Subnet AZ1 ]
[ EC2 - Private Subnet AZ2 ]

🗄️ BOTTOM (Data Layer)
[ RDS Primary - Multi-AZ ]

🔀 SIDE (Networking)
[ VPC ]
   ↓
[ Transit Gateway ]
   ↓
→ São Paulo
→ GCP VPN

🎯 Draw.io Layout (GCP Networking Diagram)

🌐 CENTER (HUB)
[ NCC Hub ]

🔐 BELOW HUB (VPN + ROUTING)
[ HA VPN Gateway ]
   ↓
[ Cloud Router (BGP) ]

☁️ LEFT SIDE (AWS)
[ AWS Transit Gateway ]
   ↑
[ VPN Connection ]

🌎 RIGHT SIDE (SPOKES)
[ Iowa VPC ]
[ NY VPC ]

🔀 FLOW (IMPORTANT)
GCP VM → NCC → VPN → AWS TGW → EC2/RDS
# 🔥 Pro Tips (THIS MAKES YOU STAND OUT)

- Label:
    - “BGP Session”
    - “IPsec Tunnel”
    - “Dynamic Routes”
- Show **2 VPN tunnels** (HA)
- Use arrows showing **bidirectional routing**

🎯 Draw.io Layout (BGP Flow Diagram)

🔀 CENTER (AWS CORE)
[ TGW Tokyo ]
   ↔
[ TGW São Paulo ]

🌐 LEFT (GCP)
[ GCP NCC ]
   ↓
[ HA VPN ]
   ↓
[ BGP Router ]

☁️ RIGHT (AWS VPCs)
[ Tokyo VPC ]
[ São Paulo VPC ]

🔄 FLOW ARROWS (IMPORTANT)
Label arrows:

- “BGP Route Exchange”
- “VPN Tunnel (IPsec)”
- “Route Propagation”

# 🔥 Pro Tips (THIS IS ADVANCED)

- Show **CIDR ranges** on diagram (10.x.x.x)
- Show **2 VPN tunnels**
- Label:
    - “Advertised Routes”
    - “Learned Routes”
- Use dashed lines for VPN
