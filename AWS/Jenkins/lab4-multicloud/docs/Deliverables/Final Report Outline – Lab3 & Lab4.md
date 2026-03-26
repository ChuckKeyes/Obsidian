Final Report Outline – Lab3 & Lab4

Course: Cloud Infrastructure / Terraform
Student: Charles Keyes Sr.
Project: Multi-Region Cloud Infrastructure Deployment
Technologies: Terraform, AWS, GCP, Transit Gateway, HA VPN, CloudFront, VPC Networking

1. Cover Page

Include:

Title: Final Report – Lab3 & Lab4

Name: Charles Keyes Sr.

Course Name

Instructor

Date

Project name (optional):
Keyes Cloud Solutions Global Infrastructure

2. Executive Summary

This section is 1–2 paragraphs explaining the overall project.

Example topics to cover:

Purpose of the labs

What infrastructure was built

Cloud providers used

Key networking architecture

Final result

Example structure:

Purpose

Build a multi-region cloud infrastructure using Terraform.

Key Components

AWS Transit Gateways

Multi-region VPC architecture

GCP Network Connectivity Center

HA VPN tunnels

CloudFront secured application access

Outcome

Successfully deployed infrastructure with verified connectivity across regions.

3. Architecture Overview

Explain the overall architecture before diving into each lab.

Include

High-level architecture diagram

Regions used

Network topology

Key services

Example Topics

Cloud Regions

Tokyo

São Paulo

Iowa

New York

Core Components

AWS Transit Gateway

VPC networks

HA VPN connectivity

Compute instances

CloudFront distribution

Screenshots Needed

Architecture diagram

Terraform folder structure

4. Lab3 Implementation

Create a full section dedicated to Lab3.

4.1 Lab3 Objective

Explain what Lab3 required.

Example:

Lab3 focused on deploying a multi-region infrastructure using Terraform modules.
The objective was to create:

VPC networking

EC2 compute resources

Transit Gateway connectivity

Secure communication between regions.

4.2 Lab3 Architecture

Explain:

Regions used

VPC design

Subnets

Transit Gateway

Screenshots

Include:

Architecture diagram

AWS VPC console

Terraform plan output

4.3 Terraform Code Structure

Explain how the Terraform code was organized.

Example sections:

modules/
   tokyo_authority
   saopaulo_compute
root/
   main.tf
   providers.tf
   outputs.tf
   terraform.tfvars

Explain:

Module design

Provider configuration

Variable usage

Remote state usage

Screenshots

Include:

VS Code project structure

Example Terraform file

4.4 Lab3 Deployment Process

Explain how the infrastructure was deployed.

Example steps:

Terraform initialization

terraform init

Validate configuration

terraform validate

Generate plan

terraform plan

Apply infrastructure

terraform apply
Screenshots

Include:

Terraform plan output

Terraform apply success

4.5 Lab3 Verification

Provide proof the infrastructure works.

Include:

Outputs

Example:

tokyo_vpc_id
saopaulo_vpc_id
ec2_instance_id
tgw_id
Screenshots

AWS VPC console

EC2 instances running

Transit Gateway attachments

Terraform outputs

4.6 Lab3 Summary

Write a short conclusion for Lab3.

Example:

Infrastructure successfully deployed

Networking validated

Terraform modules worked correctly

Multi-region connectivity established

5. Lab4 Implementation

Create another major section.

5.1 Lab4 Objective

Explain what Lab4 required.

Example:

Lab4 extended the infrastructure by integrating additional regions and advanced networking components including:

GCP connectivity

HA VPN tunnels

Network Connectivity Center

Multi-region routing.

5.2 Lab4 Architecture

Explain:

AWS regions

GCP networks

VPN topology

NCC hub and spokes

Screenshots

Include:

Lab4 architecture diagram

GCP network topology

5.3 Terraform Infrastructure

Explain how Terraform deployed the infrastructure.

Topics:

HA VPN configuration

Router configuration

NCC hub and spokes

VM instances

Example Terraform components:

google_compute_network
google_compute_router
google_compute_ha_vpn_gateway
google_network_connectivity_hub
5.4 Deployment Steps

Explain how Lab4 was deployed.

Example commands:

terraform init
terraform plan
terraform apply

Explain:

Terraform module integration

Provider configuration

Resource creation

Screenshots

Include:

Terraform plan output

Terraform apply results

5.5 Connectivity Verification

Provide proof the network works.

Examples:

VM ping tests

VPN tunnel status

NCC hub connections

Screenshots

Include:

GCP NCC hub

VPN tunnel status

VM connectivity tests

5.6 Terraform Outputs

Include final outputs.

Example:

cloudfront_distribution_id
cloudfront_domain_name
gcp_ncc_hub_name
iowa_vm_internal_ip
ny_vm_internal_ip

Explain what each output represents.

5.7 Lab4 Summary

Explain:

Infrastructure successfully deployed

Multi-cloud networking working

Terraform automation validated

6. Challenges and Solutions

Discuss problems encountered.

Examples:

Terraform dependency errors

Duplicate resource issues

Network connectivity problems

Provider alias conflicts

Explain:

Problem → Solution

Example:

Problem
Terraform reported duplicate resources in modules.

Solution
Code was refactored to remove duplicate resource declarations.

7. Lessons Learned

Explain what you learned:

Terraform module design

Multi-cloud networking

Transit Gateway routing

Infrastructure automation

8. Final Results

Summarize the final working system.

Example topics:

Global infrastructure deployed

Multi-region connectivity validated

Terraform automation successful

9. Appendix

Include supporting materials.

Appendix A – Terraform Outputs
Appendix B – Key Terraform Files

Example files:

main.tf

providers.tf

outputs.tf

Appendix C – Additional Screenshots

Examples:

AWS Console

GCP Console

Terraform CLI

Ideal Report Length
Section	Pages
Executive Summary	1
Architecture	1–2
Lab3	4–6
Lab4	4–6
Challenges	1
Conclusion	1
Appendix	2–4

Total:

12–18 pages

Pro Tip (For Your Portfolio)

This report can easily become a portfolio project for Keyes Cloud Solutions.

You could publish:

diagrams

architecture explanation

Terraform modules

screenshots

on:

portfolio.keyescloudsolutions.com

Google Cloud Infrastructure

VPC networks

VM instances

Cloud Router

HA VPN gateways

Network Connectivity Center hub and spokes

Example Terraform resource:

resource "google_compute_network" "iowa_vpc" {
  name = "iowa-medical-vpc"
}
Terraform Project Structure
terraform/
│
├── main.tf
├── providers.tf
├── variables.tf
├── outputs.tf
│
├── modules/
│   ├── tokyo_authority
│   ├── saopaulo_compute
│   ├── gcp_iowa_network
│   └── gcp_ny_network
│
└── images/
    ├── architecture.png
    ├── terraform-plan.png
    ├── aws-console.png

Terraform modules were used to maintain clean separation between infrastructure components.

Deployment Steps

Initialize Terraform:

terraform init

Validate configuration:

terraform validate

Generate infrastructure plan:

terraform plan

Deploy infrastructure:

terraform apply
Terraform Plan Output

Example Terraform plan confirming infrastructure deployment.

The plan includes creation of:

VPC networks

Subnets

Transit Gateway attachments

EC2 instances

HA VPN gateways

GCP networking resources

AWS Infrastructure Screenshots
AWS VPC Configuration

Transit Gateway Attachments

GCP Infrastructure Screenshots
Network Connectivity Center

HA VPN Tunnel Status

Connectivity Testing

Connectivity between regions was verified using test instances.

Example ping test:

ping 10.30.1.2

Successful connectivity confirms routing across the hybrid infrastructure.

Terraform Outputs

Example outputs from the deployment:

cloudfront_domain_name = do920hzo448ns.cloudfront.net
iowa_vm_internal_ip = 10.30.1.2
ny_vm_internal_ip = 10.40.1.2
gcp_ncc_hub_name = armageddon-ncc-hub

These outputs confirm that the infrastructure was successfully deployed.

Challenges and Solutions
Terraform Resource Conflicts

Duplicate resource definitions caused Terraform errors.

Solution

Refactored Terraform modules and removed duplicate resources.

Provider Configuration

Multi-cloud providers required careful configuration.

Solution

Separate provider aliases were used for AWS regions and GCP environments.

Lessons Learned

This project provided experience with:

Terraform modular architecture

Multi-region cloud networking

Hybrid cloud connectivity

Infrastructure automation

Cloud security best practices

Future Improvements

Potential enhancements include:

Automated monitoring

Infrastructure CI/CD pipeline

Cloud security scanning

Auto-scaling compute infrastructure

Author

Charles Keyes Sr.
Founder – Keyes Cloud Solutions

Portfolio:


---

# Why This Layout Looks Professional
This format mirrors how **real cloud engineering projects are documented**:

It includes:

✔ Architecture diagram  
✔ Terraform code examples  
✔ Screenshots  
✔ Infrastructure explanation  
✔ deployment steps  
✔ outputs  
✔ lessons learned  

Which makes it perfect for:

- GitHub portfolio
- job interviews
- DevOps positions
- cloud architecture roles

---

# Pro Tip for Your Portfolio
Your repo name could be something like:


terraform-global-cloud-network


or


lab3-lab4-global-infrastructure


Which would look great under:

**ChuckKeyes GitHub**

---

# If you want, I can also show you a **next-level upgrade** that makes your GitHub repo look like a **FAANG-level cloud architecture project** with:

- badges
- animated diagrams
- clickable architecture map
- Terraform module docs
- GitHub Pages architecture site

It would make this lab look **like a real consulting project from Keyes Cloud Solutions.**