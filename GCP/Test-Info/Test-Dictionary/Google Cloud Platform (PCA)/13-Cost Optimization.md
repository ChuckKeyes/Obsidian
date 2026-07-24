# Recommender API

**Definition:**

The Recommender API analyzes Google Cloud resources and provides recommendations to **reduce costs, improve performance, increase reliability, and strengthen security**.

**PCA Exam Tip:**

If the question says **"identify idle resources"**, **"reduce cloud costs"**, or **"receive optimization recommendations,"** think **Recommender API**.

---
# Object Lifecycle Management

**Definition:**

Object Lifecycle Management automatically moves or deletes Cloud Storage objects based on rules such as **object age, storage class, or creation date**, reducing storage costs.

**PCA Exam Tip:**

If the question says **"automatically move older files to cheaper storage"**, think **Object Lifecycle Management**.

---
# Nearline Storage

**Definition:**

Nearline is a **low-cost Cloud Storage class** designed for data accessed **less than once per month**.

**PCA Exam Tip:**

If the question says **"backup data accessed monthly,"** think **Nearline**.

---
# Coldline Storage

**Definition:**

Coldline is a **very low-cost Cloud Storage class** designed for data accessed **less than once every 90 days**.

**PCA Exam Tip:**

If the question says **"quarterly access,"** **"disaster recovery backups,"** or **"long-term backup,"** think **Coldline**.

---
# Archive Storage

**Definition:**

Archive is Google's **lowest-cost Cloud Storage class**, intended for data that is **rarely accessed**, such as long-term archives and compliance records.

**PCA Exam Tip:**

If the question says **"store data for years at the lowest cost,"** think **Archive Storage**.

---
# Managed Instance Group (MIG)

**Definition:**

A Managed Instance Group is a collection of identical Compute Engine virtual machines that supports **automatic scaling, self-healing, rolling updates, and load balancing**.

**PCA Exam Tip:**

If the question says **"automatically add or remove VMs based on demand,"** think **Managed Instance Group**.

---
# Cloud Run

**Definition:**

Cloud Run is a **fully managed serverless platform** for running stateless containers. It automatically scales from **zero to thousands of instances**, allowing you to pay only while your application is processing requests.

**PCA Exam Tip:**

If the question says **"containerized application,"** **"no server management,"** or **"scale to zero,"** think **Cloud Run**.

---
# Autoscaling

**Definition:**

Autoscaling automatically increases or decreases computing resources based on demand, helping maintain application performance while minimizing costs.

**PCA Exam Tip:**

If the question says **"handle changing traffic while reducing costs,"** think **Autoscaling**.

---
## Cost Optimization Memory Table

|Service|Primary Cost Benefit|
|---|---|
|**Recommender API**|Identifies cost-saving opportunities|
|**Object Lifecycle Management**|Automatically moves or deletes old data|
|**Nearline**|Low-cost monthly-access storage|
|**Coldline**|Very low-cost quarterly-access storage|
|**Archive**|Lowest-cost long-term storage|
|**Managed Instance Groups**|Scale VMs to match demand|
|**Cloud Run**|Pay only when processing requests|
|**Autoscaling**|Automatically reduce unused compute resources|

These are all **high-value PCA terms** because they appear frequently in architecture questions that ask you to **minimize operational costs while maintaining performance**.
