
# ☁️ GCP Deep Dive — Network Connectivity Center (NCC) & Hybrid Connectivity

## 🎯 Objective

The GCP environment extends the architecture by providing:

- Remote compute environments (Iowa + NY)
- Centralized network routing via NCC
- Secure connectivity to AWS via HA VPN and BGP

GCP is designed to be **stateless and secure**, with no sensitive data stored outside AWS Tokyo.

---

## 🧠 Architecture Overview

GCP consists of:

- Multiple VPC networks (Iowa + NY)
- Network Connectivity Center (hub-and-spoke)
- HA VPN gateway
- Cloud Router (BGP)
- Compute Engine VMs

---

## 🌐 VPC Network Design

Each region has its own VPC:

- **Iowa VPC (us-central1)** → primary GCP workload
- **NY VPC (simulated branch)** → remote access/testing

---

### 📸 VPC & VM Proof

![[../Screenshots/gcp/gcp-vpc-network.png]]

![[../Screenshots/gcp/gcp-vm-instances.png]]

👉 Confirms:
- VPC networks created
- VMs deployed with internal IPs
- Environment ready for hybrid communication

---

## 🔗 Network Connectivity Center (NCC)

### Role

NCC acts as the **central networking hub** in GCP:

- Connects multiple VPCs
- Simplifies routing between environments
- Integrates with hybrid VPN connections

---

### 📸 NCC Hub & Spokes

![[../Screenshots/gcp/gcp-ncc-hub.png]]

![[../Screenshots/gcp/gcp-ncc-spokes.png]]

👉 Confirms:
- Hub-and-spoke architecture
- Multiple VPCs connected centrally

---

## 🔐 HA VPN Configuration

### Components

- HA VPN Gateway
- Cloud Router (BGP)
- Multiple tunnels for redundancy

---

### 📸 VPN Status

![[../Screenshots/gcp/gcp-vpn-status.png]]

![[../Screenshots/gcp/BGP-VPN.png]]

👉 Confirms:
- VPN tunnels are active
- BGP sessions established
- Dynamic route exchange working

---

## 🔄 BGP Routing (Dynamic)

### Behavior

- GCP advertises its VPC CIDRs to AWS
- AWS advertises its VPC CIDRs to GCP
- Routes are learned automatically (no static routes)

---

### Example Routes

- Iowa VPC → `10.30.0.0/24`
- NY VPC → `10.40.0.0/24`
- AWS Tokyo → `10.10.0.0/16`

---

## 🔁 Traffic Flow

### GCP → AWS

1. GCP VM → NCC
2. NCC → Cloud Router
3. Cloud Router → VPN Tunnel
4. VPN → AWS Transit Gateway
5. TGW → Tokyo VPC

---

### AWS → GCP

1. EC2 → Transit Gateway
2. TGW → VPN Tunnel
3. VPN → Cloud Router
4. Router → NCC
5. NCC → Target VPC

---

## 🔐 Security Design

- No public IP required for internal communication
- Firewall rules restrict access to trusted CIDRs
- All traffic encrypted via IPSec VPN
- No sensitive data stored in GCP

---

## 🧠 Design Principles

### Stateless Design

- GCP hosts compute only
- No persistent PHI data stored
- Enables scalability and flexibility

---

### Separation of Concerns

- AWS = Data + Core Services
- GCP = Remote compute + extension

---

## 🧪 Validation

Verified:

- GCP VMs can reach AWS resources
- BGP routes visible in Cloud Router
- VPN tunnels stable and redundant
- NCC correctly routing traffic between VPCs

---

## 🧠 Summary

The GCP environment provides:

- Scalable remote compute infrastructure
- Centralized networking via NCC
- Secure hybrid connectivity using HA VPN and BGP
- Full integration with AWS via dynamic routing

This design reflects real-world multi-cloud architectures where GCP acts as an extension of AWS core services.