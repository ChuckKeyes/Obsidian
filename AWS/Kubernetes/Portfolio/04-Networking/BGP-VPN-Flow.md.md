
# 🌐 Multi-Cloud Networking — BGP & VPN Flow

## 🎯 Objective

Establish secure, dynamic connectivity between AWS and GCP using HA VPN and BGP routing.

This enables real-time communication between cloud environments without manual route management.

---

## 🧠 Architecture Overview

This design connects:

- AWS (Tokyo + São Paulo)
- GCP (Iowa + NY)

Using:

- AWS Transit Gateway (central hub)
- GCP Network Connectivity Center (hub-and-spoke)
- HA VPN tunnels (encrypted)
- BGP (dynamic routing)

---

## 🔗 Core Components

### AWS Side
- Transit Gateway (TGW)
- VPC attachments
- VPN attachment

### GCP Side
- Network Connectivity Center (NCC)
- Cloud Router (BGP)
- HA VPN Gateway

---

## 🔐 VPN Connectivity

- IPSec tunnels between AWS and GCP
- High availability (multiple tunnels)
- Encrypted traffic across public internet

---

## 📸 VPN & BGP Proof

![[../Screenshots/gcp/gcp-vpn-status.png]]

![[../Screenshots/gcp/BGP-VPN.png]]

👉 Confirms:
- VPN tunnels are UP
- BGP sessions established
- Routes exchanged dynamically

---

## 🔄 BGP Routing Behavior

### Dynamic Routing

- AWS advertises VPC CIDRs
- GCP advertises VPC CIDRs
- Routes automatically learned

---

### Example

- AWS learns: `10.30.0.0/24` (GCP Iowa)
- GCP learns: `10.10.0.0/16` (Tokyo VPC)

---

## 📸 NCC Architecture

![[../Screenshots/gcp/gcp-ncc-hub.png]]

![[../Screenshots/gcp/gcp-ncc-spokes.png]]

👉 Confirms:
- Hub-and-spoke topology
- Centralized routing in GCP

---

## 🔁 Traffic Flow Example

### User Request Path

1. User → CloudFront
2. CloudFront → ALB (Tokyo)
3. ALB → EC2 (Tokyo)
4. EC2 → RDS (Tokyo)

---

### Cross-Cloud Flow

1. AWS EC2 → Transit Gateway
2. TGW → VPN Tunnel
3. VPN → GCP Cloud Router
4. Router → GCP VPC (VM)

---

## 🔐 Security Design

- Only approved CIDRs advertised
- No open routing
- All traffic encrypted (IPSec)
- Private IP communication only

---

## 🧪 Validation

Verified:

- BGP sessions = ESTABLISHED
- Routes visible in both clouds
- Cross-cloud ping successful
- No packet loss across VPN

---

## 🧠 Why This Matters

This design:

- Eliminates static routing
- Enables automatic failover
- Scales across regions and clouds
- Reflects real enterprise hybrid networking

---

## 🧠 Summary

The networking layer enables:

- Secure AWS ↔ GCP communication
- Dynamic route exchange using BGP
- High availability via HA VPN
- Centralized routing via TGW and NCC

This is the core of the multi-cloud architecture.