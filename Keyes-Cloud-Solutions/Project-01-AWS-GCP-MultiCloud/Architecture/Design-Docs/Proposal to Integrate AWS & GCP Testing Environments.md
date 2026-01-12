Submitted by: Keyes Cloud Solutions LLC**

## **Executive Summary**

Following the acquisition of the Cisco Testing Division—whose testing infrastructure operates in AWS—your organization now manages cloud-based testing systems across **AWS and Google Cloud Platform (GCP)**. These environments currently function independently, resulting in:

- Fragmented tester experience
    
- Redundant cloud VPC architectures
    
- Increased operational overhead
    
- Higher security and compliance complexity
    
- No unified management or routing strategy
    

Keyes Cloud Solutions proposes designing and implementing a **Unified Multi-Cloud Testing Architecture** that connects AWS and GCP seamlessly using industry-proven patterns:

- **AWS Transit Gateway (TGW)** as the aggregation hub on the AWS side
    
- **GCP Network Connectivity Center (NCC)** as the aggregation hub on the GCP side
    
- **High-Availability Site-to-Site VPN with BGP** as the secure bridge between clouds
    
- A single **Thin Client Server** in GCP accessible by BOTH AWS and GCP testers
    
- Centralized routing, identity, and firewall policy management
    
- Zero disruption to existing Cisco AWS testers or existing GCP testers
    

This solution will provide a **unified, highly available, multi-cloud lab platform** that is simple for engineers to maintain and intuitive for testers to use.

---

# 🗺️ **High-Level Architecture Overview**

![https://miro.medium.com/1%2Aqj6vYkj33TBVqiW-FVjNhQ.gif](https://miro.medium.com/1%2Aqj6vYkj33TBVqiW-FVjNhQ.gif)

![https://miro.medium.com/v2/resize%3Afit%3A1200/0%2A8taSiiS5W607DyVF](https://miro.medium.com/v2/resize%3Afit%3A1200/0%2A8taSiiS5W607DyVF)

![https://miro.medium.com/1%2Ac9i-p-CxGMnNYVuwOuwmNw.png](https://miro.medium.com/1%2Ac9i-p-CxGMnNYVuwOuwmNw.png)

6

### **Key Components**

- **AWS Transit Gateway (TGW)**  
    Aggregates AWS VPCs and provides a single connection point to GCP.
    
- **GCP Network Connectivity Center (NCC)**  
    Acts as GCP’s central network hub for global VPCs, test sites, and cloud routers.
    
- **HA Site-to-Site VPN with BGP**  
    Provides secure, redundant, dynamic routing between AWS TGW and GCP NCC.
    
- **Thin Client Server (GCP)**  
    Central login point for _all testers_ (AWS + GCP).
    
- **Web Testing Server (GCP)**  
    Centralized test execution point accessible from both clouds.
    
- **Route isolation**  
    Finance, Production, and Data Center remain isolated from testers.
    

---

# 🎯 **Business Objectives**

### **1. Unified Tester Access**

Regardless of where the tester originates:

- Cisco testers remain in AWS
    
- Global testers remain in GCP
    
- BOTH gain seamless access to the testing platform
    

### **2. Simplified Network Operations**

Instead of managing:

- Multiple VPC peering links
    
- Many independent VPN tunnels
    
- Custom routing per environment
    

You transition to:

- **Two hubs (TGW + NCC)**
    
- **One HA VPN**
    
- **Centralized routing**
    
- **Clear segmentation**
    

### **3. HA Multi-Cloud Connectivity**

Built using:

- Dual AWS VPN tunnels
    
- Dual GCP Cloud VPN gateways
    
- BGP routing on all links
    
- Automatic failover
    

### **4. Future Expansion**

Easy to add:

- New AWS VPCs (Cisco teams)
    
- New GCP global test sites
    
- New countries / regions
    
- Future Azure integration
    
- On-prem testing sites
    

This architecture is scalable for 5–10 years.

---

# 🏗️ **Technical Approach (How Keyes Cloud Solutions Will Deliver)**

### **Phase 1 — Architecture & Design**

Deliverables:

- Detailed multi-cloud network diagram
    
- Routing plan (CIDRs, BGP ASNs, prefix lists)
    
- Security segmentation plan
    
- High availability design
    
- Naming, tagging, and logging standards
    
- Terraform module plan (AWS, GCP, NCC, TGW)
    

### **Phase 2 — AWS Build (Cisco side)**

- Deploy Transit Gateway
    
- Attach Cisco testing VPCs
    
- Configure TGW routing tables
    
- Create BGP-enabled VPN attachment to GCP
    
- Validate routing & failover
    

### **Phase 3 — GCP Build (Your side)**

- Deploy NCC hub
    
- Deploy HA VPN gateways
    
- Create Router Interfaces & BGP sessions
    
- Connect NCC spokes:
    
    - HQ VPC
        
    - Foreign test sites (Japan, Brazil, Italy, Thailand)
        
    - Web Server
        
    - Thin Client Server
        
    - Data Center
        
- Validate GCP global routing
    

### **Phase 4 — AWS ↔ GCP HA VPN Integration**

- Deploy 4 VPN tunnels (IPsec)
    
- Enable dynamic routing with BGP
    
- Configure route advertisement + route acceptance
    
- Validate failover scenarios
    
- End-to-end connectivity testing
    

### **Phase 5 — Thin Client & Web Server Integration**

- Place Thin Client Server so BOTH clouds access it
    
- Confirm AWS testers can reach:
    
    - Thin Client Server
        
    - Web Testing Server
        
- Confirm GCP testers maintain full functionality
    

### **Phase 6 — Documentation & Handoff**

- Build full Terraform codebase for ongoing deployment
    
- Provide topology diagrams
    
- Provide runbooks for junior engineers
    
- Train internal engineering teams
    

---

# 📦 **Deliverables**

### Keyes Cloud Solutions will deliver:

- **Multi-Cloud High Availability Architecture Design**
    
- **AWS TGW + GCP NCC HA VPN Build**
    
- **Unified Multi-Cloud Test Lab**
    
- **Terraform automation for AWS & GCP**
    
- **Firewall, routing, and segmentation policy**
    
- **Operational Runbook for internal teams**
    
- **10-page Executive Overview**
    
- **Full draw.io / Lucidchart architecture diagram**
    
- **Testing and validation plan**
    
- **Knowledge transfer sessions**
    

---

# 💰 **Estimated Project Timeline & Effort**

### Duration: **6–8 weeks**

### Effort: **80–120 engineering hours**

|Phase|Estimated Hours|
|---|---|
|Architecture|15|
|AWS TGW Build|20|
|GCP NCC Build|20|
|HA VPN integration|20|
|Testing & validation|15|
|Documentation & handoff|10|

---

# 🏆 **Why Keyes Cloud Solutions**

- Expert in **multi-cloud architecture** (AWS + GCP + future Azure)
    
- Direct experience with **NCC**, **HA VPN**, and **Transit Gateway**
    
- Background with **global testing infrastructure**
    
- Ability to simplify cloud networking for junior engineers
    
- Strong documentation and training capability
    
- Focus on **high availability**, **security**, and **scalability**
    

---

# ✔️ **Conclusion**

This proposal provides a **unified, secure, highly available** multi-cloud architecture that integrates legacy Cisco AWS testers with your global GCP testing network. It reduces operational complexity, increases reliability, and provides a smooth experience for testers and engineers.

Keyes Cloud Solutions is fully prepared to design and deliver this solution end-to-end.

---

# Want the next step?

I can generate:

### 🔹 A **PDF version** of this proposal (ready for management)

### 🔹 A **PowerPoint / Google Slides deck** for the IT Director

### 🔹 A **Terraform starter folder** for AWS TGW + GCP NCC

### 🔹 A **draw.io architecture diagram** with AWS + GCP icons

### 🔹 A **write-up for your portfolio website**

Just tell me what you want next:

**“Make the PDF.”**  
**“Make the slide deck.”**  
**“Make the TGW/NCC Terraform skeleton.”**  
**“Make the architecture diagram.”**Submitted by: Keyes Cloud Solutions LLC**

## **Executive Summary**

Following the acquisition of the Cisco Testing Division—whose testing infrastructure operates in AWS—your organization now manages cloud-based testing systems across **AWS and Google Cloud Platform (GCP)**. These environments currently function independently, resulting in:

- Fragmented tester experience
    
- Redundant cloud VPC architectures
    
- Increased operational overhead
    
- Higher security and compliance complexity
    
- No unified management or routing strategy
    

Keyes Cloud Solutions proposes designing and implementing a **Unified Multi-Cloud Testing Architecture** that connects AWS and GCP seamlessly using industry-proven patterns:

- **AWS Transit Gateway (TGW)** as the aggregation hub on the AWS side
    
- **GCP Network Connectivity Center (NCC)** as the aggregation hub on the GCP side
    
- **High-Availability Site-to-Site VPN with BGP** as the secure bridge between clouds
    
- A single **Thin Client Server** in GCP accessible by BOTH AWS and GCP testers
    
- Centralized routing, identity, and firewall policy management
    
- Zero disruption to existing Cisco AWS testers or existing GCP testers
    

This solution will provide a **unified, highly available, multi-cloud lab platform** that is simple for engineers to maintain and intuitive for testers to use.

---

# 🗺️ **High-Level Architecture Overview**

![https://miro.medium.com/1%2Aqj6vYkj33TBVqiW-FVjNhQ.gif](https://miro.medium.com/1%2Aqj6vYkj33TBVqiW-FVjNhQ.gif)

![https://miro.medium.com/v2/resize%3Afit%3A1200/0%2A8taSiiS5W607DyVF](https://miro.medium.com/v2/resize%3Afit%3A1200/0%2A8taSiiS5W607DyVF)

![https://miro.medium.com/1%2Ac9i-p-CxGMnNYVuwOuwmNw.png](https://miro.medium.com/1%2Ac9i-p-CxGMnNYVuwOuwmNw.png)

6

### **Key Components**

- **AWS Transit Gateway (TGW)**  
    Aggregates AWS VPCs and provides a single connection point to GCP.
    
- **GCP Network Connectivity Center (NCC)**  
    Acts as GCP’s central network hub for global VPCs, test sites, and cloud routers.
    
- **HA Site-to-Site VPN with BGP**  
    Provides secure, redundant, dynamic routing between AWS TGW and GCP NCC.
    
- **Thin Client Server (GCP)**  
    Central login point for _all testers_ (AWS + GCP).
    
- **Web Testing Server (GCP)**  
    Centralized test execution point accessible from both clouds.
    
- **Route isolation**  
    Finance, Production, and Data Center remain isolated from testers.
    

---

# 🎯 **Business Objectives**

### **1. Unified Tester Access**

Regardless of where the tester originates:

- Cisco testers remain in AWS
    
- Global testers remain in GCP
    
- BOTH gain seamless access to the testing platform
    

### **2. Simplified Network Operations**

Instead of managing:

- Multiple VPC peering links
    
- Many independent VPN tunnels
    
- Custom routing per environment
    

You transition to:

- **Two hubs (TGW + NCC)**
    
- **One HA VPN**
    
- **Centralized routing**
    
- **Clear segmentation**
    

### **3. HA Multi-Cloud Connectivity**

Built using:

- Dual AWS VPN tunnels
    
- Dual GCP Cloud VPN gateways
    
- BGP routing on all links
    
- Automatic failover
    

### **4. Future Expansion**

Easy to add:

- New AWS VPCs (Cisco teams)
    
- New GCP global test sites
    
- New countries / regions
    
- Future Azure integration
    
- On-prem testing sites
    

This architecture is scalable for 5–10 years.

---

# 🏗️ **Technical Approach (How Keyes Cloud Solutions Will Deliver)**

### **Phase 1 — Architecture & Design**

Deliverables:

- Detailed multi-cloud network diagram
    
- Routing plan (CIDRs, BGP ASNs, prefix lists)
    
- Security segmentation plan
    
- High availability design
    
- Naming, tagging, and logging standards
    
- Terraform module plan (AWS, GCP, NCC, TGW)
    

### **Phase 2 — AWS Build (Cisco side)**

- Deploy Transit Gateway
    
- Attach Cisco testing VPCs
    
- Configure TGW routing tables
    
- Create BGP-enabled VPN attachment to GCP
    
- Validate routing & failover
    

### **Phase 3 — GCP Build (Your side)**

- Deploy NCC hub
    
- Deploy HA VPN gateways
    
- Create Router Interfaces & BGP sessions
    
- Connect NCC spokes:
    
    - HQ VPC
        
    - Foreign test sites (Japan, Brazil, Italy, Thailand)
        
    - Web Server
        
    - Thin Client Server
        
    - Data Center
        
- Validate GCP global routing
    

### **Phase 4 — AWS ↔ GCP HA VPN Integration**

- Deploy 4 VPN tunnels (IPsec)
    
- Enable dynamic routing with BGP
    
- Configure route advertisement + route acceptance
    
- Validate failover scenarios
    
- End-to-end connectivity testing
    

### **Phase 5 — Thin Client & Web Server Integration**

- Place Thin Client Server so BOTH clouds access it
    
- Confirm AWS testers can reach:
    
    - Thin Client Server
        
    - Web Testing Server
        
- Confirm GCP testers maintain full functionality
    

### **Phase 6 — Documentation & Handoff**

- Build full Terraform codebase for ongoing deployment
    
- Provide topology diagrams
    
- Provide runbooks for junior engineers
    
- Train internal engineering teams
    

---

# 📦 **Deliverables**

### Keyes Cloud Solutions will deliver:

- **Multi-Cloud High Availability Architecture Design**
    
- **AWS TGW + GCP NCC HA VPN Build**
    
- **Unified Multi-Cloud Test Lab**
    
- **Terraform automation for AWS & GCP**
    
- **Firewall, routing, and segmentation policy**
    
- **Operational Runbook for internal teams**
    
- **10-page Executive Overview**
    
- **Full draw.io / Lucidchart architecture diagram**
    
- **Testing and validation plan**
    
- **Knowledge transfer sessions**
    

---

# 💰 **Estimated Project Timeline & Effort**

### Duration: **6–8 weeks**

### Effort: **80–120 engineering hours**

|Phase|Estimated Hours|
|---|---|
|Architecture|15|
|AWS TGW Build|20|
|GCP NCC Build|20|
|HA VPN integration|20|
|Testing & validation|15|
|Documentation & handoff|10|

---

# 🏆 **Why Keyes Cloud Solutions**

- Expert in **multi-cloud architecture** (AWS + GCP + future Azure)
    
- Direct experience with **NCC**, **HA VPN**, and **Transit Gateway**
    
- Background with **global testing infrastructure**
    
- Ability to simplify cloud networking for junior engineers
    
- Strong documentation and training capability
    
- Focus on **high availability**, **security**, and **scalability**
    

---

# ✔️ **Conclusion**

This proposal provides a **unified, secure, highly available** multi-cloud architecture that integrates legacy Cisco AWS testers with your global GCP testing network. It reduces operational complexity, increases reliability, and provides a smooth experience for testers and engineers.

Keyes Cloud Solutions is fully prepared to design and deliver this solution end-to-end.

---

# Want the next step?

I can generate:

### 🔹 A **PDF version** of this proposal (ready for management)

### 🔹 A **PowerPoint / Google Slides deck** for the IT Director

### 🔹 A **Terraform starter folder** for AWS TGW + GCP NCC

### 🔹 A **draw.io architecture diagram** with AWS + GCP icons

### 🔹 A **write-up for your portfolio website**

Just tell me what you want next:

**“Make the PDF.”**  
**“Make the slide deck.”**  
**“Make the TGW/NCC Terraform skeleton.”**  
**“Make the architecture diagram.”**