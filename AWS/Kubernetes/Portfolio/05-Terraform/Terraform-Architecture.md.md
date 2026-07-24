# 🧱 Terraform Architecture

## 🎯 Objective

Terraform was used to define, deploy, and manage the complete Lab4 multi-cloud environment across AWS and GCP.

The goal was to build a repeatable, modular, and production-style Infrastructure as Code (IaC) design that supports:

- AWS Tokyo as the authoritative region
- AWS São Paulo as stateless compute
- GCP Iowa and NY branch environments
- AWS ↔ GCP hybrid connectivity through HA VPN and BGP
- Centralized routing with AWS Transit Gateway and GCP Network Connectivity Center

---

## 🧠 Why Terraform

Terraform made it possible to:

- Deploy infrastructure consistently
- Reuse modules across regions and clouds
- Separate root orchestration from module-level resources
- Manage networking, compute, security, and outputs from one codebase

This project was built as a true Infrastructure as Code implementation rather than a manual console deployment.

---

## 📁 Root File Structure

The root Terraform folder contains the main orchestration files and shared configuration.

### Core files
- `main.tf`
- `outputs.tf`
- `variables.tf`
- `versions.tf`
- `terraform.tfvars`

### Structured numbered files
- `800-provider.tf`
- `805-main.tf`
- `890-outputs.tf`
- `892-outputs.tf`
- `895-variables.tf`

These files show a staged and organized approach to provider setup, infrastructure composition, and output management.

---

## 🧩 Modular Design

The Lab4 codebase uses a modular structure to separate responsibilities by region and function.

### AWS modules
- `tokyo_core`
- `tokyo_tgw`
- `saopaulo_core`
- `saopaulo_tgw`
- `peering_resources`
- `edge_public`
- `aws_tokyo_tgw_vpn`

### GCP modules
- `gcp_iowa_network`
- `gcp_ny_branch_network`
- `gcp_transit_vpc`
- `gcp_ha_vpn_to_aws`
- `gcp_ncc`

This modular approach improves readability, reuse, and maintainability.

---

## ☁️ AWS Terraform Design

### Tokyo
The Tokyo modules define the authoritative AWS environment, including:

- VPC
- Subnets
- NAT
- ALB
- EC2
- RDS
- Security groups
- IAM roles
- Secrets management
- S3 integration
- Transit Gateway integration

### São Paulo
The São Paulo modules define the secondary stateless AWS region, including:

- VPC
- Public/private subnets
- NAT
- EC2
- ALB
- Security groups
- Transit Gateway attachment

### Edge / Public Access
The `edge_public` module handles the public-facing edge layer:

- Route 53
- CloudFront
- WAF
- Origin cloaking rules
- ACM certificate resources

---

## ☁️ GCP Terraform Design

### Iowa and NY
The GCP network modules deploy:

- VPC networks
- Firewall rules
- Test VMs
- Regional network components

### NCC and Hybrid Connectivity
The GCP hybrid modules deploy:

- Network Connectivity Center hub
- NCC spokes
- HA VPN resources
- Cloud Router / BGP resources
- Transit VPC connectivity

This allows GCP to operate as a secure extension of the AWS core environment.

---

## 🌐 Hybrid Networking as Code

Terraform was also used to define the multi-cloud routing layer:

- AWS Transit Gateway
- TGW peering and route propagation
- AWS ↔ GCP VPN resources
- BGP-based dynamic route exchange
- GCP NCC hub-and-spoke topology

This is one of the most important parts of the project because it moves beyond simple single-cloud deployment into enterprise hybrid networking.

---

## 📸 Proof of Terraform Execution

![[../Screenshots/terraform/terraform-validate.png]]

![[../Screenshots/terraform/terraform-init.png]]

![[../Screenshots/terraform/terraform-plan.png]]

![[../Screenshots/terraform/terraform-apply.png]]

![[../Screenshots/terraform/terraform-outputs.png]]

![[../Screenshots/terraform/project-structure.png]]

👉 Confirms:
- Terraform configuration validated successfully
- Providers initialized correctly
- Infrastructure plan generated
- Apply completed successfully
- Outputs exported for verification
- Project organized as a real modular codebase

---

## 🔧 Key Terraform Practices Used

- Modular design by region and responsibility
- Clear separation of variables and outputs
- Provider configuration for multi-region and multi-cloud deployment
- Reusable modules for AWS and GCP resources
- Infrastructure verification through outputs and screenshots

---

## 🧠 Design Benefits

This Terraform structure provides:

- Repeatable deployments
- Easier troubleshooting
- Clear separation of concerns
- Better scalability for future labs and production-style growth
- Strong alignment with real-world cloud engineering practices

---

## 🧪 Validation

Terraform deployment was validated through:

- Successful `terraform validate`
- Successful `terraform init`
- Successful `terraform plan`
- Successful `terraform apply`
- Exported outputs used for downstream verification
- Running AWS and GCP resources visible in cloud consoles

---

## 🧠 Summary

Terraform is the automation backbone of Lab4.

It defines the full multi-cloud architecture in code, including:

- AWS regional infrastructure
- GCP regional infrastructure
- Edge services
- Security resources
- Hybrid networking
- Routing and connectivity

This approach demonstrates not just cloud deployment skills, but real Infrastructure as Code discipline at enterprise scale.
