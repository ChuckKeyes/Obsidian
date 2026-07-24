
---
## App Engine Flexible Environment

**Definition:**

A fully managed Platform as a Service (PaaS) that runs applications inside **Docker containers on Compute Engine virtual machines**, allowing custom runtimes and greater control over the execution environment.

**Advantages:**

- Supports custom Docker containers
- Supports additional programming languages and runtimes
- Longer-running background processes
- More control over the underlying environment

**Trade-offs:**

- Higher cost than Standard
- Slower startup
- Does **not** scale to zero

**PCA Exam Tip:**

If the question says **"custom runtime,"** **"Docker container,"** **"special OS dependencies,"** or **"more control over the runtime,"** think **App Engine Flexible**.

---
# Standard vs Flexible

|Feature|Standard|Flexible|
|---|---|---|
|Google-managed runtime|✅|❌ (custom runtime supported)|
|Docker containers|❌|✅|
|Runs on Compute Engine VMs|❌|✅|
|Scales to zero|✅|❌|
|Faster startup|✅|❌|
|Lowest cost|✅|❌|
|Custom operating system packages|❌|✅|

---
## App Engine Standard

**Definition:**

Google's fully managed Platform as a Service (PaaS) that automatically builds, deploys, scales, and manages web applications without requiring server administration.

**Advantages:**

- Fast startup
- Scales to zero
- Lowest operational overhead
- Lowest cost for intermittent workloads

**PCA Exam Tip:**

If the question says **"minimum operational overhead,"** **"automatic scaling,"** or **"don't manage servers,"** think **App Engine Standard**.

---
## Cloud Deployment Manager

**Definition:**

Google Cloud's native Infrastructure as Code (IaC) service used to deploy and manage Google Cloud resources using YAML or Python templates.

**PCA Note:**

Cloud Deployment Manager is being replaced by **Infrastructure Manager** and **Terraform** for most new deployments, but it may still appear in PCA study materials and older exam questions.

---
# Compute Engine

**Definition:**

Compute Engine is Google Cloud's **Infrastructure as a Service (IaaS)** that provides virtual machines (VMs) running Linux or Windows. Users control the operating system, networking, storage, and installed software.

**PCA Exam Tip:**

If the question says **"virtual machine,"** **"full operating system control,"** or **"custom server configuration,"** think **Compute Engine**.

---
## Cloud Functions

**Definition:**

A serverless event-driven compute service that executes code in response to events such as HTTP requests, Pub/Sub messages, or Cloud Storage changes.

**PCA Exam Tip:**

If the question says **"run a small piece of code in response to an event"** or **"no servers to manage,"** the answer is usually **Cloud Functions**.

---
## Cloud Run

**Definition:**

A fully managed serverless platform that runs stateless containers and automatically scales from zero based on incoming requests.

**PCA Exam Tip:**

If the application is already packaged as a **Docker container** and requires minimal operational management, think **Cloud Run**.

---
## Cloud Shell

**Definition:**

Google Cloud Shell is a **browser-based Linux command-line environment** that runs inside the Google Cloud Console. It comes preinstalled with the **gcloud CLI**, **kubectl**, **Terraform**, **Git**, **Python**, and many other Google Cloud development tools, eliminating the need to install them on your local computer.

**PCA Exam Tip:**

If the question says **"work from multiple computers without installing tools,"** **"browser-based terminal,"** or **"no local installation required,"** the answer is usually **Cloud Shell**.

---
## Cloud VMware Engine

**Definition:**

A fully managed VMware environment that allows organizations to migrate or extend existing VMware workloads to Google Cloud with minimal changes.

**PCA Exam Tip:**

If the question says **"lift and shift VMware,"** **"vSphere,"** or **"migrate VMware without refactoring,"** think **Cloud VMware Engine**.

---
# Custom Images

**Definition:**

A Custom Image is a reusable Compute Engine disk image that already contains the operating system, applications, libraries, and configuration needed to launch preconfigured virtual machines.

**PCA Exam Tip:**

If the question says **"fast VM deployment,"** **"preinstalled software,"** or **"identical application servers,"** think **Custom Image**.

---
# Instance Templates

**Definition:**

An Instance Template is a reusable blueprint that defines the configuration of Compute Engine VMs, including the machine type, boot disk, image, network, metadata, and startup scripts. Managed Instance Groups use instance templates to create identical VMs.

**PCA Exam Tip:**

If the question says **"create identical VMs,"** **"Managed Instance Group,"** or **"standardized VM configuration,"** think **Instance Template**.

---
## Managed Instance Group (MIG)

**Definition:**

A group of identical Compute Engine virtual machines managed as a single unit that provides auto healing, autoscaling, rolling updates, and load balancing.

**PCA Exam Tip:**

If the question says **"automatically replace failed VMs,"** **"scale VM instances,"** or **"identical virtual machines,"** the answer is usually **Managed Instance Group (MIG)**.

---
# Preemptible VM (Legacy)

**Definition:**

A Preemptible VM was a **low-cost, short-lived Compute Engine VM** that Google could terminate at any time and that had a maximum runtime of **24 hours**. It has been replaced by Spot VMs for new workloads.

**PCA Exam Tip:**

If you see **older exam questions** mentioning **Preemptible VMs**, think **low-cost interruptible compute**.

---
# Spot VM

**Definition:**

A Spot VM is a **discounted Compute Engine virtual machine** that can be interrupted by Google when resources are needed elsewhere. Spot VMs are designed for **fault-tolerant, batch, testing, and flexible workloads**.

**PCA Exam Tip:**

If the question says **"lowest-cost compute,"** **"interruptible workloads,"** **"batch processing,"** or **"fault-tolerant applications,"** think **Spot VM**.

---
# Startup Script

**Definition:**

A Startup Script is a script stored in Compute Engine metadata using the **`startup-script`** metadata key. It runs automatically each time a VM starts and is commonly used to install software, configure services, or initialize applications.

**PCA Exam Tip:**

If the question says **"run commands when the VM starts,"** **"install software automatically,"** or **"initialize a new VM,"** think **Startup Script**.

---
# Shutdown Script

**Definition:**

A Shutdown Script is a script stored in Compute Engine metadata using the **`shutdown-script`** metadata key. It runs automatically when a VM stops or is terminated, allowing applications to save data, upload logs, or perform cleanup tasks.

**PCA Exam Tip:**

If the question says **"save application state,"** **"cleanup before shutdown,"** or **"graceful VM termination,"** think **Shutdown Script**.

---
# PCA Memory Table

|Service|Remember It As|
|---|---|
|**App Engine Standard**|Fully managed PaaS|
|**Cloud Deployment Manager**|Legacy Google IaC|
|**Cloud Functions**|Serverless event-driven code|
|**Cloud Run**|Serverless containers|
|**Cloud Shell**|Browser-based Linux terminal|
|**Cloud VMware Engine**|Managed VMware migration|
|**Managed Instance Group (MIG)**|Auto-scaling and self-healing VMs|

---
## ⭐ PCA Compute Decision Guide

One of the biggest themes on the PCA exam is **choosing the right compute service**:

|If the question says...|Think...|
|---|---|
|Existing VM application|**Compute Engine**|
|Identical VMs with autoscaling|**Managed Instance Group (MIG)**|
|Simple web app, lowest operational overhead|**App Engine Standard**|
|Existing Docker container|**Cloud Run**|
|Small event-driven function|**Cloud Functions**|
|Existing VMware environment|**Cloud VMware Engine**|
|Browser terminal with preinstalled tools|**Cloud Shell**|
|Infrastructure as Code (legacy)|**Cloud Deployment Manager**|

This table is worth memorizing because many PCA questions are really asking **"Which compute service is the best fit?"** rather than testing detailed implementation knowledge.
