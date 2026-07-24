# 🧰 Infrastructure as Code – Terraform

---

## 🧭 Overview

This project uses **Terraform** to fully automate the deployment of a **multi-cloud architecture across AWS and GCP**, including networking, compute, database, and CI/CD components.

All infrastructure is defined as code, enabling:

- Repeatable deployments  
- Version-controlled infrastructure  
- Rapid environment provisioning  
- Reduced manual configuration errors  

---

## 🔗 Quick Navigation

- [[01-Architecture]]
- [[02-AWS-Deep-Dive]]
- [[03-GCP-Networking]]
- [[04-Networking-BGP-Flow]]
- [[09-CI-CD]]

---

## 🧱 Terraform Scope

### AWS Resources
- VPCs (Tokyo, São Paulo)
- Subnets (public + private)
- EC2 instances
- ALB
- RDS (database)
- Transit Gateway (TGW)
- TGW Peering
- Route Tables

---

### GCP Resources
- VPC networks (Iowa, NY)
- Subnets
- HA VPN Gateway
- Cloud Router (BGP)
- NCC Hub + Spokes

---

### Shared Components
- Security Groups / Firewall Rules
- IAM roles
- Outputs for cross-module communication

---

## 🏗️ Project Structure

```text id="2x64m7"
terraform/
│
├── main.tf
├── variables.tf
├── outputs.tf
│
├── modules/
│   ├── tokyo_authority/
│   ├── tokyo_tgw/
│   ├── saopaulo_core/
│   ├── saopaulo_tgw/
│   ├── gcp_network/
│   ├── vpn_bgp/
│   ├── ncc_hub/
│   └── peering_resources/
