
---

## 🌍 Global Secure Multi-Cloud Architecture

![[lab4-architecture.png]]

---

## 🧠 Architecture Summary

This project demonstrates a **secure, highly available, multi-cloud architecture** connecting:

- **AWS (Tokyo + São Paulo)**
- **GCP (Iowa + NY VPCs)**

Using:

- **Transit Gateway (TGW)**
- **Network Connectivity Center (NCC)**
- **HA VPN with BGP (dynamic routing)**

✔ Fully private backend  
✔ Centralized database (Tokyo)  
✔ Global access via CloudFront  
✔ Dynamic cross-cloud routing

---

## 🔗 Navigation to Deep-Dive Pages

- [[02-AWS-Deep-Dive]] → Tokyo authority architecture
- [[03-GCP-Networking]] → NCC, HA VPN, BGP
- [[04-Networking-BGP-Flow]] → Traffic flow & route propagation
- [[05-Terraform]] → Infrastructure as Code
- [[06-Compute]] → EC2 / App layer
- [[07-Database]] → RDS design

---

# 📸 Proof of Implementation

> The following sections validate that this architecture is **fully deployed, connected, and operational** across AWS and GCP.

---

## ⚙️ Terraform Deployment (Infrastructure as Code)

![[../Screenshots/terraform/terraform-init.png]]  
![[../Screenshots/terraform/terraform-plan.png]]  
![[../Screenshots/terraform/terraform-apply.png]]  
![[../Screenshots/terraform/terraform-outputs.png]]

✅ Confirms:

- Infrastructure deployed via Terraform
- Multi-region resources created
- Outputs generated successfully

---

## ⚙️ CI/CD Pipeline (Jenkins Automation)

![[../Screenshots/jenkins-success.png]]

✅ Confirms:

- GitHub webhook triggers Jenkins
- Terraform executed automatically
- Successful pipeline run

---

## ☁️ AWS Infrastructure (Tokyo + São Paulo)

![[../Screenshots/aws/aws-vpc-console.png]]  
![[../Screenshots/aws/aws-subnets.png]]  
![[../Screenshots/aws/aws-security-groups.png]]  
![[../Screenshots/aws/aws-transit-gateway.png]]  
![[../Screenshots/aws/aws-ec2-running.png]]

✅ Confirms:

- VPC and subnet segmentation
- Secure security group configuration
- Transit Gateway deployed and active
- EC2 instances running in private subnets

---

## ☁️ GCP Infrastructure (NCC + HA VPN + BGP)

![[../Screenshots/gcp/gcp-vpc-network.png]]  
![[../Screenshots/gcp/gcp-ncc-hub.png]]  
![[../Screenshots/gcp/gcp-ncc-spokes.png]]  
![[../Screenshots/gcp/gcp-vpn-status.png]]  
![[../Screenshots/gcp/BGP-VPN.png]]  
![[../Screenshots/gcp/gcp-vm-instances.png]]

✅ Confirms:

- NCC hub and spokes configured
- HA VPN tunnels established
- BGP sessions active
- GCP VMs deployed and reachable

---

## 🔗 Hybrid Connectivity (AWS ↔ GCP)

✅ Validated:

- BGP route exchange functioning
- Cross-cloud communication successful
- No overlapping CIDR ranges
- IPSec-encrypted tunnels in use

➡️ See detailed flow: [[04-Networking-BGP-Flow]]

---

## 🖥️ Application Flow Validation

**User Request Path:**

1. User → CloudFront (global entry)
2. CloudFront → ALB (Tokyo)
3. ALB → Private EC2 instances
4. EC2 → RDS (Tokyo database)

✔ Verified:

- No direct public access to backend
- Application reachable globally
- Database access restricted to private network

---

## 🔐 Security Validation

✔ Verified:

- No public IPs on backend EC2 instances
- Database not publicly accessible
- WAF / Cloud Armor protecting edge
- IAM roles enforcing least privilege
- VPN traffic encrypted (IPSec)

---

## 🧪 CLI & Network Validation

Examples used to verify infrastructure:

# Check Transit Gateway routes  
aws ec2 search-transit-gateway-routes ...  
  
# Verify CloudFront response  
curl -I https://www.keyescloudsolutions.com  
  
# Confirm ALB restriction (should return 403)  
curl -I https://<ALB_DNS_NAME>  
  
# Validate BGP / VPN status (GCP)  
gcloud compute vpn-tunnels list

✔ Confirms:

- Routing tables populated
- CloudFront properly configured
- ALB protected from direct access
- VPN + BGP operational

---

## 🏁 Final Result

This architecture successfully demonstrates:

- 🌍 **Global multi-cloud connectivity (AWS + GCP)**
- 🔐 **Enterprise-grade security (Zero Trust design)**
- 🔁 **Dynamic routing using BGP (no static routes)**
- ⚙️ **Full automation via Terraform and Jenkins**
- ☁️ **Production-ready cloud architecture design**