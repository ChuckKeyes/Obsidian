
# 🇯🇵 AWS Deep Dive — Tokyo Region (Primary / PHI Data)

## 🎯 Objective

The Tokyo region serves as the **authoritative core** of the architecture, hosting all sensitive data and critical application components.

This design ensures:
- Compliance (PHI remains in Japan)
- High availability
- Secure, private access from global regions

---

## 🧠 Architecture Overview

Tokyo is responsible for:

- Hosting the primary database (RDS)
- Running application services (EC2 Auto Scaling)
- Acting as the central routing hub (Transit Gateway)
- Serving traffic via ALB behind CloudFront

---

## 🌐 Network Architecture

### VPC Design

The Tokyo VPC is segmented into:

- **Public Subnets**
  - Application Load Balancer (ALB)
- **Private App Subnets**
  - EC2 instances (Auto Scaling group)
- **Private DB Subnets**
  - RDS (no public access)

---

### 📸 VPC & Subnet Proof

![[../Screenshots/aws/aws-vpc-console.png]]

![[../Screenshots/aws/aws-subnets.png]]

👉 Confirms:
- Proper subnet segmentation
- Multi-AZ deployment
- Isolation between tiers

---

## ⚖️ Load Balancing Layer

### Application Load Balancer (ALB)

- Receives traffic from CloudFront only
- Distributes traffic to EC2 instances
- Enforces HTTPS

---

### 📸 ALB / EC2 Proof

![[../Screenshots/aws/aws-ec2-running.png]]

👉 Confirms:
- Instances running in private subnets
- Backend compute layer active

---

## 🔐 Security Controls

### Network Security

- Security groups restrict traffic to:
  - CloudFront → ALB only
  - ALB → EC2 only
- No direct internet access to EC2 or RDS

---

### 📸 Security Groups

![[../Screenshots/aws/aws-security-groups.png]]

👉 Confirms:
- Least-privilege access rules
- Controlled traffic flow

---

## 🔗 Transit Gateway (Core Networking)

### Role

AWS Transit Gateway acts as the **central routing hub** connecting:

- Tokyo VPC (primary)
- São Paulo VPC (stateless compute)
- GCP via HA VPN

---

### 📸 Transit Gateway

![[../Screenshots/aws/aws-transit-gateway.png]]

👉 Confirms:
- TGW deployed and active
- VPC attachments configured

---

## 🌍 Cross-Region & Multi-Cloud Connectivity

Tokyo communicates with:

- **São Paulo (AWS)** → Stateless compute
- **GCP (Iowa / NY)** → Remote environments via VPN

---

### Key Features

- Dynamic routing via BGP
- Encrypted tunnels (IPSec)
- Controlled CIDR propagation

---

## 🗄️ Data Layer (Critical Design)

### RDS (Primary Database)

- Hosted only in Tokyo
- Stores all PHI (Protected Health Information)
- No replication outside Japan

---

### 🔒 Compliance Design

- PHI never leaves Tokyo region
- Other regions are **stateless**
- Ensures regulatory compliance

---

## 🧠 Design Decisions

### Why Tokyo is Primary

- Data residency requirements
- Centralized control
- Reduced latency for core services

---

### Why Stateless Outside Tokyo

- Improves scalability
- Reduces risk exposure
- Keeps sensitive data isolated

---

## 🔍 Validation

The Tokyo region was validated by:

- Successful EC2 deployment in private subnets
- Verified ALB routing
- Confirmed Transit Gateway connectivity
- Secure communication with GCP via VPN

---

## 🧠 Summary

The Tokyo region acts as the **secure backbone** of the architecture:

- Hosts all sensitive data (RDS)
- Controls global traffic flow (Transit Gateway)
- Serves applications via private infrastructure
- Enforces strict security and compliance boundaries

This design reflects real-world enterprise architecture patterns used in regulated environments.