---

<font color="#00b0f0"># Backup and DR</font>

<font color="#00b0f0">**Definition:**</font>

<font color="#00b0f0">Backup and DR is Google Cloud's **managed backup and disaster recovery service** that protects virtual machines, databases, and applications by creating automated backups and enabling rapid recovery after failures.</font>

<font color="#00b0f0">**PCA Exam Tip:**</font>

<font color="#00b0f0">If the question says **"centralized backup management,"** **"recover from disasters,"** or **"automated backups,"** think **Backup and DR**.</font>

---

# Managed Instance Group (MIG)

**Definition:**

A Managed Instance Group is a collection of identical Compute Engine virtual machines that provides **self-healing, autoscaling, rolling updates, and high availability**.

**PCA Exam Tip:**

If the question says **"replace failed VMs automatically"** or **"maintain application availability,"** think **Managed Instance Group**.

---
# Global Load Balancer

**Definition:**

Google Cloud's Global Load Balancer distributes user traffic across **multiple regions**, directing requests to the healthiest backend and improving both availability and performance.

**PCA Exam Tip:**

If the question says **"users worldwide,"** **"automatic regional failover,"** or **"global traffic distribution,"** think **Global Load Balancer**.

---
# Cloud DNS

**Definition:**

Cloud DNS is Google's **highly available, managed Domain Name System (DNS)** service that translates domain names into IP addresses.

**PCA Exam Tip:**

If the question says **"highly available DNS,"** **"managed DNS,"** or **"domain resolution,"** think **Cloud DNS**.

---
# Cloud Storage

**Definition:**

Cloud Storage is Google's durable object storage service that supports **backups, disaster recovery, archival storage, and cross-region data protection**.

**PCA Exam Tip:**

If the question says **"store backups,"** **"durable object storage,"** or **"disaster recovery storage,"** think **Cloud Storage**.

---
# Multi-region

**Definition:**

A multi-region deployment stores data or runs applications in **multiple geographic regions**, providing high availability and protection against regional outages.

**PCA Exam Tip:**

If the question says **"survive a regional failure"** or **"maximize availability,"** think **Multi-region**.

---
# High Availability (HA)

**Definition:**

High Availability is the practice of designing systems to **remain operational despite hardware, software, or zone failures** by using redundant resources.

**PCA Exam Tip:**

If the question says **"minimize downtime,"** **"redundancy,"** or **"continue operating during failures,"** think **High Availability**.

---
# Disaster Recovery (DR)

**Definition:**

Disaster Recovery is the process of restoring applications and data after a major outage using **backups, replication, failover, and recovery procedures**.

**PCA Exam Tip:**

If the question says **"recover after a regional disaster,"** **"restore operations,"** or **"business continuity,"** think **Disaster Recovery**.

---
## Serial Console

**Definition:**

The Compute Engine **Serial Console** provides direct command-line access to a virtual machine, even when SSH or network connectivity is unavailable. It is commonly used for troubleshooting boot, networking, and SSH problems.

**PCA Exam Tip:**

If the question says **"SSH doesn't work,"** **"recover a VM,"** or **"network configuration prevents remote access,"** think **Serial Console**.

---

## Disaster Recovery & HA Memory Table

|Service|Primary Purpose|
|---|---|
|**Backup and DR**|Managed backup and recovery|
|**Managed Instance Group**|Self-healing and automatic VM replacement|
|**Global Load Balancer**|Global traffic distribution and regional failover|
|**Cloud DNS**|Highly available DNS service|
|**Cloud Storage**|Durable backup and recovery storage|
|**Multi-region**|Protect against regional failures|
|**High Availability**|Keep applications running during failures|
|**Disaster Recovery**|Restore systems after major outages|

### Additional PCA terms you may want to add later

These also appear frequently in PCA disaster recovery and availability questions:

- **Regional Persistent Disk**
- **Snapshots**
- **Machine Images**
- **Cloud SQL High Availability**
- **Read Replica**
- **Cross-region Replication**
- **Recovery Point Objective (RPO)**
- **Recovery Time Objective (RTO)**

These are worth adding as you encounter them in your practice exams because they're common keywords in architecture scenarios.
