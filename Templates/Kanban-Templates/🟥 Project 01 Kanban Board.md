AWS ↔ GCP Multi-Cloud HA Architecture (TGW + NCC + HA VPN)


kanban-plugin: basic

---

# 📌 Project 01 — AWS ↔ GCP Multi-Cloud HA Architecture  
### (Transit Gateway + NCC + HA VPN + Thin Client Global Test Network)

## 🟦 To Do
- [ ] Build AWS TGW Terraform module  
- [ ] Build GCP NCC Terraform module  
- [ ] Create HA VPN tunnels (2x)  
- [ ] Create BGP sessions (AWS ASN / GCP ASN)  
- [ ] Define global CIDR plan for test sites  
- [ ] Create Thin-Client VPC module  
- [ ] Create Web Testing Server VPC module  
- [ ] Assign firewall rules for inter-cloud flows  
- [ ] Create Draw.io architecture diagram  
- [ ] Create dev tfvars  
- [ ] Create prod tfvars  
- [ ] Build readme.md for architecture  
- [ ] Create pre-shared keys and store locally  

## 🟨 In Progress
- [ ] NCC hub initial diagram  
- [ ] TGW attachment combinations  
- [ ] Router-VM testing setup  
- [ ] Terraform module refactoring  

## 🟧 Blocked / Waiting
- [ ] Need IP addressing approval  
- [ ] Need BGP ASN confirmation  
- [ ] Need final list of Cisco AWS VPCs  

## 🟩 In Review
- [ ] Multi-cloud folder structure  
- [ ] CIDR addressing draft  
- [ ] NCC routing table mapping  
- [ ] TGW routing design  

## 🟪 Completed
- [x] Create Project-01 folder  
- [x] Add subfolders for Terraform, Diagrams, Docs  
- [x] Install Kanban plugin  
