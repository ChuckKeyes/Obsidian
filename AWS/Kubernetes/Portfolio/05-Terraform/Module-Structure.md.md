
# 📁 Terraform Module Structure

## 🧠 Overview

The Lab4 Terraform project is organized into reusable modules to separate regional resources, networking functions, and public edge services.

This makes the code easier to manage, test, and extend.

---

## AWS Modules

### `tokyo_core`
Primary AWS region hosting:
- VPC
- Subnets
- ALB
- EC2
- RDS
- IAM
- Secrets
- S3 integration

### `tokyo_tgw`
Transit Gateway resources for the Tokyo region.

### `saopaulo_core`
Secondary AWS compute region hosting:
- VPC
- Subnets
- NAT
- EC2
- ALB
- Security groups

### `saopaulo_tgw`
Transit Gateway resources for São Paulo.

### `peering_resources`
Cross-region peering and routing resources between AWS environments.

### `edge_public`
Public-facing services including:
- Route 53
- CloudFront
- WAF
- ACM
- Origin cloaking

### `aws_tokyo_tgw_vpn`
AWS-side VPN resources for hybrid connectivity to GCP.

---

## GCP Modules

### `gcp_iowa_network`
Iowa VPC, VM, and firewall resources.

### `gcp_ny_branch_network`
NY branch VPC, VM, and firewall resources.

### `gcp_transit_vpc`
Transit-related GCP networking resources.

### `gcp_ha_vpn_to_aws`
HA VPN tunnel resources and BGP connectivity to AWS.

### `gcp_ncc`
Network Connectivity Center hub and spoke resources.

---

## 📸 Project Structure

![[../Screenshots/terraform/project-structure.png]]

---

## 🧠 Why Modules Matter

Using modules made it possible to:

- Reuse infrastructure patterns
- Keep AWS and GCP concerns separated
- Manage hybrid networking more cleanly
- Scale the project beyond a single region or provider

---

## 🧠 Summary

The module structure reflects a real-world cloud engineering approach where infrastructure is broken into logical units by role, region, and provider.