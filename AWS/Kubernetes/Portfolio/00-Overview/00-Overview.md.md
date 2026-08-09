# 🌍 Global Secure Multi-Cloud Architecture (AWS + GCP)

---

## 🧾 Executive Summary

This project demonstrates the design and deployment of a **secure, highly available, multi-cloud architecture** connecting AWS and GCP using BGP-based VPN, Transit Gateway (TGW), and Network Connectivity Center (NCC).

The system simulates a **global enterprise environment**, where application traffic is distributed across regions, while maintaining a **centralized, compliant database layer** in Tokyo.

Users connect through a **single global entry point** via CloudFront, which enforces security and routes traffic to private infrastructure.

---

## 🔗 Quick Navigation (CLICK THESE)

- [[Portfolio Files/Cloud-Portfolio/99-Archive/01-Architecture/Overview|Architecture]]
- [[Portfolio Files/Cloud-Portfolio/99-Archive/02-AWS/AWS Deep Dive – Tokyo Authority (ap-northeast-1)|AWS Deep Dive]]
- [[Portfolio Files/Cloud-Portfolio/99-Archive/03-GCP/GCP Networking – NCC + HA VPN + BGP|GCP Networking]]
- [[Portfolio Files/Cloud-Portfolio/99-Archive/04-Networking/BGP-VPN-Flow.md|Networking / BGP Flow]]
- [[Portfolio Files/Cloud-Portfolio/99-Archive/05-Terraform/Infrastructure as Code|Terraform]]
- [[Portfolio Files/Cloud-Portfolio/99-Archive/06-Compute/Automated Infrastructure Deployment with Jenkins, Terraform, and AWS|Compute]]
- [[Portfolio Files/Cloud-Portfolio/99-Archive/07-Databases/Database-Architecture.md|Database]]
- [[Portfolio Files/Cloud-Portfolio/99-Archive/08-Logging-Monitoring/Logging & Monitoring (Observability)|Monitoring]]
- [[Portfolio Files/Cloud-Portfolio/99-Archive/09-CI-CD/CI-CD Pipeline (Jenkins + Terraform)|CI/CD]]
- [[Portfolio Files/Cloud-Portfolio/99-Archive/10-Challenges/Challenges & Solutions|Challenges]]
- [[Portfolio Files/Cloud-Portfolio/99-Archive/11-Final-Results/Final Results|Final Results]]

---

## 🎯 Project Objectives

- Build a **multi-cloud architecture (AWS + GCP)**
- Implement **secure connectivity using HA VPN + BGP**
- Use **Transit Gateway (TGW)** for AWS routing → [[Portfolio Files/Cloud-Portfolio/99-Archive/04-Networking/BGP-VPN-Flow.md]]
- Use **Network Connectivity Center (NCC)** → [[Portfolio Files/Cloud-Portfolio/99-Archive/03-GCP/GCP Networking – NCC + HA VPN + BGP]]
- Enforce **centralized database compliance** → [[Portfolio Files/Cloud-Portfolio/99-Archive/07-Databases/Database-Architecture.md]]
- Deploy infrastructure using **Terraform (IaC)** → [[Portfolio Files/Cloud-Portfolio/99-Archive/05-Terraform/Infrastructure as Code]]
- Automate deployments with **Jenkins CI/CD** → [[Portfolio Files/Cloud-Portfolio/99-Archive/09-CI-CD/CI-CD Pipeline (Jenkins + Terraform)]]
- Implement **monitoring and observability** → [[Portfolio Files/Cloud-Portfolio/99-Archive/08-Logging-Monitoring/Logging & Monitoring (Observability)]]

---

## 🌍 Regions & Topology

### AWS Regions
- Tokyo (Primary / Database) → [[Portfolio Files/Cloud-Portfolio/99-Archive/02-AWS/AWS Deep Dive – Tokyo Authority (ap-northeast-1)]]
- São Paulo (Compute) → [[Portfolio Files/Cloud-Portfolio/99-Archive/06-Compute/Automated Infrastructure Deployment with Jenkins, Terraform, and AWS]]

### GCP Regions
- Iowa → [[Portfolio Files/Cloud-Portfolio/99-Archive/03-GCP/GCP Networking – NCC + HA VPN + BGP]]
- New York (Branch VPC) → [[Portfolio Files/Cloud-Portfolio/99-Archive/03-GCP/GCP Networking – NCC + HA VPN + BGP]]

---

## 🧱 Core Architecture Components

### 🌐 Global Entry Layer
- CloudFront → [[Portfolio Files/Cloud-Portfolio/99-Archive/01-Architecture/Overview]]
- Route 53 (DNS) → [[Portfolio Files/Cloud-Portfolio/99-Archive/01-Architecture/Overview]]
- WAF (Security) → [[Portfolio Files/Cloud-Portfolio/99-Archive/02-AWS/AWS Deep Dive – Tokyo Authority (ap-northeast-1)]]

---

### 🖥️ Application Layer
- EC2 instances (private subnets) → [[Portfolio Files/Cloud-Portfolio/99-Archive/06-Compute/Automated Infrastructure Deployment with Jenkins, Terraform, and AWS]]
- Nginx (web layer) → [[Portfolio Files/Cloud-Portfolio/99-Archive/06-Compute/Automated Infrastructure Deployment with Jenkins, Terraform, and AWS]]
- Stateless scaling design

---

### 🗄️ Data Layer
- RDS (Tokyo primary DB) → [[Portfolio Files/Cloud-Portfolio/99-Archive/07-Databases/Database-Architecture.md]]
- Centralized data model for compliance

---

### 🔀 Networking Layer
- Transit Gateway (TGW) → [[Portfolio Files/Cloud-Portfolio/99-Archive/04-Networking/BGP-VPN-Flow.md]]
- TGW Peering (Tokyo ↔ São Paulo) → [[Portfolio Files/Cloud-Portfolio/99-Archive/04-Networking/BGP-VPN-Flow.md]]
- HA VPN (AWS ↔ GCP) → [[Portfolio Files/Cloud-Portfolio/99-Archive/03-GCP/GCP Networking – NCC + HA VPN + BGP]]
- NCC Hub → [[Portfolio Files/Cloud-Portfolio/99-Archive/03-GCP/GCP Networking – NCC + HA VPN + BGP]]
- BGP Routing → [[Portfolio Files/Cloud-Portfolio/99-Archive/04-Networking/BGP-VPN-Flow.md]]

---

### 📊 Monitoring & Observability
- CloudWatch → [[Portfolio Files/Cloud-Portfolio/99-Archive/08-Logging-Monitoring/Logging & Monitoring (Observability)]]
- GCP Monitoring → [[Portfolio Files/Cloud-Portfolio/99-Archive/08-Logging-Monitoring/Logging & Monitoring (Observability)]]
- Prometheus + Grafana → [[Portfolio Files/Cloud-Portfolio/99-Archive/08-Logging-Monitoring/Logging & Monitoring (Observability)]]

---

### 🔄 CI/CD & Automation
- Jenkins → [[Portfolio Files/Cloud-Portfolio/99-Archive/09-CI-CD/CI-CD Pipeline (Jenkins + Terraform)]]
- GitHub → [[Portfolio Files/Cloud-Portfolio/99-Archive/09-CI-CD/CI-CD Pipeline (Jenkins + Terraform)]]
- Terraform → [[Portfolio Files/Cloud-Portfolio/99-Archive/05-Terraform/Infrastructure as Code]]

---

## 🔐 Security Design

- CloudFront + WAF protects all inbound traffic → [[Portfolio Files/Cloud-Portfolio/99-Archive/02-AWS/AWS Deep Dive – Tokyo Authority (ap-northeast-1)]]
- ALB restricted to CloudFront only → [[Portfolio Files/Cloud-Portfolio/99-Archive/02-AWS/AWS Deep Dive – Tokyo Authority (ap-northeast-1)]]
- Private subnets for compute → [[Portfolio Files/Cloud-Portfolio/99-Archive/06-Compute/Automated Infrastructure Deployment with Jenkins, Terraform, and AWS]]
- No direct DB access → [[Portfolio Files/Cloud-Portfolio/99-Archive/07-Databases/Database-Architecture.md]]
- Secure VPN tunnels → [[Portfolio Files/Cloud-Portfolio/99-Archive/03-GCP/GCP Networking – NCC + HA VPN + BGP]]

---

## 🧠 Architecture Highlights

- Multi-cloud connectivity using BGP → [[Portfolio Files/Cloud-Portfolio/99-Archive/04-Networking/BGP-VPN-Flow.md]]
- Centralized database design → [[Portfolio Files/Cloud-Portfolio/99-Archive/07-Databases/Database-Architecture.md]]
- Stateless compute → [[Portfolio Files/Cloud-Portfolio/99-Archive/06-Compute/Automated Infrastructure Deployment with Jenkins, Terraform, and AWS]]
- Secure global entry point → [[Portfolio Files/Cloud-Portfolio/99-Archive/01-Architecture/Overview]]
- Fully automated deployment → [[Portfolio Files/Cloud-Portfolio/99-Archive/05-Terraform/Infrastructure as Code]] + [[Portfolio Files/Cloud-Portfolio/99-Archive/09-CI-CD/CI-CD Pipeline (Jenkins + Terraform)]]

---

## 🏁 Outcome

This project demonstrates a **production-style global system** with:

- Secure multi-region deployment  
- Cross-cloud connectivity  
- Scalable application infrastructure  
- Centralized data governance  
- Automated infrastructure provisioning  

---

## 📌 What This Proves

- Cloud Architecture Design  
- Multi-Cloud Networking  
- Infrastructure as Code  
- CI/CD Automation  
- Secure System Design  
- Monitoring & Observability  

---

## 👉 Start Here

➡️ [[Portfolio Files/Cloud-Portfolio/99-Archive/01-Architecture/Overview|Architecture (Main Diagram + Full System View)]]