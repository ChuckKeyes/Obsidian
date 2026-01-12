---

# ✅ **6-Week Cloud Master Class Plan**

**5 days per week • 2–3 hours per day • Terraform + GCP Hands-On**

Each week includes:

- **Study** → From your uploaded PDFs
    
- **Hands-On Lab** → Using Terraform + your current projects
    
- **Logging/Monitoring Add-Ons**
    
- **Deliverables for GitHub Portfolio**
    

---

# ⭐ WEEK 1 — Foundations (ACE + Terraform Review)

### **Study (ACE Guide — Dan Sullivan)**

📘 Use: _Official ACE Study Guide_  
– Chapters on Compute Engine, VPCs, IAM, Cloud Storage  
– Review Cloud SDK + gcloud commands  
– Review project structure + IAM basics

### **Hands-On Terraform Work**

- Re-use your HQ + USA/Brazil/Japan/Italy/Thailand VPC module
    
- Clean folder structure, add README
    

### **Add Logging + Monitoring**

- Enable:
    
    - Cloud Logging API
        
    - Cloud Monitoring API
        
- Add **logging sinks** for VPC Flow Logs (ALL subnets)
    
- Add **monitoring dashboards for:**
    
    - VM CPU, memory
        
    - Disk read/write
        
    - Network bytes in/out
        

### **Deliverables for GitHub**

- `README.md` explaining architecture
    
- Screenshots of dashboards
    
- `logging.tf` & `monitoring.tf` modules
    

---

# ⭐ WEEK 2 — Networking Deep Dive (PCNE)

### **Study (Network Engineer Book — Dario Cabianca)**

📗 Chapters:

- VPC Routing
    
- Subnetting & regional vs global routing
    
- HA VPN & BGP
    
- Cloud Router advertising
    

Now connect this to your _existing_ Armageddon architecture.

### **Hands-On Terraform Work**

- Review/refactor your **HA VPN + BGP Terraform modules**
    
- Add:
    
    - Multiple BGP sessions
        
    - Advertised routes
        
    - Custom route priorities
        

### **Add Logging + Monitoring**

- Enable **VPC Flow Logs** on all subnets (if not done)
    
- Enable **Firewall Rules Logging**
    
- Add dashboard:
    
    - VPN tunnel status
        
    - BGP session health
        
    - Packet drops
        

### **Deliverables**

- `networking-dashboards.md`
    
- Terraform updates: `vpc-flow-logs.tf`, `vpn-monitoring.tf`
    

---

# ⭐ WEEK 3 — Load Balancing, DNS, Cloud NAT

### **Study**

📗 From PCNE book:

- HTTP(S), TCP, UDP load balancers
    
- NEG backends
    
- Cloud NAT design
    
- DNS design and split-horizon
    

📘 From ACE guide:

- Cloud Load Balancers basics
    
- DNS zones
    

### **Hands-On Terraform**

- Add a **Global HTTP Load Balancer**
    
    - Backend = test instance groups from HQ + Brazil
        
- Add **Cloud NAT** for all non-public subnets
    
- Add **Cloud DNS** (internal & external zones)
    

### **Add Logging + Monitoring**

- Add:
    
    - Load balancer request logs
        
    - Firewall hit counters
        
    - NAT translation logs
        
- Create dashboard:
    
    - HTTP LB latency
        
    - NAT port usage
        
    - DNS query counts
        

### **Deliverables**

- `lb.tf`, `dns.tf`, `nat.tf`
    
- Dashboard screenshots
    
- Architecture diagram (draw.io)
    

---

# ⭐ WEEK 4 — Cloud Operations (Stackdriver Expert Week)

### **Study (ACE + PCA Books)**

📘 ACE Chapter: Monitoring, Logging, Cost Estimation  
📕 PCA Book: Monitoring Architecture Best Practices

### **Hands-On Work**

- Build advanced alerting:
    
    - VPN tunnel down
        
    - Load balancer unhealthy backend
        
    - High CPU (VM)
        
    - High latency (LB)
        
    - Excessive firewall denies
        
- Add **custom logs** from:
    
    - Startup scripts
        
    - Python/Go Cloud Function test function
        

### **Add Observability Tools**

- Cloud Trace
    
- Cloud Profiler (optional)
    
- Error Reporting
    

### **Deliverables**

- `alerts.tf`
    
- `dashboards.tf`
    
- Observability documentation for your GitHub repo
    

---

# ⭐ WEEK 5 — Hybrid & Multi-Cloud (AWS + GCP)

### **Study**

📗 PCNE book chapter on hybrid connectivity  
📕 PCA book regarding multi-cloud and DR

### **Hands-On Terraform**

Re-use **your AWS–GCP HA VPN project**:

- Validate AWS Customer Gateway
    
- Validate GCP HA VPN tunnels
    
- Add BGP metrics into monitoring
    

### **Add Logging + Monitoring**

- AWS:
    
    - CloudWatch VPN Tunnel Metrics
        
- GCP:
    
    - VPN tunnel alerting
        
    - BGP flapping detection
        

### **Deliverables**

- AWS + GCP diagrams
    
- GitHub markdown explaining AWS–GCP hybrid routing
    
- Terraform improvements
    

---

# ⭐ WEEK 6 — Final Project (PCA-Level Architecture)

### **Study**

📕 PCA Book:

- Case Studies
    
- Large-scale architecture patterns
    
- DR, HA, multi-region, business/technical requirements
    

### **Hands-On — Build Final Architecture**

Your project becomes:

**“Global NCC Hub-and-Spoke Enterprise Network with Observability”**

Include:

- HQ hub + 5 foreign sites
    
- HA VPN on each
    
- Global Load Balancer
    
- Service accounts + IAM least privilege
    
- Monitoring dashboards
    
- Logging sinks
    
- BigQuery logs export
    
- Optional: Cloud Run + GKE small cluster
    

### **Final Deliverables (GitHub Portfolio-Ready)**

1. Full `README.md` explaining system
    
2. Terraform folder structure (modules + environments)
    
3. Architecture diagrams (global + regional views)
    
4. Dashboards screenshots
    
5. Alerting flows
    
6. Security/IAM explanation
    
7. Cost estimates
    
8. Video walkthrough (optional)
    

This becomes a **PCA-level portfolio project**.

---

# 🎯 OPTIONAL BONUS WEEKEND TASKS

These accelerate your certifications:

### **ACE Practice**

- Deploy Cloud Function + Firestore
    
- Resize VM + snapshot
    
- IAM roles assignments
    

### **PCNE Practice**

- Break BGP → troubleshoot
    
- Remove firewall rule → test connectivity
    

### **Terraform Practice**

- Convert hard-coded values → variables
    
- Convert repeated code → modules
    

---

# 🚀 Ready for the Next Step?

I can also generate:

### ✔ A **weekly printable checklist**

### ✔ A **GitHub repo folder structure**

### ✔ A **Terraform improvements list** for each module

### ✔ A **Logging/Monitoring Terraform module** you can plug into all VPCs