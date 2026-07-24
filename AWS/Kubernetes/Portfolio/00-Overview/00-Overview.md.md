# 🌍 Global Secure Multi-Cloud Architecture (AWS + GCP)

---

## 🧾 Executive Summary

This project demonstrates the design and deployment of a **secure, highly available, multi-cloud architecture** connecting AWS and GCP using BGP-based VPN, Transit Gateway (TGW), and Network Connectivity Center (NCC).

The system simulates a **global enterprise environment**, where application traffic is distributed across regions, while maintaining a **centralized, compliant database layer** in Tokyo.

Users connect through a **single global entry point** via CloudFront, which enforces security and routes traffic to private infrastructure.

---

## 🔗 Quick Navigation (CLICK THESE)

- [[01-Architecture/Overview.md|Architecture]]
- [[02-AWS/AWS Deep Dive – Tokyo Authority (ap-northeast-1).md|AWS Deep Dive]]
- [[03-GCP/GCP Networking – NCC + HA VPN + BGP.md|GCP Networking]]
- [[04-Networking/BGP-VPN-Flow.md.md|Networking / BGP Flow]]
- [[05-Terraform/Infrastructure as Code.md|Terraform]]
- [[06-Compute/Automated Infrastructure Deployment with Jenkins, Terraform, and AWS.md|Compute]]
- [[07-Databases/Database-Architecture.md.md|Database]]
- [[08-Logging-Monitoring/Logging & Monitoring (Observability).md|Monitoring]]
- [[09-CI-CD/CI-CD Pipeline (Jenkins + Terraform).md|CI/CD]]
- [[10-Challenges/Challenges & Solutions.md|Challenges]]
- [[11-Final-Results/Final Results.md|Final Results]]

---

## 🎯 Project Objectives

- Build a **multi-cloud architecture (AWS + GCP)**
- Implement **secure connectivity using HA VPN + BGP**
- Use **Transit Gateway (TGW)** for AWS routing → [[04-Networking/BGP-VPN-Flow.md.md]]
- Use **Network Connectivity Center (NCC)** → [[03-GCP/GCP Networking – NCC + HA VPN + BGP.md]]
- Enforce **centralized database compliance** → [[07-Databases/Database-Architecture.md.md]]
- Deploy infrastructure using **Terraform (IaC)** → [[05-Terraform/Infrastructure as Code.md]]
- Automate deployments with **Jenkins CI/CD** → [[09-CI-CD/CI-CD Pipeline (Jenkins + Terraform).md]]
- Implement **monitoring and observability** → [[08-Logging-Monitoring/Logging & Monitoring (Observability).md]]

---

## 🌍 Regions & Topology

### AWS Regions
- Tokyo (Primary / Database) → [[02-AWS/AWS Deep Dive – Tokyo Authority (ap-northeast-1).md]]
- São Paulo (Compute) → [[06-Compute/Automated Infrastructure Deployment with Jenkins, Terraform, and AWS.md]]

### GCP Regions
- Iowa → [[03-GCP/GCP Networking – NCC + HA VPN + BGP.md]]
- New York (Branch VPC) → [[03-GCP/GCP Networking – NCC + HA VPN + BGP.md]]

---

## 🧱 Core Architecture Components

### 🌐 Global Entry Layer
- CloudFront → [[01-Architecture/Overview.md]]
- Route 53 (DNS) → [[01-Architecture/Overview.md]]
- WAF (Security) → [[02-AWS/AWS Deep Dive – Tokyo Authority (ap-northeast-1).md]]

---

### 🖥️ Application Layer
- EC2 instances (private subnets) → [[06-Compute/Automated Infrastructure Deployment with Jenkins, Terraform, and AWS.md]]
- Nginx (web layer) → [[06-Compute/Automated Infrastructure Deployment with Jenkins, Terraform, and AWS.md]]
- Stateless scaling design

---

### 🗄️ Data Layer
- RDS (Tokyo primary DB) → [[07-Databases/Database-Architecture.md.md]]
- Centralized data model for compliance

---

### 🔀 Networking Layer
- Transit Gateway (TGW) → [[04-Networking/BGP-VPN-Flow.md.md]]
- TGW Peering (Tokyo ↔ São Paulo) → [[04-Networking/BGP-VPN-Flow.md.md]]
- HA VPN (AWS ↔ GCP) → [[03-GCP/GCP Networking – NCC + HA VPN + BGP.md]]
- NCC Hub → [[03-GCP/GCP Networking – NCC + HA VPN + BGP.md]]
- BGP Routing → [[04-Networking/BGP-VPN-Flow.md.md]]

---

### 📊 Monitoring & Observability
- CloudWatch → [[08-Logging-Monitoring/Logging & Monitoring (Observability).md]]
- GCP Monitoring → [[08-Logging-Monitoring/Logging & Monitoring (Observability).md]]
- Prometheus + Grafana → [[08-Logging-Monitoring/Logging & Monitoring (Observability).md]]

---

### 🔄 CI/CD & Automation
- Jenkins → [[09-CI-CD/CI-CD Pipeline (Jenkins + Terraform).md]]
- GitHub → [[09-CI-CD/CI-CD Pipeline (Jenkins + Terraform).md]]
- Terraform → [[05-Terraform/Infrastructure as Code.md]]

---

## 🔐 Security Design

- CloudFront + WAF protects all inbound traffic → [[02-AWS/AWS Deep Dive – Tokyo Authority (ap-northeast-1).md]]
- ALB restricted to CloudFront only → [[02-AWS/AWS Deep Dive – Tokyo Authority (ap-northeast-1).md]]
- Private subnets for compute → [[06-Compute/Automated Infrastructure Deployment with Jenkins, Terraform, and AWS.md]]
- No direct DB access → [[07-Databases/Database-Architecture.md.md]]
- Secure VPN tunnels → [[03-GCP/GCP Networking – NCC + HA VPN + BGP.md]]

---

## 🧠 Architecture Highlights

- Multi-cloud connectivity using BGP → [[04-Networking/BGP-VPN-Flow.md.md]]
- Centralized database design → [[07-Databases/Database-Architecture.md.md]]
- Stateless compute → [[06-Compute/Automated Infrastructure Deployment with Jenkins, Terraform, and AWS.md]]
- Secure global entry point → [[01-Architecture/Overview.md]]
- Fully automated deployment → [[05-Terraform/Infrastructure as Code.md]] + [[09-CI-CD/CI-CD Pipeline (Jenkins + Terraform).md]]

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

➡️ [[01-Architecture/Overview.md|Architecture (Main Diagram + Full System View)]]