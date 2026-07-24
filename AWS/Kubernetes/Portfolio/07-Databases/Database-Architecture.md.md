
# 🗄️ Database Architecture

> All sensitive data is restricted to the Tokyo region to meet compliance and security requirements. Other regions operate as stateless compute layers only.

---

## 🎯 Objective

Design a secure, compliant, and highly available database architecture where all sensitive data remains in the primary AWS Tokyo region, while supporting global application access.

---

## 🧩 Architecture Pattern

This design follows a common enterprise pattern:

👉 **Centralized Data + Distributed Compute**

- Sensitive data remains in a single compliant region (Tokyo)
- Compute layers scale globally
- All access to data is controlled through private networking

This pattern is widely used in:

- Healthcare systems
- Financial platforms
- Global SaaS applications

---

## 🧠 Architecture Overview

The database layer is centralized in:

- **AWS Tokyo (Primary Region)**

Other regions (São Paulo, GCP) are:

- Stateless
- Do NOT store sensitive data
- Access the database securely over private network connections

---

## 🏗️ Core Design

### Primary Database (AWS Tokyo)

- Amazon RDS for MySQL _(or PostgreSQL — choose your actual engine)_
- Deployed in **private subnets**
- No public access
- Multi-AZ capable (for high availability)

---

## 🔐 Data Residency & Compliance

### Key Rule

👉 **All PHI (Protected Health Information) stays in Tokyo**

This ensures:

- Regulatory compliance
- Data sovereignty
- Centralized control of sensitive information

---

## 🚫 No Data Outside Tokyo

- São Paulo → compute only
- GCP → compute only
- No database replication outside Japan

---

## 🔗 Database Access Flow

### Application Access

1. User → CloudFront
2. CloudFront → ALB (Tokyo)
3. ALB → EC2 (private)
4. EC2 → RDS (private)

---

### Cross-Cloud Access

1. GCP VM → NCC → VPN
2. VPN → AWS Transit Gateway
3. TGW → Tokyo VPC
4. EC2 → RDS

---

## 🔐 Security Design

### Network Security

- RDS deployed in private subnets only
- No public IP
- Access restricted via security groups

---

### Access Control

- Only EC2 instances can access RDS
- No direct user/database access
- No open ports to internet

---

### Encryption

- Data encrypted at rest (RDS encryption)
- Data encrypted in transit (TLS / VPN)

---

## 📸 Database Security Proof

![[../Screenshots/aws/aws-security-groups.png]]

👉 Confirms:

- Restricted database access
- Controlled inbound rules

---

## 🔁 Availability & Reliability

- Multi-AZ deployment (optional/extendable)
- Automated backups
- Failover support

---

## 🧠 Design Decisions

### Why Centralized Database

- Enforces strict data residency requirements (PHI stays in Japan)
- Eliminates multi-region data consistency challenges
- Reduces attack surface by limiting database exposure
- Simplifies auditing, monitoring, and regulatory reporting

---

### Why No Replication to Other Regions

- Avoids PHI exposure
- Reduces compliance risk
- Keeps architecture secure and controlled

---

## ⚖️ Tradeoffs & Considerations

While this design improves security and compliance, it introduces tradeoffs:

- Increased latency for distant regions (e.g., GCP or São Paulo)
- Dependency on cross-region network reliability (VPN + TGW)
- No local failover database in other regions
- Scaling depends on vertical DB capacity or read replicas within Tokyo

👉 These tradeoffs were intentionally accepted to prioritize:  
**security, compliance, and data control over latency**

---

## 🚀 Future Enhancements

- Add read replicas within Tokyo for scaling reads
- Implement RDS Proxy for connection management
- Introduce caching layer (Redis / ElastiCache) to reduce DB load
- Evaluate cross-region read replicas if compliance requirements change

---

## 🏗️ Infrastructure as Code

The database infrastructure was deployed using Terraform, including:

- RDS instance configuration
- Subnet groups
- Security groups
- Parameter configurations

This ensures repeatable, version-controlled deployments.

---

## 🧪 Validation

- Verified RDS is not publicly accessible
- Confirmed only private EC2 can connect
- Tested application connectivity to database
- Ensured no external regions store sensitive data

---

## 🧠 Summary

This database architecture demonstrates a real-world enterprise design where:

- Sensitive data is centralized in a compliant region (Tokyo)
- Global applications operate as stateless compute layers
- All database access is private, controlled, and auditable
- Multi-cloud connectivity is enabled without exposing data

👉 This reflects how regulated industries securely scale global applications while maintaining strict control over protected data.