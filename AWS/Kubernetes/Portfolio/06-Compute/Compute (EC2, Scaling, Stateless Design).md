
## 📖 Executive Summary

This section demonstrates how application workloads are deployed and operated across a **global, multi-cloud architecture** using Amazon EC2.

Compute resources are designed to be **stateless, scalable, and securely integrated** with centralized services, while deployment is fully automated using a CI/CD pipeline (Jenkins + Terraform).

---

## 🎯 Objectives

- Deploy application servers using **Amazon EC2**
- Implement a **stateless compute architecture**
- Enable **horizontal scaling across regions**
- Automate infrastructure deployment using **Jenkins + Terraform**
- Support **multi-cloud connectivity (AWS + GCP)**

---

## 🏗️ Compute Architecture

This project distributes compute across multiple regions while keeping data centralized:

### 🌏 AWS Regions

- **Tokyo (Primary Region)**
    - Hosts application servers
    - Connects directly to RDS (database)
- **São Paulo (Secondary Region)**
    - Stateless compute only
    - No local database
    - Routes traffic to Tokyo via **Transit Gateway (TGW)**

---

### ☁️ GCP Regions

- **Iowa (us-central1)**
- **New York (simulated branch)**

Both:

- Operate as **stateless compute layers**
- Connect to AWS via:
    - **HA VPN**
    - **BGP routing**
    - **Network Connectivity Center (NCC)**

---

## ⚙️ EC2 Design

Each compute node is designed for security and simplicity:

- Deployed in **private subnets**
- **No public IP addresses**
- Accessed only through:
    - **Application Load Balancer (ALB)**
    - **CloudFront (global entry point)**

### 🧩 Application Stack

- **NGINX** web server
- Static content pulled from **Amazon S3**
- Dynamic data retrieved from **RDS (Tokyo only)**

---

## 🔁 Stateless Architecture

> **All compute instances are stateless.**

### 🔑 Key Principle

No application data is stored locally on EC2 instances.

### 📦 Data Sources

- **Database:** Amazon RDS (Tokyo)
- **Assets:** Amazon S3

### 🚀 Benefits

- Instances can be:
    - Replaced instantly
    - Scaled horizontally
    - Deployed in any region
- Enables:
    - High availability
    - Multi-region failover
    - Consistent deployments

---

## 📈 Scaling Strategy

The architecture supports **horizontal scaling**:

- **Application Load Balancer (ALB)**
    - Distributes traffic across EC2 instances
- **Auto Scaling (Design Ready)**
    - Scale out under load
    - Scale in when idle
- **Stateless design**
    - Ensures new instances require no special configuration

---

## 🤖 CI/CD Integration (Jenkins + Terraform)

Compute infrastructure is deployed automatically using a CI/CD pipeline.

### 🔄 Pipeline Flow

1. Code pushed to GitHub
2. GitHub webhook triggers Jenkins
3. Jenkins executes Terraform:
    - `init`
    - `plan`
    - `apply`
4. Infrastructure is deployed or updated automatically

This implementation ensures:

- Consistent environments
- Zero manual provisioning
- Fast deployment cycles

Based on your pipeline implementation:

---

## 🔐 Security Model

Compute resources follow strict security controls:

- **No direct internet access to EC2**
- **ALB is the only entry point**
- **CloudFront restricts origin access to ALB**
- **IAM roles used for secure S3 access**
- No hardcoded credentials in code or instances

---

## 📸 Proof (Screenshots to Include)

Add the following to this section in Obsidian:

- EC2 instances running (AWS Console)
- ALB target group health (healthy instances)
- Terraform `apply` success output
- Jenkins pipeline success (console output)
- Application running via CloudFront URL


“The compute layer is fully stateless and distributed across AWS and GCP.  
All infrastructure is deployed using Terraform through a Jenkins CI/CD pipeline triggered by GitHub webhooks.  
This allows consistent, repeatable deployments and enables horizontal scaling across multiple global regions, while keeping all sensitive data centralized in Tokyo.”

## 🔗 Related Sections

- [[05-Terraform]] → Infrastructure as Code
- [[04-Networking-BGP-Flow]] → Cross-region routing
- [[07-Database]] → Centralized data layer
- [[01-Architecture]] → Full system diagram

---

## 🚀 Key Takeaways

- Built **real-world compute architecture**, not just VMs
- Designed for **global scale and high availability**
- Implemented **stateless application design**
- Automated deployments with **CI/CD + Terraform**
- Integrated compute across **multi-cloud environments (AWS + GCP)**