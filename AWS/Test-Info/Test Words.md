
# Networking / Infrastructure

## Net.core.wmem_max

**Definition**  
Linux kernel parameter controlling the **maximum socket send buffer size**.
**Exam hint**  
Used when **tuning high-throughput network applications**.
**Pros**
- Improves network throughput    
- Useful for large TCP transfers    
**Cons**
- Too high → memory waste    
- OS-level tuning required
    

---

## VPC

**Definition**  
Private virtual network inside GCP.

**Exam hint**  
Use for **isolating workloads and controlling traffic**.
**Pros**
- Global network    
- Subnet level control    
- firewall rules    

**Cons**
- Misconfigured routes can break connectivity
    

---

## VPN

**Definition**  
Encrypted tunnel connecting networks over the internet.
**Exam hint**  
Use for **hybrid connectivity between on-prem and GCP**.
**Pros**
- Cheap    
- Easy setup    
**Cons*
- Internet latency    
- Lower bandwidth    

---

## SSL

**Definition**  
Encryption protocol for secure connections (HTTPS).
**Exam hint**  
Use for **secure user connections to services**.
**Pros**
- Secure traffic    
- Required for compliance  
**Cons**
- Certificate management required    

---

## DNS

**Definition**  
Domain name resolution service.
**Exam hint**  
Use **Cloud DNS** for managed DNS zones.
**Pros**
- Highly scalable    
- global   
**Cons**
- TTL delays propagation    

---

# Networking Connectivity

## Direct Peering

**Definition**  
Direct connection between your network and Google edge.
**Exam hint**  
For **large enterprises with their own network infrastructure**.
**Pros**
- Low latency    
- High bandwidth   
**Cons**
- Requires own ASN    
- Complex setup    

---

## Carrier Peering

**Definition**  
Access Google services through ISP partner.
**Pros**
- Easier than direct peering    
**Cons**
- Dependent on ISP    

---

## Dedicated Interconnect

**Definition**  
Physical private connection to Google network.
**Exam hint**  
Used for **high bandwidth hybrid cloud connectivity**.
**Pros**
- up to 100Gbps    
- very low latency    
**Cons**
- expensive    
- physical location requirement    

---

## Partner Interconnect

**Definition**  
Private connection via service provider.
**Pros**
- easier than dedicated    
**Cons**
- slightly higher latency    

---

# Containers / Kubernetes

## Anthos
Anthos
**Definition**  
Platform for managing Kubernetes across **GCP, on-prem, and other clouds**.
**Exam hint**  
Use for **hybrid cloud management**.
**Pros**
- multi-cloud    
- consistent policy management    
**Cons*
- expensive    
- operational complexity    

---

## GKE

Google Kubernetes Engine
**Definition**  
Managed Kubernetes cluster service.
**Exam hint**  
Use when deploying **containerized applications**.
**Pros**
- autoscaling    
- managed control plane    
**Cons**
- Kubernetes learning curve    

---

## Minikube

**Definition**  
Local Kubernetes cluster for development.
**Exam hint**  
Dev environment only.
**Pros**
- local testing    
**Cons**
- not production    

---

## Skaffold

**Definition**  
Tool for **continuous Kubernetes development workflows**.
**Pros**
- simplifies container build/test    
**Cons**
- developer-focused    

---

# Application Platforms

## Google App Engine

Google App Engine
**Definition**  
PaaS for running apps without managing infrastructure.
**Exam hint**  
Use for **simple scalable web apps**.
**Pros**
- autoscaling    
- fully managed    
**Cons**
- limited runtime environments    

---

## Cloud Run

Cloud Run

**Definition**  
Run containers without managing servers.
**Exam hint**  
Best for **stateless APIs or microservices**.
**Pros**
- scales to zero    
- very simple deployment    
**Cons**
- request-driven workloads only    

---

## J2EE application

**Definition**  
Java enterprise applications.
**Exam hint**  
Often migrated to **App Engine or Kubernetes**.

---

# Databases

## MySQL

**Definition**  
Relational database.
**Pros**
- simple    
- widely supported    
**Cons**
- scaling limitations    

---

## PostgreSQL

**Definition**  
Advanced relational database.
**Pros**
- strong SQL features    
**Cons**
- slightly heavier operations    

---

## NoSQL

**Definition**  
Non-relational databases.
**Pros**
- massive scalability    
**Cons**
- limited joins    

---

## Cloud SQL

Cloud SQL
**Definition**  
Managed MySQL/Postgres.
**Exam hint**  
Use when **you want managed relational database without managing servers**.

---

## Cloud Datastore

**Definition**  
Document database (now Firestore).
**Pros**
- serverless    
- scalable    
**Cons**
- limited complex queries    

---

## Bigtable

Cloud Bigtable
**Exam hint**  
Used for **time series or massive datasets**.
**Pros**
- petabyte scale    
- very low latency    
**Cons**
- expensive    
- schema planning required    

---

## BigQuery

BigQuery
**Exam hint**  
Used for **analytics queries on huge datasets**.
**Pros**
- extremely fast    
- serverless    
**Cons**
- query cost    

---

# Data Processing

## Cloud Dataflow
Cloud Dataflow
**Definition**  
Streaming and batch data processing
**Pros**
- autoscaling    
- unified pipeline   
**Cons**
- Beam learning curve    

---

## Dataproc
Cloud Dataproc
**Exam hint**  
Use when migrating **existing Hadoop or Spark workloads**.

---

## Apache Spark

**Definition**  
Distributed data processing engine.

---

## Hadoop

**Definition**  
Big data distributed processing framework.

---

# AI / ML

## Vertex AI

Vertex AI
**Definition**  
Unified ML platform for training and deploying models.
**Pros**
- end-to-end ML lifecycle    
**Cons**
- expensive compute    

---

# Security

## Cloud Armor

Cloud Armor
**Exam hint**  
Used for **web application firewall protection**.

---

## Cloud DLP

Cloud Data Loss Prevention
**Definition**  
Find and mask sensitive data.

---

## Shielded VMs

**Definition**  
Secure VM configuration with verified boot.
**Pros**
- protects against rootkits    

---

## Integrity policy baseline

**Definition**  
Defines expected VM boot state.

---

# DevOps / Deployment

## Blue-Green Deployment

**Definition**  
Deploy new version alongside old version.
**Pros**
- zero downtime    
**Cons**
- double infrastructure cost    

---

## Canary Release

**Definition**  
Release to small subset of users.
**Pros**
- safer rollout    
**Cons**
- monitoring required    

---

## Microservices

**Definition**  
Applications split into small independent services.
**Pros**
- scalable    
- flexible    
**Cons**
- operational complexity    

---

# Storage

## Cloud Storage
Cloud Storage
**Definition**  
Object storage similar to S3.

---

## Transfer Appliance

**Definition**  
Physical device to migrate huge datasets to GCP.

---

## Blobstore

**Definition**  
Old App Engine storage service.

---

# Misc Tools

## gsutil
Command line tool for Cloud Storage.

---

## bq
CLI tool for BigQuery.

---

## Config Management
Tools like:
- Puppet    
- Chef    
- Ansible    

---

# Disaster Recovery

## Hot Disaster Recovery

**Definition**  
Active system ready to take over immediately.
**Pros**
- minimal downtime    
**Cons**
- expensive    

---

# Architecture Stack

## LAMP stack
**Definition**  
Linux + Apache + MySQL + PHP

---

# Hybrid / Enterprise Platforms

## OpenStack
Open source cloud infrastructure.

---

## OpenShift

RedHat Kubernetes platform.

---

## RedHat

Enterprise Linux vendor.

---

# Anthos Advanced Concepts

## Anthos Service Mesh
Service-to-service security and traffic control using **Istio + YAML configuration**.

---

## Anthos Policy Controller
Enforces security and governance policies.

---

## Anthos on Bare Metal
Runs Anthos Kubernetes directly on physical servers.

---

💡 **Important exam tip**
Most GCP professional questions really test:
1️⃣ **Which service solves the problem with the least management**
Examples:

|Problem|Correct Answer|
|---|---|
|web app scaling automatically|App Engine|
|container workloads|GKE|
|stateless APIs|Cloud Run|
|big analytics queries|BigQuery|
|Hadoop migration|Dataproc|
|streaming pipelines|