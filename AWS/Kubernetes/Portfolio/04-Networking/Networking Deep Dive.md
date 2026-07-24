# 🔀 Networking Deep Dive – BGP Flow, TGW, and Route Propagation

---

## 🧭 Overview

This section explains how traffic flows across AWS and GCP using:

- AWS Transit Gateway (TGW)
- TGW Route Tables & Propagation
- HA VPN
- BGP Dynamic Routing

The design ensures **automatic route exchange, high availability, and scalable multi-region connectivity**.

---

## 🧭 Architecture Diagram (Routing Flow)

![BGP Flow Diagram](../Portfolio Files/Diagrams/network-bgp-flow.png)

---

## 🔗 Quick Navigation

- [[01-Architecture]]
- [[02-AWS-Deep-Dive]]
- [[03-GCP-Networking]]
- [[06-Compute]]

---

## 🧱 Core Components

---

### 🌐 AWS Transit Layer

- **:contentReference[oaicite:0]{index=0} (TGW)**

✔ Central routing hub in AWS  
✔ Connects VPCs, VPNs, and regions  
✔ Simplifies network architecture  

---

### 🔀 TGW Route Tables

Each TGW has route tables that control:

- Which networks can talk to each other
- How traffic is forwarded

✔ Separate route tables = better isolation  
✔ Supports large-scale architectures  

---

### 🔗 Attachments

- VPC attachments (Tokyo, São Paulo)
- VPN attachment (to GCP)

✔ Each attachment participates in routing  

---

### 🔐 VPN + BGP Layer

- HA VPN (AWS ↔ GCP)
- BGP sessions exchange routes dynamically

✔ No static routing required  
✔ Automatic failover  

---

## 🔄 Route Propagation

### What it means:
- Routes are **automatically learned and shared** between networks

Example:
- GCP advertises: `10.30.0.0/24`
- AWS learns this via BGP
- TGW propagates route to VPCs

✔ Dynamic and scalable  
✔ Reduces manual configuration  

---

## 🔁 Traffic Flow Example (End-to-End)

### Scenario: GCP VM → AWS RDS

1. GCP VM sends request
2. Route goes to NCC Hub
3. Enters HA VPN tunnel
4. Reaches AWS TGW
5. TGW route table sends traffic to Tokyo VPC
6. Traffic reaches RDS

Return path follows same route back

---

## 🔀 AWS Multi-Region Routing

### Tokyo ↔ São Paulo

- TGW in Tokyo peers with TGW in São Paulo
- Routes propagate across TGW peering

✔ Enables inter-region communication  
✔ Maintains centralized control  

---

## 📊 Route Table Example (Concept)

### Tokyo TGW Route Table

| Destination | Target |
|------------|--------|
| 10.10.0.0/16 (Tokyo VPC) | Local |
| 10.20.0.0/16 (São Paulo) | TGW Peering |
| 10.30.0.0/24 (GCP Iowa) | VPN Attachment |

---

## 🧠 Key Design Decisions

---

### 1. Transit Gateway as Hub

- Avoids complex VPC peering mesh
- Central control point

✔ Scalable architecture  

---

### 2. BGP over Static Routes

- Routes auto-update
- Supports failover

✔ Enterprise best practice  

---

### 3. Route Propagation Enabled

- Reduces manual routing errors
- Ensures connectivity between networks

✔ Operational simplicity  

---

### 4. Segmented Route Tables

- Control traffic between environments
- Improve security

✔ Network isolation  

---

## 🔐 Security Considerations

- Only approved CIDR ranges are propagated
- No default route (0.0.0.0/0) shared across VPN
- Security groups still enforce access

✔ Defense-in-depth  

---

## ⚙️ High Availability

- Dual VPN tunnels
- BGP failover
- Multi-region TGW design

✔ No single point of failure  

---

## 📊 Monitoring & Troubleshooting

### Tools:
- AWS VPC Flow Logs
- CloudWatch metrics
- GCP VPN logs

→ [[08-Monitoring]]

### What to check:
- BGP session status
- Route table entries
- Packet flow

---

## 📌 What This Page Demonstrates

- Deep networking knowledge  
- Understanding of BGP routing  
- Multi-region + multi-cloud connectivity  
- Enterprise network design patterns  

---

## 🏁 Outcome

This routing design enables:

- Seamless AWS ↔ GCP communication  
- Dynamic, scalable networking  
- Secure and controlled traffic flow  

---

## 👉 Next Step

➡️ [[05-Terraform]] (Infrastructure as Code – Full Deployment Automation)
