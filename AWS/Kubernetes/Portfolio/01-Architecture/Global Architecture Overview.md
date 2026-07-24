
# 🌐 Global Architecture Overview

---

## 🧭 Architecture Diagram

> 📌 This diagram represents the full multi-cloud architecture across AWS and GCP, including global entry, application layers, networking, and data flow.

![Global Architecture Diagram](../Portfolio Files/Diagrams/lab4-global-architecture.png)

---

## 🔗 Quick Navigation

- [[00-Overview]]
- [[02-AWS-Deep-Dive]]
- [[03-GCP-Networking]]
- [[04-Networking-BGP-Flow]]
- [[06-Compute]]
- [[07-Database]]

---

## 🌍 High-Level Flow

1. User connects via **CloudFront (Global Entry)**
2. Traffic is filtered through **WAF**
3. Request is routed to **Application Load Balancer (Tokyo)**
4. Traffic is sent to **private EC2 instances (Nginx/App Layer)**
5. Application queries **RDS (Tokyo primary database)**
6. Cross-region and cross-cloud communication flows through:
   - **Transit Gateway (AWS)**
   - **HA VPN + BGP**
   - **GCP NCC Hub**

---

## 🧱 Layer Breakdown

---

### 🌐 Global Entry Layer

- CloudFront → [[02-AWS-Deep-Dive]]
- Route 53 → [[02-AWS-Deep-Dive]]
- WAF → [[02-AWS-Deep-Dive]]

✔ Single global entry point  
✔ DDoS protection  
✔ Low latency worldwide  

---

### 🖥️ Application Layer

- ALB (Tokyo)
- EC2 (Private Subnets)
- Nginx / App Services

→ [[06-Compute]]

✔ Stateless design  
✔ Horizontally scalable  
✔ No direct public access  

---

### 🗄️ Data Layer

- RDS (Primary DB in Tokyo)

→ [[07-Database]]

✔ Centralized data (compliance)  
✔ Secure access only from app layer  

---

### 🔀 Networking Layer

- Transit Gateway (Tokyo + São Paulo)
- TGW Peering
- HA VPN (AWS ↔ GCP)
- NCC Hub (GCP)
- BGP Routing

→ [[04-Networking-BGP-Flow]]  
→ [[03-GCP-Networking]]

✔ Dynamic routing  
✔ Cross-cloud connectivity  
✔ Scalable network design  

---

### 🌎 Multi-Region Design

| Region | Role |
|------|------|
| Tokyo | Primary (DB + App) |
| São Paulo | Compute |
| GCP Iowa | External test network |
| GCP NY | Branch VPC |

---

## 🔐 Security Flow

- Internet → CloudFront (only entry)
- CloudFront → ALB (restricted via header + prefix list)
- ALB → Private EC2 (no public IPs)
- EC2 → RDS (private only)
- VPN → Encrypted cross-cloud traffic

---

## 🧠 Key Design Decisions

### 1. Centralized Database (Tokyo)
- Ensures compliance (PHI/data control)
- Reduces data duplication risk

→ [[07-Database]]

---

### 2. Stateless Compute
- Enables horizontal scaling
- Easy failover and replacement

→ [[06-Compute]]

---

### 3. Multi-Cloud Networking
- AWS + GCP integration via BGP
- Real enterprise hybrid design

→ [[04-Networking-BGP-Flow]]

---

### 4. Global Entry via CloudFront
- Improves latency
- Adds security layer

→ [[02-AWS-Deep-Dive]]

---

## 📌 Diagram Notes

- All compute is private
- Only CloudFront is public
- Database is isolated
- Routing is dynamic (BGP)
- Multi-region connectivity is fully automated

---

## 🏁 What This Diagram Demonstrates

- Enterprise-grade cloud architecture  
- Secure multi-cloud design  
- Global traffic routing  
- High availability and scalability  
- Infrastructure automation readiness  

---

## 👉 Next Step

➡️ [[02-AWS-Deep-Dive]] (Tokyo Authority Architecture)