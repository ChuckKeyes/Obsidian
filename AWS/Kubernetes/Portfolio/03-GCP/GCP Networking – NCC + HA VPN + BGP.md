# 🌐 GCP Networking – NCC + HA VPN + BGP

---

## 🧭 Overview

This section covers the **Google Cloud networking architecture**, which connects GCP environments to AWS using **highly available VPN tunnels and dynamic routing (BGP)**.

At the center of this design is a **hub-and-spoke topology** using Network Connectivity Center (NCC), allowing scalable and secure integration with AWS Transit Gateway.

---

## 🧭 Architecture Diagram (GCP + AWS Integration)

![GCP Networking Architecture](../Portfolio Files/Diagrams/gcp-ncc-vpn-bgp.png)

---

## 🔗 Quick Navigation

- [[01-Architecture]]
- [[02-AWS-Deep-Dive]]
- [[04-Networking-BGP-Flow]]
- [[06-Compute]]

---

## 🧱 Core Components

### 🌐 Hub Layer

- **:contentReference[oaicite:0]{index=0} (NCC)**

✔ Central hub for all network connections  
✔ Enables scalable hub-and-spoke design  
✔ Simplifies multi-region and multi-cloud routing  

---

### 🔐 Connectivity Layer

- **HA VPN (High Availability VPN)**
- Dual tunnels for redundancy
- IPsec encryption

✔ Highly available connection to AWS  
✔ Automatic failover between tunnels  

---

### 🔀 Routing Layer

- **BGP (Border Gateway Protocol)**

✔ Dynamic route exchange between AWS and GCP  
✔ Eliminates need for static routes  
✔ Automatically adapts to topology changes  

---

### 🌎 Spoke Networks

- Iowa VPC → Test / Compute
- New York VPC → Branch simulation

✔ Connected to NCC hub  
✔ Can communicate with AWS resources  

---

## 🔄 Traffic Flow

1. GCP VM sends request
2. Traffic enters NCC hub
3. Routed through HA VPN tunnel
4. Reaches AWS Transit Gateway
5. Routed to Tokyo or São Paulo resources

---

## 🔀 AWS ↔ GCP Integration

### AWS Side:
- Transit Gateway (Tokyo)
- VPN attachment

### GCP Side:
- NCC Hub
- HA VPN Gateway
- Cloud Router (BGP)

→ [[04-Networking-BGP-Flow]]

✔ Full dynamic routing between clouds  
✔ No manual route management  

---

## 🧠 Key Design Decisions

---

### 1. Hub-and-Spoke (NCC)

- Centralized routing model
- Easy to scale new VPCs (just add spokes)

✔ Enterprise standard design  

---

### 2. HA VPN (Not Classic VPN)

- Provides redundancy
- Supports BGP

✔ Required for production-grade connectivity  

---

### 3. Dynamic Routing (BGP)

- Automatically exchanges routes
- Supports failover scenarios

✔ Critical for multi-cloud architecture  

---

### 4. Separation of Environments

- Iowa = test network
- NY = branch network

✔ Simulates real enterprise environments  

---

## 🔐 Security Design

- Encrypted VPN tunnels (IPsec)
- No public exposure of internal VMs
- Controlled routing via NCC + TGW

✔ Secure cross-cloud communication  

---

## ⚙️ High Availability

- Dual VPN tunnels
- Multiple regions
- Dynamic failover via BGP

✔ No single point of failure  

---

## 📊 Monitoring & Visibility

- GCP Monitoring (VPN status, BGP sessions)
- Logs for tunnel health
- Route visibility via Cloud Router

→ [[08-Monitoring]]

---

## 📌 What This Page Demonstrates

- Multi-cloud networking expertise  
- BGP-based dynamic routing  
- Secure hybrid cloud connectivity  
- Scalable hub-and-spoke architecture  

---

## 🏁 Outcome

This configuration successfully enables:

- Secure AWS ↔ GCP connectivity  
- Dynamic routing across clouds  
- Expansion-ready architecture  

---

## 👉 Next Step

➡️ [[04-Networking-BGP-Flow]] (Deep Dive: Routing + TGW + Route Propagation)
