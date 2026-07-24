
## Anthos Service Mesh

**Definition:**  
A fully managed service mesh that provides secure service-to-service communication, traffic management, observability, and policy enforcement across GKE and hybrid environments.

**PCA Exam Tip:**  
Use when managing communication between microservices.

---
## Binary Authorization

**Definition:**  
A security service that ensures only trusted and verified container images can be deployed to GKE.

**PCA Exam Tip:**  
Use to prevent unauthorized or vulnerable container images from running.

---
## Cluster Autoscaler

**Definition:**

Automatically adds or removes Kubernetes worker nodes when Pods cannot be scheduled or when nodes become underutilized.

**PCA Exam Tip:**

If the question says **"automatically add more virtual machines to a GKE cluster,"** think **Cluster Autoscaler**.


---
## Config Connector

**Definition:**  
A Kubernetes add-on that lets you create and manage Google Cloud resources using Kubernetes YAML manifests.

**PCA Exam Tip:**  
Manage cloud resources (Cloud SQL, Pub/Sub, Storage, IAM) without Terraform or gcloud commands.

---
## Config Sync

**Definition:**  
Synchronizes Kubernetes configuration from a Git repository to one or more GKE clusters.

**PCA Exam Tip:**  
Implements GitOps by keeping clusters consistent with Git.

---
## Deployment

**Definition:**

A Kubernetes Deployment manages application Pods by maintaining the desired number of replicas and supporting rolling updates, rollbacks, and self-healing.

**PCA Exam Tip:**

If the question says **"maintain application availability,"** **"rolling updates,"** or **"automatically replace failed Pods,"** think **Deployment**.


---
## Docker

**Definition:**  
A container platform used to build, package, and distribute container images that can run on Kubernetes.

**PCA Exam Tip:**  
Docker builds the image; Kubernetes runs the container.

---
## GKE (Google Kubernetes Engine)

**Definition:**  
Google Cloud's fully managed Kubernetes service for deploying, managing, and scaling containerized applications.

**PCA Exam Tip:**  
Use for running production container workloads.

---
## GKE Autopilot

**Definition:**  
A GKE mode where Google manages the cluster infrastructure, nodes, scaling, and security while you manage only your workloads.

**PCA Exam Tip:**  
Choose Autopilot to reduce operational overhead.

---
## GKE Enterprise (Anthos)

**Definition:**  
Google's enterprise Kubernetes platform for managing applications across Google Cloud, on-premises data centers, and other cloud providers.

**PCA Exam Tip:**  
Best for hybrid and multi-cloud Kubernetes environments.

---
## Helm

**Definition:**

Helm is the **package manager for Kubernetes** that installs, upgrades, and manages Kubernetes applications using reusable **Helm Charts**. It simplifies deployments by allowing applications to be configured with parameterized templates instead of manually editing multiple YAML files.

**PCA Exam Tip:**

If the question says **"deploy reusable Kubernetes application packages,"** **"parameterized templates,"** or **"simplify Kubernetes deployments,"** think **Helm**.

---
## Helm Chart

**Definition:**

A Helm Chart is a collection of Kubernetes YAML templates and configuration files that define how an application is deployed, configured, and managed within a Kubernetes cluster.

**PCA Exam Tip:**

If the question says **"package a Kubernetes application for repeated deployments,"** the answer is usually **Helm Chart**.


---
## Horizontal Pod Autoscaler (HPA)

**Definition:**  
Automatically increases or decreases the number of pod replicas based on CPU, memory, or custom metrics.

**PCA Exam Tip:**  
Scales the number of pods.

---
## Ingress

**Definition:**

A Kubernetes resource that manages external HTTP and HTTPS access to services within a cluster. It supports host-based and URL path-based routing using a single entry point.

**PCA Exam Tip:**

If the question says **"route requests based on URL paths,"** **"single public IP,"** or **"HTTP routing,"** think **Ingress**.


---
# Istio Fault Injection

**Definition:**

A testing feature of Istio that intentionally injects delays or errors into service-to-service traffic to verify that applications can handle failures gracefully.

**PCA Exam Tip:**

If the question says **"simulate failures,"** **"test application resiliency,"** or **"inject latency or HTTP errors,"** think **Istio Fault Injection**.

---
## Kritis

**Definition:**

Kritis is an open-source Kubernetes policy specification and enforcement system associated with Grafeas. It verifies container-image attestations and can prevent unapproved or untrusted images from being deployed. Google Cloud Binary Authorization is based on the Kritis specification.

**PCA Exam Tip:**

If the question says **deploy only trusted container images**, **verify attestations**, or **enforce container deployment policy**, think **Binary Authorization/Kritis**.

---
## Kubernetes Secrets

**Definition:**  
Stores sensitive information such as passwords, API keys, certificates, and tokens securely for Kubernetes workloads.

**PCA Exam Tip:**  
Never hard-code secrets inside container images.

---
## Kubernetes Service

**Definition:**

A Kubernetes Service provides a stable network endpoint that allows applications to communicate with Pods, even as Pods are created, deleted, or replaced.

**PCA Exam Tip:**

If the question says **"stable access to Pods,"** or **"load balance traffic across Pods,"** think **Service**.


---
## Minikube

**Definition:**  
A lightweight local Kubernetes cluster used for learning, testing, and development.

**PCA Exam Tip:**  
Runs Kubernetes on a single local machine.

---
## Monitoring GKE

**Definition:**  
Cloud Monitoring and Cloud Logging integration for collecting metrics, logs, alerts, and dashboards from GKE clusters.

**PCA Exam Tip:**  
Use to monitor cluster health and application performance.

---
## Namespace

**Definition:**

A Kubernetes Namespace provides **logical isolation** within a cluster by separating applications, users, or environments while sharing the same Kubernetes infrastructure.

**PCA Exam Tip:**

If the question says **"multiple isolated environments,"** **"multi-tenant Kubernetes,"** or **"separate development, staging, and production,"** think **Namespaces**.


---
## OpenShift

**Definition:**  
Red Hat's enterprise Kubernetes platform that adds developer tools, security features, and integrated application management.

**PCA Exam Tip:**  
Enterprise Kubernetes platform built on Kubernetes.

---
# PCA Memory Table

|Service|Remember It As|
|---|---|
|**Helm**|Kubernetes package manager|
|**Helm Chart**|Reusable Kubernetes application package|
|**Namespace**|Logical isolation inside a cluster|
|**Horizontal Pod Autoscaler (HPA)**|Automatically scales Pods|
|**Cluster Autoscaler**|Automatically scales worker nodes|
|**Ingress**|URL and host-based HTTP/HTTPS routing|
|**Service**|Stable network endpoint for Pods|
|**Deployment**|Manages Pods, replicas, and rolling updates|

---
## Policy Controller

**Definition:**  
An Anthos feature that enforces governance and security policies on Kubernetes resources using policy-as-code.

**PCA Exam Tip:**  
Prevents deployments that violate organizational policies.


## Probe

---
### Liveness Probe

**Definition:**

A liveness probe checks whether a container is still running correctly. If the probe fails repeatedly, Kubernetes restarts the container automatically.

**CKA Exam Tip:**

If the question says **"restart a hung container"** or **"detect an unhealthy application,"** think **Liveness Probe**.

---

### Readiness Probe

**Definition:**

A readiness probe checks whether a container is ready to receive network traffic. If the probe fails, Kubernetes temporarily removes the Pod from the Service until it becomes ready again.

**CKA Exam Tip:**

If the question says **"don't send traffic until ready"** or **"temporarily remove Pods from load balancing,"** think **Readiness Probe**.

---

### Startup Probe

**Definition:**

A startup probe verifies that a slow-starting application has completed startup before Kubernetes begins liveness and readiness checks.

**CKA Exam Tip:**

If the question says **"slow application startup"** or **"avoid restarting during initialization,"** think **Startup Probe**.

---
## Skaffold

**Definition:**  
A command-line tool that automates the build, test, and deployment workflow for Kubernetes applications.

**PCA Exam Tip:**  
Speeds up local Kubernetes development.

---
## StatefulSet

**Definition:**  
A Kubernetes workload controller used for applications requiring stable pod names, predictable DNS, and persistent storage. Each pod keeps its identity even after restarts or rescheduling.

**PCA Exam Tip:**  
Use StatefulSet for databases, messaging systems, or applications requiring stable hostnames.

---
## Vertical Pod Autoscaler (VPA)

**Definition:**  
Automatically adjusts the CPU and memory requests and limits assigned to individual pods.

**PCA Exam Tip:**  
Scales pod resources instead of pod count.

---
## Workload Identity

**Definition:**  
A secure authentication method that allows GKE workloads to access Google Cloud services using IAM without storing service account keys.

**PCA Exam Tip:**  
Recommended way for GKE pods to access Google Cloud APIs securely.
