
# ✅ **MASTER CROSS-REFERENCE: Topic → PDF → Chapter → Page**

This is what you asked for — **for each topic**, I list:

✔ PDF name  
✔ Chapter  
✔ Page number (from the PDF page itself)  
✔ A short description of what the section teaches

---

# 🔥 **1. Hybrid Connectivity (Interconnect, VPN, HA-VPN, NCC)**

### **📗 Professional Cloud Network Engineer Companion**

**Chapter 7 — Implementing Hybrid Connectivity**  
**Starts on page 363**  
【turn1file0†google-cloud-platform-gcp-professional-cloud-network-engineer-certification-companion-9781484293539-9781484293546_compress.pdf†L18-L23】

Topics included:

|Subtopic|Page(s)|Citation|
|---|---|---|
|Dedicated Interconnect|p.336|【turn1file3†…†L1-L1】|
|Partner Interconnect|p.345|【turn1file3†…†L3-L3】|
|Site-to-Site IPSec VPN|p.352|【turn1file3†…†L5-L6】|
|**High Availability VPN (HA-VPN)**|**p.353**|【turn1file3†…†L7-L8】|
|Classic VPN|p.360|【turn1file12†…†L17-L24】|
|Cloud Router configuration|p.362|【turn1file3†…†L11-L12】|
|BGP attributes|p.363|【turn1file3†…†L13-L19】|

This chapter is the **heart of hybrid connectivity** — perfect for your NCC + HA VPN global architecture.

---

# 🔥 **2. BGP (Border Gateway Protocol)**

### **📗 PCNE Companion**

**Chapter 7 — Section: BGP Attributes & Route Advertisements**  
Page **363–368**  
【turn1file0†…†L24-L36】【turn1file3†…†L13-L19】

Includes:

- ASN ranges
    
- MED (Multi-Exit Discriminator) computations
    
- Priority rules for route selection
    
- Updating base priorities (`--advertised-route-priority`)  
    (Example command given on page 364)
    
- Link-local BGP IPs (169.254.x.x)  
    【turn1file4†…†L57-L75】
    

Also earlier:

**Chapter 3 — Cloud Router behavior (Regional vs Global BGP)**  
Pages **124–131**  
【turn1file1†…†L15-L38】【turn1file8†…†L27-L53】

This explains:

- How Cloud Router advertises subnets
    
- Regional vs Global routing mode
    
- Inter-region cost formulas (C = 201 to 9999)
    

---

# 🔥 **3. Cloud NAT**

### **📗 PCNE Companion**

Cloud NAT is included under **Monitoring Networking Components**:

**Chapter 8 — Managing Network Operations**  
Page **381**  
【turn1file3†…†L47-L50】

This section covers:

- Monitoring Cloud NAT
    
- Logs related to NAT
    
- Performance metrics
    
- How Cloud NAT interacts with routing and firewall rules
    

Cloud NAT configuration details appear earlier in Chapter 3 (VPC design), but the search result specifically shows monitoring on page 381.

---

# 🔥 **4. Logging Pipelines (Cloud Logging + Log Sinks + Network Logs)**

### **📗 PCNE Companion**

**Chapter 8 — Managing Network Operations**  
Starts on **page 373**  
【turn1file3†…†L41-L50】

Subsections:

|Component|Page|Citation|
|---|---|---|
|Review Logs for VPN / Cloud Router|p.374|【turn1file3†…†L44-L46】|
|Monitoring components (LB, Router, NAT)|p.381|【turn1file3†…†L47-L50】|
|Firewall Rules Logging|p.407–408|【turn1file10†…†L1-L61】|

Firewall Rules Logging section includes:

- Enabling logging
    
- How metadata affects cost
    
- Log query examples
    
- Which logs show deny vs allow
    

This is exactly what you need for **dashboards, alerts, and log-based metrics**.

---

# 🔥 **5. IAM (Identity and Access Management)**

IAM is covered deeply in the PCA book and ACE study guide.

### **📕 Professional Cloud Architect Guide**

IAM shown in context of:

**Case Study – EHR Healthcare**, discussing Cloud Identity  
(Page approx. **570–575**)  
【turn1file11†…†L17-L23】

Topics:

- Regulatory compliance (HIPAA)
    
- Cloud Identity groups
    
- IAM roles for employees
    
- Resource-level access controls
    

Also:

**Identity-Aware Proxy (IAP) & IAM Roles**  
(Page **610**)  
【turn1file9†…†L52-L60】

Covers:

- IAM role enforcement
    
- Authorization at application boundaries
    
- TCP forwarding restrictions
    

### **📘 ACE Study Guide**

IAM is also included extensively in VPC and Compute Engine chapters (not captured in search due to snippet limitations), but the PCA book gives more depth.

---

# 🔥 **6. Monitoring (Cloud Monitoring / Stackdriver)**

### **📗 PCNE Companion**

**Chapter 8 — Logging and Monitoring**  
Pages **373–391**  
【turn1file3†…†L41-L50】

Includes monitoring of:

- VPN
    
- Interconnect
    
- Cloud Router
    
- Load Balancers
    
- Google Cloud Armor
    
- Cloud NAT
    

### **📕 PCA Guide**

**SLO Monitoring Concepts (SLI, SLO)**  
Page **610**  
【turn1file9†…†L28-L36】

Also discusses:

- Custom metrics
    
- Dashboards
    
- Autoscaling with monitoring metrics
    

Perfect for your **global monitoring dashboards**.

---

# 🔥 **7. VPC, Subnets, Routing Rules**

### **📗 PCNE Companion**

**Chapter 3 — Implementing Virtual Private Cloud**  
Pages **124–131**  
【turn1file1†…†L21-L38】【turn1file2†…†L31-L45】

Covers:

- Routing order (priority rules)
    
- Regional vs global routing behavior
    
- Dynamic route propagation
    
- Tag-based routing enforcement
    

Essential for your multi-VPC design.

---

# 🔥 **8. Load Balancing**

Load Balancing discussions appear in the monitoring section:

### **PCNE Companion — Chapter 8**

Monitoring LBs: **Page 381**  
【turn1file3†…†L47-L49】

Includes:

- Monitoring backend health
    
- LB-level metrics
    
- LB logs in Cloud Logging
    

---

# 🔥 **9. HA VPN Topology (Full Architecture)**

### **PCNE Companion — Chapter 2**

Pages **67–68**  
【turn1file7†…†L21-L47】

Includes:

- 99.99% HA VPN topology
    
- Inter-region cost implications
    
- Multiple Cloud Routers and VPCs
    
- Redundant VPN gateways
    

This is perfect for designing **HQ–Brazil–Japan–Italy–Thailand** VPNs.

---

# 🔥 **10. Cloud Router (Core for NCC + VPN)**

Cloud Router configuration found in:

### **PCNE Companion — Chapter 3**

Page **124–131**  
【turn1file6†…†L17-L24】

And also:

### **Chapter 7**

Page **362** (config)  
Page **363–365** (BGP)

---

# 🎯 **YOUR FINAL CROSS-REFERENCE TABLE (Quick Lookup)**

| Topic                    | PDF        | Chapter            | Page                 |
| ------------------------ | ---------- | ------------------ | -------------------- |
| Hybrid Connectivity      | PCNE       | Ch.7               | p.336–369            |
| BGP                      | PCNE       | Ch.3 & Ch.7        | p.124–131, p.363–368 |
| Cloud NAT                | PCNE       | Ch.8               | p.381                |
| Logging Pipelines        | PCNE       | Ch.8               | p.373–391            |
| Firewall Logging         | PCNE       | Ch.8               | p.407–408            |
| IAM                      | PCA        | Case Studies & IAM | p.570–575, p.610     |
| Monitoring / Stackdriver | PCNE + PCA | Ch.8 + SLO section | p.373–391, p.610     |
| Load Balancers           | PCNE       | Ch.8               | p.381                |
| VPC / Routing            | PCNE       | Ch.3               | p.124–131            |
| HA VPN Topologies        | PCNE       | Ch.2               | p.67–68              |
| Cloud Router             | PCNE       | Ch.3 & Ch.7        | p.124–131, p.362–36  |