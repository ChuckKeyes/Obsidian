# 🏗️ Architecture Diagram 

## 🌍 Global Multi-Cloud Architecture
![[lab4-architecture.png]]

---

## 🧠 Diagram Explanation

This diagram represents a secure, hybrid multi-cloud architecture connecting AWS and GCP environments.

---

## ☁️ AWS Components

### Tokyo (Primary Region)
- VPC with public and private subnets
- Application Load Balancer (ALB)
- EC2 instances (private)
- RDS database (authoritative data source)

### São Paulo (Secondary Region)
- Stateless compute layer
- Connected via AWS Transit Gateway (TGW)

---

## ☁️ GCP Components

### Iowa & NY VPCs
- Test and branch environments
- Connected via HA VPN

### Network Connectivity Center (NCC)
- Central hub for routing
- Manages connectivity between GCP networks and AWS

---

## 🌐 Networking Layer

- AWS Transit Gateway connects AWS regions
- HA VPN connects AWS ↔ GCP
- BGP dynamically exchanges routes
- NCC acts as central routing hub in GCP

---

## 🔐 Security Layers

- WAF / Cloud Armor at edge
- IAM roles control access
- Private subnets isolate backend systems
- Encrypted VPN tunnels protect data in transit

---

## 🎯 Key Takeaways

- Fully private backend architecture
- Global connectivity with dynamic routing
- Secure hybrid cloud design
- Scalable and resilient system

---

## 🔗 Related Diagrams

- [[Network-Flow]]
- [[AWS Deep Dive]] (add later)