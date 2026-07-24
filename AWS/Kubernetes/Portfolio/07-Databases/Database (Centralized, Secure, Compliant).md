
## 📖 Executive Summary (30-Second Read)

The database layer is centralized in **AWS Tokyo** to enforce strict **data residency and compliance**, while all other regions operate as **stateless compute layers**.

- 🇯🇵 Data stored ONLY in Tokyo
- 🔐 Private, no public access
- 🌍 Global access via secure networking (TGW + VPN)
- ⚖️ Designed for compliance over latency

---

## 🏗️ Database Flow (MATCHES Diagram #2)

This aligns directly with your **AWS Deep Dive diagram**:

CloudFront → ALB → EC2 → RDS (Tokyo only)

---

### 🔹 Application Flow

1. User → CloudFront
2. CloudFront → ALB
3. ALB → EC2 (private subnet)
4. EC2 → RDS (private subnet)

👉 **Database is NEVER exposed to the internet**

---

## 📸 Screenshot — DB Access Flow (ADD HERE)

📂 Screenshots/aws/  
- architecture-diagram-highlight-db.png

---

## 🎯 Core Design

### Primary Database (AWS Tokyo)

- **Amazon RDS (MySQL / PostgreSQL)**
- Private subnets only
- No public endpoint
- Multi-AZ capable

---

## 📸 Screenshot — RDS Instance (ADD HERE)

📂 Screenshots/aws/  
- rds-instance-details.png  
- rds-private-subnet.png

---

## 🔐 Data Residency & Compliance

### 🚨 Key Rule

> **All PHI (Protected Health Information) stays in Tokyo**

---

### Why This Matters

- Meets regulatory requirements
- Prevents cross-border data exposure
- Centralizes audit and control

---

## 🚫 No Data Outside Tokyo

- **São Paulo**
    - Compute only
    - No database
- **GCP (Iowa / NY)**
    - Compute only
    - No database

👉 This is **intentional architecture**, not a limitation

---

## 🌍 Cross-Region / Cross-Cloud Access

### 🔹 AWS (São Paulo)

EC2 (São Paulo) → TGW → Tokyo VPC → RDS

---

### 🔹 GCP (Lab4 Extension)

GCP VM → NCC → VPN → AWS TGW → Tokyo → RDS

---

## 📸 Screenshot — Networking to DB (ADD HERE)

📂 Screenshots/aws/  
- tgw-route-table.png  
  
📂 Screenshots/gcp/  
- ncc-spokes.png  
- vpn-tunnels.png

---

## 🔐 Security Model (CRITICAL)

### Network Security

- RDS in **private subnets only**
- No public IP
- No internet routing

---

### Access Control

- Only EC2 security group can connect
- No direct DB access from users
- No open ports (0.0.0.0/0 ❌)

---

### Encryption

- **At rest:** RDS encryption enabled
- **In transit:** TLS / VPN

---

## 📸 Screenshot — Security Proof (ADD HERE)

📂 Screenshots/aws/  
- rds-security-group.png  
- no-public-access.png

---

## 🔁 Availability & Reliability

- Multi-AZ capable
- Automated backups
- Failover support

---

## ⚖️ Tradeoffs (INTERVIEW GOLD)

This design intentionally prioritizes:

### ✅ Strengths

- Maximum security
- Regulatory compliance
- Centralized control

---

### ⚠️ Tradeoffs

- Higher latency from distant regions
- Dependency on VPN / TGW
- No global DB replication

---

## 🧠 Design Decisions (IMPORTANT)

### Why Centralized Database?

- Avoids data inconsistency across regions
- Eliminates PHI exposure risk
- Simplifies compliance audits

---

### Why No Replication?

- Prevents sensitive data leaving Japan
- Reduces attack surface
- Keeps architecture controlled

---

## 🤖 Infrastructure as Code

Database deployed using **Terraform**:

- RDS instance
- Subnet groups
- Security groups
- Parameter configs

👉 Fully repeatable + version controlled

---

## 📸 Screenshot — Terraform Proof (ADD HERE)

📂 Screenshots/terraform/  
- terraform-rds-plan.png  
- terraform-rds-apply.png

---

## 🧪 Validation

- RDS NOT publicly accessible
- Only EC2 can connect
- Application successfully reads/writes data
- No external region stores PHI

---

## 🧠 Interview Explanation (RECRUITER GOLD)

> “The database is centralized in AWS Tokyo to enforce strict data residency and compliance.  
> All compute layers across AWS and GCP are stateless and access the database securely over private networking using Transit Gateway and VPN.  
> This ensures global scalability while maintaining full control over sensitive data.”

---

## 🚀 Key Takeaways (SCAN-FAST)

- ✅ Centralized RDS in Tokyo
- ✅ No public database access
- ✅ Multi-cloud secure connectivity
- ✅ Compliance-first architecture
- ✅ Stateless global compute