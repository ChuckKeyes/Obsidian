

## Artifact Analysis

A Google Cloud service that automatically scans container images stored in Artifact Registry for known vulnerabilities and records package and dependency metadata. It integrates with Security Command Center and supports secure software supply chain practices.

**Related:** Artifact Registry, Binary Authorization, Cloud Build, Security Command Center

---
## Artifact Registry

A managed Google Cloud repository for storing and managing container images, language packages, and other software artifacts. It integrates with Cloud Build and Artifact Analysis.

**Related:** Docker, Cloud Build, Artifact Analysis, Binary Authorization

---
## Backend (Terraform)

A Terraform backend defines where Terraform stores its state file. Backends can be local or remote, such as Google Cloud Storage (GCS), Amazon S3, or Terraform Cloud, enabling collaboration and state locking.

**Related:** Terraform, State File, Remote State

---
## Bash Scripts

Text files containing Bash shell commands used to automate Linux administration, deployments, Terraform execution, Kubernetes management, backups, and other DevOps tasks.

**Related:** Linux, Cron Job, Terraform

---
## Binary Authorization

A Google Cloud security service that ensures only trusted and approved container images can be deployed to Google Kubernetes Engine (GKE). It enforces deployment policies based on image attestations.

**Related:** Artifact Registry, Artifact Analysis, GKE

---
## Cloud Build

A fully managed Google Cloud CI service that automatically builds, tests, and deploys applications from source code repositories using build triggers.

**Related:** Artifact Registry, Cloud Deploy, GitHub

---
## Cloud Deploy

A managed continuous delivery (CD) service that automates the promotion of application releases through environments such as development, staging, and production, especially for GKE and Cloud Run.

**Related:** Cloud Build, GKE, CI/CD

---
## Cloud Deployment Manager

Google Cloud's Infrastructure as Code (IaC) service that uses YAML or Python templates to deploy cloud resources. It is considered a legacy service and has largely been replaced by Terraform.

**Related:** Terraform, YAML

---
## Cloud Source Repositories

A private Git repository service hosted by Google Cloud for storing source code. It integrates with Cloud Build and other Google Cloud developer services.

**Related:** Git, Cloud Build

---
## Container Registry — Legacy

**Definition:**

Container Registry was Google Cloud’s service for storing and distributing container images. It has been deprecated and shut down for image writes; **Artifact Registry** is the recommended replacement.

**PCA Exam Tip:**

Older questions may say **Container Registry**. For current architecture, think **Artifact Registry**.

---
## Cron Job

A scheduled task executed automatically on Linux at specified times. Cron jobs are commonly used for backups, maintenance, monitoring, and automation. In Kubernetes, a CronJob resource performs scheduled containerized tasks.

**Related:** Bash Scripts, Linux, Kubernetes CronJob

---
## GitHub Actions

GitHub's built-in CI/CD platform that automates workflows such as building, testing, and deploying applications whenever code changes occur.

**Related:** GitHub, Cloud Build, Jenkins

---
## Jenkins

An open-source automation server widely used for Continuous Integration and Continuous Delivery (CI/CD). Jenkins automates building, testing, scanning, and deploying applications through pipelines.

**Related:** GitHub, Terraform, Kubernetes

---
## Jenkins X

A cloud-native CI/CD platform built specifically for Kubernetes. It automates application builds, testing, deployments, previews, and GitOps workflows.

**Related:** Jenkins, Kubernetes, GitOps

---
## JSON (JavaScript Object Notation)

A lightweight data-interchange format used for APIs, configuration files, Terraform variable files, and cloud service communications.

**Related:** YAML

---
## Puppet

**Definition:**

Puppet is a **configuration-management and infrastructure-automation tool** used to install software, manage operating-system settings, enforce security standards, and keep many servers configured consistently. You describe the desired condition of a system, and Puppet checks and corrects machines that drift away from that condition.

### Example

Suppose 500 VMs must all have:

```
Nginx installed
Monitoring agent installed
Port 443 enabled
Correct configuration file
Approved software version
```

Puppet can apply and continually enforce that configuration across all 500 machines.

```
Puppet configuration
        ↓
VM 1
VM 2
VM 3
...
VM 500
        ↓
All remain in the desired state
```

---
## Remote State (Terraform)

A Terraform state file stored in a shared remote backend such as Google Cloud Storage, Amazon S3, or Terraform Cloud. Remote state enables team collaboration, versioning, and state locking.

**Related:** Backend, Terraform, State File

---
## Spinnaker

**Definition:**

Spinnaker is an open-source, multi-cloud continuous-delivery platform used to automate application deployments and release pipelines across Kubernetes and major cloud providers.

It supports deployment strategies such as:

```
Blue/green
Canary
Rolling deployment
```

**PCA Exam Tip:**

If the question says **open-source multi-cloud continuous delivery**, **automated release pipelines**, or **advanced deployment strategies**, think **Spinnaker**.

---
## State File (Terraform)

The Terraform state file records the current infrastructure managed by Terraform, mapping cloud resources to Terraform configurations. By default, it is stored as **terraform.tfstate**.

**Related:** Backend, Remote State, Workspace

---
## Terraform

An open-source Infrastructure as Code (IaC) tool by HashiCorp used to provision, manage, and automate cloud infrastructure across multiple providers using declarative configuration files.

**Related:** Modules, Workspace, State File

---
## Terraform Modules

Reusable collections of Terraform configuration files that allow infrastructure components to be defined once and reused across multiple projects and environments.

**Related:** Terraform, Variables

---
## Terraform Workspace

A Terraform feature that allows multiple independent state files to be managed from the same Terraform configuration. Workspaces enable environments such as development, staging, and production to use the same code while keeping infrastructure state separate.

**Purpose**

- Separate state files
- Reuse the same Terraform code
- Isolate development from production

**Common Commands**
terraform workspace list
terraform workspace show
terraform workspace new dev
terraform workspace select prod
terraform workspace delete dev

**Related:** Terraform, Backend, State File, Remote State

---
## YAML (YAML Ain't Markup Language)

A human-readable data serialization language commonly used for Kubernetes manifests, Terraform configurations, CI/CD pipelines, Docker Compose files, and cloud configuration files.

**Related:** JSON, Kubernetes, Terraform