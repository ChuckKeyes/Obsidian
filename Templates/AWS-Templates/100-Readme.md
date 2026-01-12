

Lets think AWS templates............... for Obsidian................ all tf code blocks use variables. Each code block is a separate file.( Providers.tf,,,main.tf,,,vpc.tf...subnet.tf,,,nat.tf,,,route.tf,,,sg.tf...ec2.tf,,,output.tf )  All use a variable.tf  code........................ load balancer......etc.

## 🧠 Summary of what you get

|Feature|Enabled by|Description|
|---|---|---|
|Windows EC2|`windows_enable = true`|Single Windows Server 2022 for RDP|
|Linux Web Instance|always|One standalone Debian VM|
|ASG|`asg_enable = true`|Auto Scaling group of Debian servers|
|Scaling|`asg_min_size = 3`, `asg_max_size = 10`|Maintains between 3–10 instances|
|ALB|`alb_enable = true`|Routes HTTP to ASG or single VM|
# 🌩️ AWS Terraform Templates (Obsidian Edition)

This Terraform project provides a **modular, Obsidian-friendly AWS environment** used for labs, demos, and cloud engineering practice.  
Each Terraform file is separated by purpose (e.g., `vpc.tf`, `subnet.tf`, `sg.tf`, `ec2.tf`, etc.), and all variables are defined in `variables.tf`.

---

## 🚀 Overview

These templates deploy a **complete AWS networking + compute stack**:

| Component | File | Description |
|------------|------|-------------|
| **Provider** | `providers.tf` | Sets AWS provider, version, and region/profile |
| **Variables** | `variables.tf` | Global configuration: region, CIDR, instance types, etc. |
| **VPC** | `vpc.tf` | Creates base VPC and Internet Gateway |
| **Subnets** | `subnet.tf` | Builds multiple public & private subnets across AZs |
| **NAT Gateways** | `nat.tf` | Provides outbound Internet for private subnets |
| **Route Tables** | `route.tf` | Associates public/private subnets to proper routes |
| **Security Groups** | `sg.tf` | Allows HTTP/HTTPS/SSH/ICMP (and RDP for Windows) |
| **EC2 (Linux)** | `ec2.tf` | Deploys a Debian instance with `user_data.sh` |
| **EC2 (Windows)** | `windows.tf` | Optional Windows Server 2022 instance for RDP |
| **Auto Scaling Group** | `asg.tf` | Launches a dynamic ASG (min=3, max=10) behind ALB |
| **Load Balancer** | `alb.tf` | Routes traffic to instances or ASG target group |
| **Outputs** | `outputs.tf` | Displays useful info (ALB DNS, IPs, IDs) |

All resources share consistent tags for traceability (`Owner`, `ManagedBy`, `Service`, etc.).

---

## 🧩 Features

✅ Multi-AZ **VPC** (CIDR 10.10.0.0/16 by default)  
✅ **Public and private subnets** generated via `cidrsubnet()`  
✅ Optional **NAT Gateways** (`single` or `per_az`)  
✅ **Internet Gateway** for public routes  
✅ **EC2 Linux VM** with NGINX startup script  
✅ **Windows Server 2022** for RDP testing  
✅ **Application Load Balancer (ALB)** with Target Group + Listener  
✅ **Auto Scaling Group (ASG)** — min 3, max 10, desired 3  
✅ All resources parameterized via variables for easy reuse

---

## 🧰 Prerequisites

| Tool | Version | Notes |
|------|----------|-------|
| Terraform | ≥ 1.7.0 | [Download](https://developer.hashicorp.com/terraform/downloads) |
| AWS CLI | Latest | Authenticated with IAM user/profile |
| Git Bash or PowerShell | | For command execution |
| SSH Key Pair | | For EC2 access (`key_name` variable) |

You must have a configured AWS profile:
```bash
aws configure --profile default



## Folder Layout


aws-ob-template/
├── providers.tf
├── variables.tf
├── main.tf
├── vpc.tf
├── subnet.tf
├── nat.tf
├── route.tf
├── sg.tf
├── ec2.tf
├── windows.tf
├── asg.tf
├── alb.tf
├── outputs.tf
├── user_data.sh
└── README.md
