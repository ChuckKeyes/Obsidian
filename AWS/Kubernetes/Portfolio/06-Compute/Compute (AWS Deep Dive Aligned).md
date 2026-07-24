
## 📖 Executive Summary (30-Second Read)

Global compute is deployed across AWS and GCP using a **stateless EC2 architecture**, fronted by **CloudFront + ALB**, and automated through **Jenkins + Terraform CI/CD**.

- 🌏 Multi-region (Tokyo + São Paulo + GCP)
- 🔁 Stateless, horizontally scalable
- 🔐 Secure (no public EC2 access)
- 🤖 Fully automated deployments

---

## 🏗️ AWS Compute Flow (MATCHES Diagram #2)

This section directly maps to your **AWS Deep Dive diagram**:

CloudFront → WAF → ALB → EC2 (Private Subnets) → RDS (Tokyo)

### 🔹 Traffic Flow

1. User hits:
    - `www.keyescloudsolutions.com`
2. Routed through:
    - **CloudFront (Global Entry)**
    - **AWS WAF (Security Layer)**
3. Forwarded to:
    - **Application Load Balancer (ALB)**
    - Only accepts traffic from CloudFront
4. Distributed to:
    - **EC2 Instances (Private Subnets)**
5. Application connects to:
    - **RDS (Tokyo only)**

---

## 📸 Screenshot — Traffic Entry (ADD HERE)

👉 Place:

- CloudFront distribution
- WAF attached
- Route53 DNS

📂 Screenshots/aws/  
- cloudfront-distribution.png  
- waf-web-acl.png  
- route53-records.png

---

## ⚙️ EC2 Compute Layer

### 🔹 Design

- Private subnets (NO public IPs)
- Access only via ALB
- NGINX web server
- Pulls assets from S3

---

## 📸 Screenshot — EC2 Layer (ADD HERE)

👉 Place:

📂 Screenshots/aws/  
- ec2-instances-running.png  
- ec2-private-subnet.png

---

## 🔁 Stateless Architecture (KEY INTERVIEW POINT)

> No compute node stores data locally.

### 🔹 Data Sources

- **RDS (Tokyo)** → all sensitive data
- **S3** → static assets

---

### 💡 Why This Matters

- Replace any instance instantly
- Scale across regions
- No data inconsistency
- Enables multi-cloud

---

## 📸 Screenshot — App Running (ADD HERE)

👉 Place:

📂 Screenshots/  
- app-running-cloudfront.png  
- nginx-page.png

---

## 📈 Scaling Strategy

- ALB distributes traffic
- Designed for Auto Scaling
- Stateless = infinite horizontal scale

---

## 📸 Screenshot — Load Balancer (ADD HERE)

👉 Place:

📂 Screenshots/aws/  
- alb-target-group-healthy.png  
- alb-listener-rules.png

---

## 🤖 CI/CD Pipeline (Supports Compute)

Compute is deployed automatically using:

- **Jenkins**
- **Terraform**
- **GitHub Webhooks**

---

### 🔄 Flow

GitHub → Webhook → Jenkins → Terraform → AWS Infrastructure

---

## 📸 Screenshot — CI/CD Proof (ADD HERE)

👉 Place:

📂 Screenshots/jenkins/  
- jenkins-pipeline-success.png  
- webhook-history.png  
- terraform-apply-output.png

Based on your implementation:

---

## 🔐 Security Model (ALIGNED WITH DIAGRAM)

- CloudFront = global entry
- WAF = filtering layer
- ALB = controlled access
- EC2 = private only
- IAM roles for S3 access
- Origin header validation (CloudFront → ALB)

---

## 📸 Screenshot — Security Proof (ADD HERE)

👉 Place:

📂 Screenshots/aws/  
- alb-403-direct-access.png  
- security-group-cloudfront-only.png

---

## 🌍 Multi-Region Compute Strategy

### AWS

- **Tokyo**
    - Full stack (compute + database)
- **São Paulo**
    - Compute only
    - Routes to Tokyo DB via TGW

---

### GCP (Lab4 Extension)

- Iowa + NY
- Stateless compute
- Connected via:
    - HA VPN
    - BGP
    - NCC

---



> “Compute is fully stateless and deployed across multiple regions.  
> Traffic enters through CloudFront and is securely routed to private EC2 instances behind an ALB.  
> All infrastructure is deployed automatically using Terraform through a Jenkins pipeline triggered by GitHub webhooks.  
> This allows consistent, scalable, and secure global application delivery while keeping sensitive data centralized in Tokyo.”

---

## 🚀 Key Takeaways (SCAN-FAST)

- ✅ Stateless EC2 architecture
- ✅ Multi-region compute (AWS + GCP)
- ✅ CloudFront + ALB secure entry
- ✅ CI/CD automated infrastructure
- ✅ Production-style design (not a lab)