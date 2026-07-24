
Designing a secure, highly available multi-cloud network connecting AWS and GCP using BGP-based VPN, Transit Gateway (TGW), and Network Connectivity Center (NCC) across global regions.

## Executive Summary

This project demonstrates a secure multi-cloud architecture built across Amazon Web Services and Google Cloud Platform. The environment connects AWS and GCP networks through high-availability VPN tunnels with dynamic BGP routing, allowing controlled communication between cloud environments while preserving compliance boundaries.

AWS Tokyo serves as the authoritative region and hosts the primary database tier. AWS São Paulo provides secondary compute capability. On the GCP side, Iowa and a simulated New York branch VPC connect through Network Connectivity Center. The result is a globally distributed design that emphasizes secure routing, regional control, and scalable cloud networking.

## Project Objectives

- Build a secure multi-cloud network spanning AWS and GCP
- Connect environments using HA VPN and BGP dynamic routing
- Centralize AWS routing with Transit Gateway
- Centralize GCP connectivity with Network Connectivity Center
- Maintain regional control so critical data remains in the primary region
- Provision the environment using Terraform

## Architecture Overview

This architecture uses AWS as the primary infrastructure hub and GCP as an interconnected cloud extension. AWS Transit Gateway manages routing between AWS VPCs and the VPN corridor into GCP. GCP Network Connectivity Center provides a hub-and-spoke model to connect GCP environments into the shared architecture.

The design supports secure cross-cloud communication while keeping the database in AWS Tokyo as the authoritative region. Compute resources in other locations are treated as controlled extensions rather than independent data authorities.

## Regions

**Primary Region**

- AWS Tokyo — authoritative region and database layer

**Secondary Region**

- AWS São Paulo — secondary compute layer

**GCP Regions**

- Iowa (`us-central1`)
- New York branch simulated through a GCP VPC

## Key Technologies

- AWS Transit Gateway (TGW)
- GCP Network Connectivity Center (NCC)
- BGP Routing
- HA VPN (AWS ↔ GCP)
- Terraform
- CloudFront
- Route 53

## Core Components

### AWS

- Tokyo VPC for primary infrastructure and database services
- São Paulo VPC for secondary compute resources
- AWS Transit Gateway for centralized AWS routing
- VPN connectivity toward GCP
- Route 53 for DNS
- CloudFront for global application entry

### GCP

- Iowa VPC for remote workload connectivity
- New York branch VPC for branch-style extension
- Cloud Routers for BGP exchange
- HA VPN gateways
- Network Connectivity Center hub and spokes

## Network Design

The architecture uses dynamic routing through BGP so routes can be exchanged automatically between AWS and GCP. This avoids static route sprawl and more closely reflects real-world enterprise hybrid and multi-cloud networking.

AWS Transit Gateway acts as the routing core for AWS-side networks. GCP NCC provides a central hub for the attached GCP spokes. HA VPN tunnels establish encrypted connectivity between the two cloud environments, and BGP peers advertise approved prefixes across the connection.

This design provides:

- encrypted traffic between clouds
- centralized routing control
- regional segmentation
- scalable expansion for future sites

## Security and Compliance Approach

Security is a core design principle in this lab. Sensitive data remains in the primary AWS Tokyo region, while remote regions and cloud extensions are used for controlled access, compute, and connectivity.

Key security practices include:

- encryption in transit through HA VPN
- controlled route advertisement using BGP
- centralized routing through TGW and NCC
- infrastructure deployment through Terraform for repeatability
- separation of authoritative data from remote compute regions

## Terraform Implementation

This environment was provisioned using Terraform with reusable modules to separate responsibilities across AWS and GCP. Infrastructure as Code made it possible to deploy, test, and update the architecture consistently.

Terraform responsibilities included:

- VPC creation
- subnets and routing
- Transit Gateway deployment
- GCP network and router deployment
- HA VPN configuration
- NCC hub and spoke creation
- outputs for verification and testing

## Deployment Workflow

1. Build AWS network foundations and core routing
2. Deploy AWS Transit Gateway and VPC attachments
3. Build GCP VPCs and Cloud Routers
4. Deploy HA VPN gateways and tunnels
5. Configure BGP sessions between AWS and GCP
6. Create NCC hub and spokes
7. Validate route propagation and connectivity
8. Confirm that critical data remains in the primary region

## Validation and Testing

The deployment was validated through routing checks, VPN status checks, and internal IP connectivity tests across the environment.

Validation included:

- confirming HA VPN tunnel establishment
- verifying active BGP peers
- checking learned and propagated routes
- testing private connectivity between attached VPCs
- confirming the database remains in Tokyo
- verifying multi-region and multi-cloud traffic flow

## Challenges and Solutions

### Cross-Cloud Routing Complexity

Configuring AWS and GCP together required careful alignment of VPN settings, BGP peers, interface IPs, and route expectations.

**Solution:** Broke the environment into smaller modules and validated each component step by step before joining the full architecture.

### Multi-Region Network Coordination

Managing multiple AWS regions and multiple GCP networks increased the chance of route misconfiguration and attachment mistakes.

**Solution:** Used centralized routing patterns with TGW and NCC, then validated route tables and advertised prefixes at each stage.

### Compliance Boundaries

The architecture needed to support connectivity without allowing sensitive data to spread into non-authoritative regions.

**Solution:** Kept the database in AWS Tokyo and treated all other regions as controlled compute or branch extensions.

## Results

This lab produced a working global multi-cloud architecture that connects AWS and GCP through secure, dynamically routed VPN tunnels. The design demonstrates practical experience with enterprise network patterns including centralized routing, cross-cloud connectivity, segmentation, and infrastructure automation.

## Skills Demonstrated

- Multi-cloud architecture
- AWS networking
- GCP networking
- BGP routing
- HA VPN design
- Transit Gateway
- Network Connectivity Center
- Terraform
- Cloud security design
- Regional compliance planning

## Diagram Title

**Global Secure Multi-Cloud Architecture (AWS, GCP, BGP VPN)**

## Diagram Caption

Secure cross-cloud connectivity using BGP VPN with centralized routing through AWS Transit Gateway and GCP Network Connectivity Center.

