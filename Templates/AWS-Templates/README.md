
# AWS ALB + Auto Scaling Group Terraform Lab

This repository contains a reusable Terraform template for deploying a highly available web application on AWS using:

- A dedicated VPC with public and private subnets
- An Internet Gateway and NAT Gateway
- An Application Load Balancer (ALB)
- An Auto Scaling Group (ASG) of EC2 web servers
- Security groups with least-privilege rules
- Optional CPU-based auto scaling

It is designed as both:

- A **learning lab** (for Terraform + AWS architecture), and  
- A **portfolio artifact** to show recruiters and hiring managers.

---

## Architecture Overview

At a high level, this deployment creates:

- **1 VPC** (10.0.0.0/16)  
- **3 public subnets** (one per AZ)  
- **3 private subnets** (one per AZ)  
- **1 Internet Gateway** for public access  
- **1 NAT Gateway + Elastic IP** for private subnet egress  
- **1 public route table** (0.0.0.0/0 → IGW)  
- **1 private route table** (0.0.0.0/0 → NAT GW)  
- **2 security groups**:
  - ALB security group (internet → ALB)
  - Targets security group (ALB → EC2 instances, optional SSH from admin)
- **1 Launch Template** defining the web server instances  
- **1 Target Group** for the ALB  
- **1 Application Load Balancer**  
- **1 ALB listener** (HTTP 80 → Target Group)  
- **1 Auto Scaling Group** deployed across 3 AZs  
- **1 Auto Scaling CPU policy** (optional)

The result is a small but realistic, multi-AZ application stack.

---

## What the Web App Does

For simplicity, the “application” is just Apache HTTPD (or Apache2) serving a basic HTML page.

The user data script:

- Installs a web server
- Enables and starts the service
- Writes an HTML file that identifies the instance (hostname, etc.)

This makes it easy to see load balancing behavior by refreshing the ALB URL and watching which instance responds.

---

## File Structure

A suggested Terraform file layout:

```text
.
├─ providers.tf              # AWS provider configuration
├─ variables.tf              # Input variables (region, CIDRs, instance types, etc.)
├─ outputs.tf                # Useful outputs (ALB DNS name, VPC ID, subnet IDs)
├─ 1-VPC.tf                  # VPC definition
├─ 2-Subnets.tf              # Public + private subnets
├─ 3-Internet-Gateway.tf     # Internet Gateway
├─ 4-NAT-Gateway.tf          # NAT Gateway + Elastic IP
├─ 5-Route-Tables.tf         # Public + private route tables
├─ 6-Route-Associations.tf   # Subnet → route table associations
├─ 7-Security-Groups.tf      # ALB SG + Targets SG
├─ 8-Launch-Template.tf      # EC2 Launch Template
├─ 9-Target-Group.tf         # ALB Target Group
├─ 10-Load-Balancer.tf       # Application Load Balancer
├─ 11-Listener.tf            # ALB Listener (HTTP 80 → Target Group)
├─ 12-Auto-Scaling-Group.tf  # Auto Scaling Group
└─ 13-Auto-Scaling-Policy.tf # Optional CPU-based scaling policy
