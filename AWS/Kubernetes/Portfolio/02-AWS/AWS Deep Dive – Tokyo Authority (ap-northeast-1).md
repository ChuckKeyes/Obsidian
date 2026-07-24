
# ☁️ AWS Deep Dive – Tokyo Authority (ap-northeast-1)

---

## 🧭 Overview

The Tokyo region serves as the **primary authority** for this architecture, hosting the **centralized database layer**, core application services, and global entry integration.

This design ensures:
- **Data compliance (PHI / sensitive data centralized)**
- **High availability**
- **Secure access from global regions and multi-cloud environments**

---

## 🧭 Architecture Diagram (AWS Tokyo)

![AWS Tokyo Architecture](../Portfolio Files/Diagrams/aws-tokyo-deep-dive.png)

---

## 🔗 Quick Navigation

- [[01-Architecture]]
- [[04-Networking-BGP-Flow]]
- [[06-Compute]]
- [[07-Database]]
- [[08-Monitoring]]

---

## 🌐 Global Entry Integration

- **:contentReference[oaicite:0]{index=0}**
- **:contentReference[oaicite:1]{index=1}**
- AWS WAF

### Flow:
1. User → CloudFront
2. CloudFront → ALB (Tokyo)
3. ALB → Private EC2

✔ CloudFront acts as **single global entry point**  
✔ WAF filters malicious traffic  
✔ ALB is **NOT publicly exposed**

---

## 🖥️ Application Layer

### Components:
- Application Load Balancer (ALB)
- EC2 Instances (Private Subnets)
- Nginx (Web Layer)

→ [[06-Compute]]

### Design:
- Stateless application tier
- Horizontal scaling ready
- No public IPs on EC2

✔ Improves security  
✔ Enables scaling across AZs  

---

## 🗄️ Data Layer (Primary Authority)

- **:contentReference[oaicite:2]{index=2}** (MySQL/PostgreSQL)

→ [[07-Database]]

### Design Decisions:
- Multi-AZ deployment
- Private subnet only
- Access restricted to application layer

✔ Centralized data control  
✔ High availability  
✔ Automated backups  

---

## 🔀 Networking (Tokyo Core)

- **:contentReference[oaicite:3]{index=3}**
- VPC with public + private subnets
- Route tables for isolation

→ [[04-Networking-BGP-Flow]]

### Connectivity:
- TGW → São Paulo (peering)
- TGW → GCP (VPN via NCC)

✔ Central routing hub  
✔ Scalable multi-region connectivity  

---

## 🔐 Security Architecture

### Layers:
- CloudFront + WAF (edge protection)
- ALB restricted to CloudFront only
- Security Groups (least privilege)
- Private subnets for compute + DB
- No direct internet access to backend

### Special Control:
- Origin header validation (CloudFront → ALB)

✔ Prevents direct ALB access  
✔ Enforces controlled entry  

---

## 📊 Monitoring & Logging

- CloudWatch metrics + logs
- ALB access logs
- EC2 monitoring

→ [[08-Monitoring]]

✔ Visibility into traffic + performance  
✔ Alerting capability  

---

## ⚙️ High Availability Design

- Multi-AZ deployment (EC2 + RDS)
- Stateless app tier
- Load balancing via ALB

✔ Fault tolerance  
✔ Automatic failover  

---

## 🧠 Key Design Decisions

### 1. Tokyo as Primary Region
- Ensures compliance (data residency)
- Acts as central authority

---

### 2. Private Application Tier
- Reduces attack surface
- Enforces layered security

---

### 3. CloudFront + WAF Front Door
- Global performance
- Security filtering at edge

---

### 4. Transit Gateway Hub
- Simplifies routing
- Enables multi-region + multi-cloud expansion

---

## 📌 What This Page Demonstrates

- Production-ready AWS architecture  
- Secure layered design  
- High availability best practices  
- Integration with global and multi-cloud systems  

---

## 🏁 Outcome

The Tokyo region successfully acts as:

- Central application hub  
- Secure database authority  
- Network transit point for global connectivity  

---

## 👉 Next Step

➡️ [[03-GCP-Networking]] (NCC + HA VPN + Multi-Cloud Integration)