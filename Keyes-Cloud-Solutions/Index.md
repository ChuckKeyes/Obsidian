[[Keyes-Cloud-Solutions/Project-01-AWS-GCP-MultiCloud/Architecture/Design-Docs/High-Level-Design]]

# 🌐 Keyes Cloud Solutions  
### **Multi-Project Architecture | Terraform | Cloud Engineering**

Welcome to the centralized hub for all active and upcoming Keyes Cloud Solutions projects.  
Use this page to navigate **architecture**, **Terraform code**, **documentation**, **testing**, **deliverables**, and **templates** across AWS, GCP, and Azure.

---

## 🧭 **Global Navigation**

### **📁 Shared Templates**
Reusable patterns, modules, and example architectures.

<<<<<<< HEAD
- [[Templates/AWS-Templates|AWS Templates]]
=======
- [[00-Shared-Templates/AWS-Templates|AWS Templates]]
>>>>>>> 9911d879902207ad42e898bb4513e878248f5488
- [[00-Shared-Templates/GCP-Templates|GCP Templates]]
- [[00-Shared-Templates/Azure-Templates|Azure Templates]]
- [[00-Shared-Templates/MultiCloud-Patterns|Multi-Cloud Patterns]]
- [[00-Shared-Templates/Module-Library|Terraform Module Library]]

---

## 🧰 **🟦 Project 01 — AWS ↔ GCP Multi-Cloud HA Architecture**

> Unified testing platform connecting AWS Transit Gateway and GCP NCC with HA VPN, plus Thin-Client and Global Test Sites.

### 🔹 Architecture  
- [[Project-01-AWS-GCP-MultiCloud/Architecture/Diagrams|Diagrams]]  
- [[Project-01-AWS-GCP-MultiCloud/Architecture/Design-Docs|Design Docs]]  
- [[Project-01-AWS-GCP-MultiCloud/Architecture/Reference|Reference Material]]

### 🔹 Terraform  
- [[Project-01-AWS-GCP-MultiCloud/Terraform/AWS|AWS Code]]  
- [[Project-01-AWS-GCP-MultiCloud/Terraform/GCP|GCP Code]]  
- [[Project-01-AWS-GCP-MultiCloud/Terraform/Modules|Project Modules]]  
- [[Project-01-AWS-GCP-MultiCloud/Terraform/env-dev|Environment: Dev]]  
- [[Project-01-AWS-GCP-MultiCloud/Terraform/env-prod|Environment: Prod]]

### 🔹 Documentation  
- [[Project-01-AWS-GCP-MultiCloud/Documentation/Instructor-Version|Instructor Version]]  
- [[Project-01-AWS-GCP-MultiCloud/Documentation/Portfolio-Version|Portfolio Version]]

### 🔹 Testing  
- [[Project-01-AWS-GCP-MultiCloud/Testing/Test-Results|Test Results]]  
- [[Project-01-AWS-GCP-MultiCloud/Testing/Troubleshooting|Troubleshooting Guide]]

### 🔹 Deliverables  
- [[Project-01-AWS-GCP-MultiCloud/Deliverables|PDFs, Diagrams, & Final Docs]]

---

## 🟥 **Project 02 — AWS Network Redesign (Internal)**

> Redesign AWS VPCs, subnets, routing, NAT strategy, and security boundaries.

### 🔹 Architecture  
- [[Project-02-AWS-Network-Redesign/Architecture/Diagrams|Diagrams]]  
- [[Project-02-AWS-Network-Redesign/Architecture/Design-Docs|Design Docs]]

### 🔹 Terraform  
- [[Project-02-AWS-Network-Redesign/Terraform/AWS|AWS Code]]  
- [[Project-02-AWS-Network-Redesign/Terraform/env-dev|Dev Environment]]  
- [[Project-02-AWS-Network-Redesign/Terraform/env-prod|Prod Environment]]

### 🔹 Documentation  
- [[Project-02-AWS-Network-Redesign/Documentation/Instructor-Version|Instructor Version]]  
- [[Project-02-AWS-Network-Redesign/Documentation/Portfolio-Version|Portfolio Version]]

### 🔹 Testing  
- [[Project-02-AWS-Network-Redesign/Testing/Test-Results|Test Results]]  
- [[Project-02-AWS-Network-Redesign/Testing/Troubleshooting|Troubleshooting]]

### 🔹 Deliverables  
- [[Project-02-AWS-Network-Redesign/Deliverables|Project Deliverables]]

---

## 🟩 **Project 03 — GCP Data Center Migration**

> Move internal DC services to GCP using VPC architecture, NCC hub, and router-VM connectivity.

### 🔹 Architecture  
- [[Project-03-GCP-DataCenter-Migration/Architecture/Diagrams|Diagrams]]  
- [[Project-03-GCP-DataCenter-Migration/Architecture/Design-Docs|Design Docs]]

### 🔹 Terraform  
- [[Project-03-GCP-DataCenter-Migration/Terraform/GCP|GCP Code]]  
- [[Project-03-GCP-DataCenter-Migration/Terraform/env-dev|Dev Environment]]  
- [[Project-03-GCP-DataCenter-Migration/Terraform/env-prod|Prod Environment]]

### 🔹 Documentation  
- [[Project-03-GCP-DataCenter-Migration/Documentation/Instructor-Version|Instructor Version]]  
- [[Project-03-GCP-DataCenter-Migration/Documentation/Portfolio-Version|Portfolio Version]]

### 🔹 Testing  
- [[Project-03-GCP-DataCenter-Migration/Testing/Test-Results|Test Results]]  
- [[Project-03-GCP-DataCenter-Migration/Testing/Troubleshooting|Troubleshooting]]

### 🔹 Deliverables  
- [[Project-03-GCP-DataCenter-Migration/Deliverables|Project Deliverables]]

---

## 📸 **Portfolio Section**

### 🔹 Public-Facing, Recruiter-Ready Materials  
- [[Portfolio/Case-Studies|Case Studies]]  
- [[Portfolio/Images|Portfolio Images]]  
- [[Portfolio/Website-Files|Website Content]]

---

## 🔒 Local-Only Files (Excluded From GitHub)

- SSH keys  
- service-account.json  
- tfvars / credentials  
- terraform.tfstate  
- scratch notes  
- psk files  
- caches and temp files  

These should always live under:  
**`Local-Only/`** inside each project.

---

## 🧱 Project Template (Copy to Create New Projects)

Use this as the master folder layout:

- [[00-Shared-Templates|Shared Templates]]
- Copy any project folder such as:  
  `Project-01-AWS-GCP-MultiCloud` → rename → “Project-04-Azure-Integration”

---

## 🧩 Helpful Supporting Scripts

- `push_update.sh` – automatic Git add/pull/commit/push  
- `make_kcs_structure.sh` – generate complete project skeleton  
- `terraform-clean.sh` – safely remove .terraform folders  

(Place scripts in vault root for convenience.)

---

If you want, I can also generate a **Kanban board**, **dashboard with callouts**, or a **toolbar-style navigation menu** for Obsidian.

Just tell me:  
**“Make the dashboard version.”**

