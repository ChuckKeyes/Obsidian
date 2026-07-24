
## 🎯 Objective

This project was fully deployed using **Terraform**, enabling a consistent, repeatable, and automated build of a **multi-cloud architecture (AWS + GCP)**.

The infrastructure includes:

- AWS Tokyo (primary / authority region)
- AWS São Paulo (stateless compute)
- GCP (Iowa + New York)
- Transit Gateway (TGW)
- Network Connectivity Center (NCC)
- HA VPN with BGP routing
- CloudFront + WAF global entry

---

## 🧱 Project Structure

The Terraform codebase is organized using a **modular architecture** to separate concerns and improve scalability.

Portfolio Files/05-Terraform/

main.tf
providers.tf
variables.tf
outputs.tf
versions.tf

modules/

## 📦 Core Modules

### 🇯🇵 AWS Tokyo (Primary Authority)

- `modules/tokyo_core/`
- `modules/tokyo_tgw/`

Handles:

- VPC, subnets, routing
- EC2 (Auto Scaling)
- RDS (Multi-AZ)
- ALB (private entry from CloudFront)
- IAM + Secrets Manager
- Transit Gateway (central hub)

---

### 🇧🇷 AWS São Paulo (Stateless Compute)

- `modules/saopaulo_core/`
- `modules/saopaulo_tgw/`

Handles:

- VPC + subnets
- EC2 compute only (no database)
- NAT + routing
- TGW attachment

👉 Designed as **stateless compute region**

---

### 🔗 Cross-Region Connectivity (AWS)

- `modules/peering_resources/`
- `modules/cross-region routes/`

Handles:

- TGW peering (Tokyo ↔ São Paulo)
- Route table propagation
- Cross-region traffic flow

---

### 🌐 Edge / Global Entry

- `modules/edge_public/`

Handles:

- Amazon CloudFront
- AWS WAF
- Route 53 DNS
- ACM certificates (us-east-1)
- Origin header security (CloudFront → ALB)

👉 Enforces **single global entry point**

---

### ☁️ GCP Networking

- `modules/gcp_transit_vpc/`
- `modules/gcp_iowa_network/`
- `modules/gcp_ny_branch_network/`

Handles:

- GCP VPC networks
- Subnets + firewall rules
- Test VMs for validation

---

### 🔐 GCP Connectivity (VPN + BGP)

- `modules/gcp_ha_vpn_to_aws/`
- `modules/gcp_ncc/`

Handles:

- HA VPN tunnels (IPSec)
- Cloud Router (BGP)
- Network Connectivity Center (hub + spokes)

👉 Enables **dynamic route exchange between AWS and GCP**

---

## 🔄 Infrastructure Deployment Flow

Terraform deploys infrastructure in layers:

1. AWS Tokyo Core (VPC, EC2, RDS)
2. AWS TGW (Tokyo + São Paulo)
3. TGW Peering + Routes
4. GCP Networks
5. HA VPN + BGP (AWS ↔ GCP)
6. NCC Hub + Spokes
7. CloudFront + WAF + DNS

## 🧪 Example Terraform Snippets

### AWS Transit Gateway

resource "aws_ec2_transit_gateway" "tokyo" {
  amazon_side_asn = 64512
}

GCP Cloud Router (BGP)

resource "google_compute_router" "bgp_router" {
  bgp {
    asn = 65420
  }
}

CloudFront + WAF Integration

resource "aws_cloudfront_distribution" "main" {
  web_acl_id = aws_wafv2_web_acl.cloudfront.arn
}

---

## 📸 Deployment Proof

Include screenshots of:

- `terraform init`
- `terraform plan`
- `terraform apply`
- AWS resources created
- GCP VPN + NCC active
- Outputs (IPs, DNS, IDs)

---

## 🔐 Key Design Decisions

### 1. Modular Terraform Design

- Improves maintainability
- Enables reuse across regions
- Separates AWS and GCP concerns

---

### 2. Multi-Provider Configuration

- AWS and GCP deployed from one codebase
- Provider aliasing used for region separation

---

### 3. Infrastructure as Code (IaC)

- Fully automated deployments
- Version-controlled infrastructure
- Reproducible environments

---

### 4. Security-First Deployment

- No public access to EC2 or RDS
- CloudFront enforced as entry point
- VPN used for private connectivity only

---

## 🧠 What This Section Demonstrates

- Real-world Terraform usage (not basic)
- Multi-cloud deployment capability
- Network automation (BGP + VPN)
- Modular infrastructure design
- Production-style architecture implementation