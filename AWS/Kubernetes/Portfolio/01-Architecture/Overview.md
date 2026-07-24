# 🌍 Global Secure Multi-Cloud Architecture (AWS + GCP)

## 🎯 Objective
Design and implement a secure, highly available multi-cloud architecture connecting AWS and GCP using dynamic BGP routing over HA VPN, while enforcing strict data residency and security controls.

---

## 🏗️ Architecture Overview
![[lab4-architecture.png]]

This architecture connects multiple global regions into a unified, secure network:

### 🌎 Regions
- **AWS Tokyo (ap-northeast-1)** → Primary region (Authoritative Database)
- **AWS São Paulo (sa-east-1)** → Secondary compute region
- **GCP Iowa (us-central1)** → Branch network
- **GCP NY (simulated branch)** → Additional access network

---

## 🔧 Key Technologies
- AWS Transit Gateway (TGW)
- GCP Network Connectivity Center (NCC)
- HA VPN with BGP (dynamic routing)
- Terraform (Infrastructure as Code)
- CloudFront (global entry point)
- Route 53 (DNS)

---

## 🔄 High-Level Flow
1. Users connect via CloudFront (global edge)
2. Requests route to AWS Tokyo or São Paulo
3. Internal services communicate across regions via TGW
4. GCP environments connect via NCC + HA VPN
5. All traffic is dynamically routed using BGP

---

## 🔐 Security Design (Summary)
- Private subnets for application and database tiers
- No direct internet access to backend systems
- IAM roles enforce least privilege
- WAF / Cloud Armor protect edge access
- Encrypted traffic over VPN tunnels

---

## 📊 Key Design Decisions
- **Tokyo as authoritative region** → Ensures compliance and data control
- **Stateless compute in São Paulo** → Scalable and cost-efficient
- **Hybrid connectivity (AWS ↔ GCP)** → Enables global testing and expansion
- **Dynamic routing (BGP)** → Eliminates manual route management

---

## 🧪 Validation
- Terraform apply completed successfully
- VPN tunnels established and BGP sessions active
- Cross-region connectivity verified via CLI
- Web application accessible globally

---

## 📸 Proof of Implementation

This section provides real-world validation that the architecture is fully deployed, connected, and operational across AWS and GCP.

---

### ⚙️ Terraform Deployment (Infrastructure as Code)

![[../Screenshots/terraform/terraform-init.png]]

![[../Screenshots/terraform/terraform-plan.png]]

![[../Screenshots/terraform/terraform-apply.png]]

![[../Screenshots/terraform/terraform-outputs.png]]

👉 Confirms:
- Infrastructure deployed successfully
- Multi-region resources created
- Outputs exported correctly

---

### ⚙️ CI/CD Pipeline (Jenkins Automation)

![[../Screenshots/jenkins-success.png]]

👉 Confirms:
- GitHub webhook triggers Jenkins
- Terraform executed automatically
- Successful pipeline execution

---

### ☁️ AWS Infrastructure

![[../Screenshots/aws/aws-vpc-console.png]]

![[../Screenshots/aws/aws-subnets.png]]

![[../Screenshots/aws/aws-security-groups.png]]

![[../Screenshots/aws/aws-transit-gateway.png]]

![[../Screenshots/aws/aws-ec2-running.png]]

👉 Confirms:
- VPC and subnet segmentation
- Secure network configuration
- Transit Gateway operational
- EC2 instances running in private architecture

---

### ☁️ GCP Infrastructure (NCC + HA VPN + BGP)

![[../Screenshots/gcp/gcp-vpc-network.png]]

![[../Screenshots/gcp/gcp-ncc-hub.png]]

![[../Screenshots/gcp/gcp-ncc-spokes.png]]

![[../Screenshots/gcp/gcp-vpn-status.png]]

![[../Screenshots/gcp/BGP-VPN.png]]

![[../Screenshots/gcp/gcp-vm-instances.png]]

👉 Confirms:
- NCC hub and spokes configured
- HA VPN tunnels established
- BGP sessions active
- GCP VMs deployed and reachable

---

### 🔗 Hybrid Connectivity Validation

- AWS ↔ GCP routing verified via BGP
- Cross-cloud communication confirmed
- No overlapping CIDR ranges
- Secure encrypted tunnels in place

---

## 🧠 Summary

The above evidence demonstrates:

- Fully automated infrastructure deployment (Terraform)
- Functional CI/CD pipeline (Jenkins)
- Secure AWS and GCP environments
- Active hybrid connectivity using HA VPN and BGP
- Production-ready multi-cloud architecture
---

## 🧠 Summary
This project demonstrates a real-world enterprise architecture combining:
- Multi-cloud networking
- Secure infrastructure design
- Infrastructure as Code automation
- Global scalability and resilience