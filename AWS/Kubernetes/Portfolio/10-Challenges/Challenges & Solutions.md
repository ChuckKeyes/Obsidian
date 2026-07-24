> This project involved building a **global, multi-cloud architecture (AWS + GCP)** using Terraform, BGP VPN, and CI/CD automation.  
> Along the way, real-world challenges were encountered and solved across networking, security, and automation layers.

---

## 🎯 Objective

Demonstrate the ability to:

- Troubleshoot complex cloud issues
- Debug Terraform deployments
- Resolve networking and security problems
- Operate across AWS and GCP environments
- Apply real-world problem-solving skills

---

## 🧠 Challenge Areas

The challenges fell into key categories:

- 🌐 Networking (VPN, BGP, routing)
- ☁️ Cloud configuration (AWS / GCP)
- 🧱 Terraform (modules, dependencies)
- 🔐 Security (IAM, certificates, access control)
- 🚀 CI/CD (Jenkins pipelines)
- 🌍 DNS & global access

---

# 🌐 Networking Challenges (Most Critical)

### 🔴 VPN / BGP Not Establishing

**Problem**

- HA VPN tunnels created but BGP sessions not establishing

**Root Cause**

- ASN mismatch and incorrect peer configuration

**Solution**

- Verified ASN values
- Corrected BGP peer IP ranges (`169.254.x.x/30`)

**Result**

- BGP sessions established
- Dynamic routing functional across AWS ↔ GCP

---

### 🔴 Routes Not Propagating (TGW)

**Problem**

- Cross-region / cross-cloud traffic failing

**Root Cause**

- Missing TGW route table associations and propagation

**Solution**

- Updated:
    - TGW route tables
    - Route propagation
    - VPC route tables

**Result**

- Full connectivity restored across regions and clouds

---

# ☁️ AWS Challenges

### 🔴 CloudFront → ALB Failure

**Problem**

- Requests failing or returning errors

**Root Cause**

- Incorrect origin configuration and SSL setup

**Solution**

- Enforced:
    - `https-only` origin policy
    - ACM certificate in **us-east-1**

**Result**

- Global traffic successfully routed through CloudFront

---

### 🔴 ALB Public Exposure

**Problem**

- ALB accessible directly from the internet

**Root Cause**

- Open security group rules

**Solution**

- Restricted access to:
    - CloudFront prefix list
    - Origin verification header

**Result**

- ALB secured behind CloudFront only

---

### 🔴 S3 Access Denied (EC2 / Jenkins)

**Problem**

- Instances unable to access S3

**Root Cause**

- Missing IAM permissions

**Solution**

- Added:
    - `s3:GetObject`
    - `s3:ListBucket`

**Result**

- Successful file sync and application deployment

---

# ☁️ GCP Challenges

### 🔴 NCC Spokes Not Active

**Problem**

- GCP Network Connectivity Center spokes inactive

**Root Cause**

- Incorrect attachment configuration

**Solution**

- Verified:
    - Hub and spoke configuration
    - VPC attachments
    - VPN connectivity

**Result**

- NCC spokes active and stable

---

# 🧱 Terraform Challenges

### 🔴 Provider Alias Errors

**Problem**

- Terraform failed due to provider conflicts

**Root Cause**

- Misconfigured provider aliases across modules

**Solution**

- Standardized:
    - `configuration_aliases`
    - Root-level provider definitions

**Result**

- Multi-region Terraform deployments working

---

### 🔴 `for_each` / Dependency Failures

**Problem**

- Plan/apply errors due to unknown values

**Root Cause**

- Improper dependency handling

**Solution**

- Refactored:
    - Module outputs
    - Resource dependencies

**Result**

- Stable Terraform execution

---

# 🔐 Security Challenges

### 🔴 ACM Certificate Validation Issues

**Problem**

- Certificates stuck in pending state

**Root Cause**

- Incorrect DNS validation records / multiple hosted zones

**Solution**

- Verified correct Route 53 zone
- Fixed DNS validation records

**Result**

- Certificates validated successfully

---

# 🚀 CI/CD Challenges

### 🔴 Webhook Not Triggering Jenkins

**Problem**

- Pipeline not executing on code push

**Root Cause**

- Incorrect webhook configuration

**Solution**

- Fixed:
    - Webhook URL
    - GitHub event triggers
    - Jenkins job configuration

**Result**

- Fully automated pipeline execution

---

### 🔴 Jenkins Disk Space (/tmp)

**Problem**

- Builds failing due to low disk space

**Root Cause**

- Small `/tmp` partition on EC2

**Solution**

sudo mount -o remount,size=4G /tmp

**Result**

- Stable Jenkins builds

---

# 🌍 DNS & Global Access

### 🔴 Domain Not Resolving

**Problem**

- Website inaccessible via domain

**Root Cause**

- Incorrect Route 53 alias

**Solution**

- Pointed domain → CloudFront distribution

**Result**

- Global access working correctly

---

## 📸 Proof of Work (Screenshots)

Include:

- BGP session established (AWS + GCP)
- TGW route tables
- CloudFront + ALB configuration
- Terraform apply success
- Jenkins pipeline success
- DNS resolution

---

## 🧠 Key Lessons Learned

### 🔹 Networking is the hardest part

- BGP, VPN, and routing require precision

### 🔹 Terraform requires structure

- Modules and dependencies must be clean

### 🔹 Security must be enforced early

- Default configs are often too open

### 🔹 CI/CD enables real operations

- Automation is critical for production systems

---

## 🔗 Related Pages

- [[01-Architecture]]
- [[03-GCP-Networking]]
- [[04-Networking-BGP-Flow]]
- [[05-Terraform]]
- [[08-Logging-Monitoring]]
- [[09-CI-CD]]

---

## 🧠 Summary

This project demonstrates real-world problem solving across:

- Multi-cloud networking
- Infrastructure as Code
- Security design
- CI/CD automation

👉 These challenges reflect **real enterprise scenarios**, and solving them proves the ability to operate production-grade cloud systems.