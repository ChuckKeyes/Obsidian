Armageddon Labs 3 & 4
Multi-Cloud Infrastructure Architecture
1. Introduction

Overview of the Armageddon Lab project

Purpose of the infrastructure deployment

Goals of the multi-cloud architecture

Technologies used in the project

AWS

Google Cloud Platform

Terraform

Transit Gateway

HA VPN

Network Connectivity Center

2. Architecture Overview
2.1 System Architecture

Global infrastructure design

Multi-region deployment

Multi-cloud connectivity

Architecture Diagram

Location:

diagrams/lab4-architecture.png
2.2 Cloud Components
AWS Infrastructure

Tokyo VPC

São Paulo VPC

Transit Gateway

Transit Gateway Peering

Application Load Balancer

EC2 instances

RDS database

CloudFront and WAF

Google Cloud Infrastructure

Iowa VPC

New York VPC

Network Connectivity Center

HA VPN Gateway

Cloud Router

Virtual machine instances

3. Lab3 Implementation
3.1 Lab3 Objective

Deploy AWS multi-region infrastructure

Establish Transit Gateway connectivity

Deploy application and database resources

3.2 Lab3 Architecture

AWS regional architecture

VPC network design

Transit Gateway routing

Screenshots:

screenshots/aws/
3.3 Terraform Code Structure

Example structure:

terraform-code/
modules/

Key Terraform files:

main.tf

providers.tf

variables.tf

outputs.tf

3.4 Deployment Process

Terraform commands used:

terraform init
terraform validate
terraform plan
terraform apply

Screenshots:

screenshots/terraform/
3.5 Lab3 Verification

Verification steps included:

Checking EC2 instances

Confirming Transit Gateway attachments

Validating route tables

Screenshots:

screenshots/aws/
3.6 Lab3 Summary

Infrastructure deployed successfully

Multi-region AWS networking validated

Terraform automation confirmed

4. Lab4 Implementation
4.1 Lab4 Objective

Extend infrastructure to Google Cloud Platform

Establish AWS ↔ GCP connectivity

Implement HA VPN with BGP routing

4.2 Lab4 Architecture

Components introduced:

GCP HA VPN

Cloud Router

Network Connectivity Center

Hub-and-spoke network topology

Screenshots:

screenshots/gcp/
4.3 Terraform Infrastructure

Key Terraform resources:

google_compute_network

google_compute_router

google_compute_ha_vpn_gateway

google_network_connectivity_hub

4.4 Deployment Steps

Terraform commands used for deployment:

terraform init
terraform plan
terraform apply

Screenshots:

screenshots/terraform/
4.5 Connectivity Verification

Network verification included:

VPN tunnel status checks

BGP route propagation

VM connectivity testing

Screenshots:

screenshots/gcp/
4.6 Terraform Outputs

Example outputs:

CloudFront distribution ID

NCC hub identifier

VM internal IP addresses

4.7 Lab4 Summary

Multi-cloud networking successfully deployed

AWS and GCP connectivity validated

Terraform infrastructure automation confirmed

5. Challenges and Solutions

Problems encountered during development:

Terraform dependency errors

Duplicate resource definitions

Provider alias conflicts

Multi-cloud networking complexity

Each issue was resolved through configuration corrections and infrastructure verification.

6. Lessons Learned

Key lessons from the project:

Terraform module design

Multi-cloud networking architecture

Transit Gateway routing

Infrastructure automation using Terraform

7. Final Results

Summary of the completed infrastructure:

Global cloud architecture deployed

Multi-region connectivity validated

AWS and GCP integrated through VPN and BGP

Infrastructure automation using Terraform

8. Conclusion

Summary of project accomplishments and technical achievements.

9. Appendix
Appendix A – Terraform Outputs

Location:

screenshots/terraform/
Appendix B – Key Terraform Files

Location:

terraform-code/
Appendix C – Screenshots

Location:

screenshots/

Includes:

AWS console

GCP console

Terraform CLI output
