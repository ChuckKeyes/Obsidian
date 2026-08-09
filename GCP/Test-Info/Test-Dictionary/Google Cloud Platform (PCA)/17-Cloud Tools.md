
## Ansible

**Definition:** An open-source automation tool used to configure servers, deploy applications, and automate IT tasks without installing agents on target machines.

**Purpose:**

- Server configuration
- Application deployment
- OS updates
- Infrastructure automation

**Related:** SSH, YAML, Terraform, Kubernetes

---
## CircleCI

**Definition:** A cloud-based Continuous Integration/Continuous Deployment (CI/CD) platform that automatically builds, tests, and deploys software after code changes.

**Purpose:**

- Automated testing
- Build pipelines
- Continuous deployment

**Related:** GitHub, Docker, Kubernetes

---
## Docker

**Definition:** A container platform used to package applications and their dependencies into portable containers that run consistently across environments.

**Purpose:**

- Build containers
- Run containers
- Share container images

**Commands**

```
docker build
docker run
docker ps
docker images
docker pull
docker push
```

**Related:** Kubernetes, Docker Hub, Artifact Registry

---
## ELK Stack

**Definition:** A log management platform consisting of Elasticsearch, Logstash, and Kibana used for centralized log collection, storage, searching, and visualization.

**Components**

- Elasticsearch
- Logstash
- Kibana

**Purpose**

- Log analysis
- Monitoring
- Troubleshooting

---
## Git

**Definition:** A distributed version control system that tracks changes to source code and enables collaboration between developers.

**Commands**

```
git clone
git add
git commit
git push
git pull
git branch
git merge
```

**Related:** GitHub, GitLab

---

## GitHub

**Definition:** A cloud-hosted Git repository service used for source code management, collaboration, pull requests, and CI/CD integration.

**Purpose**

- Source code hosting
- Version control
- Collaboration

**Related:** Git, GitHub Actions

---
## GitHub Actions

**Definition:** GitHub's built-in CI/CD platform used to automate software builds, testing, deployments, and infrastructure workflows.

**Uses**

- Build Docker images
- Deploy Kubernetes
- Run Terraform
- Execute automated tests

---

## GitLab

**Definition:** A DevOps platform that combines Git repositories, CI/CD pipelines, issue tracking, security scanning, and project management in one application.

**Purpose**

- Source control
- CI/CD
- Security scanning
- DevOps lifecycle

---
## Grafana

**Definition:** A dashboard and visualization platform used to display metrics collected from systems such as Prometheus, Elasticsearch, and Cloud Monitoring.

**Purpose**

- Dashboards
- Alerts
- Performance monitoring

---

## HashiCorp

**Definition:** A software company that develops infrastructure automation and security tools such as Terraform, Vault, Consul, Nomad, and Packer.

**Major Products**

- Terraform
- Vault
- Consul
- Nomad
- Packer

---
## JAR (Java Archive)

**Definition:**

A **JAR (Java Archive)** file packages compiled Java classes, libraries, configuration files, and resources into a single deployable file. Java applications are commonly distributed and executed as JAR files.

**PCA Exam Tip:**

If the question mentions **JarVerifier**, **SHA1 digest**, **ManifestEntryVerifier**, or **SecurityException** during deployment, think **JAR digital signature verification** rather than missing code or libraries.

---
## Jenkins

**Definition:** An open-source automation server used to build, test, and deploy software through CI/CD pipelines.

**Purpose**

- Continuous Integration
- Continuous Deployment
- Automated testing

---
## Kubernetes

**Definition:** An open-source container orchestration platform that automates deployment, scaling, networking, and management of containerized applications.

**Core Objects**

- Pods
- Deployments
- Services
- ConfigMaps
- Secrets
- Ingress

**Purpose**

- Container orchestration
- High availability
- Auto-scaling
- Self-healing

---
## Prometheus

**Definition:** An open-source monitoring system that collects metrics from servers, containers, and Kubernetes clusters using time-series data.

**Purpose**

- Metrics collection
- Alerting
- Kubernetes monitoring

**Often paired with**

- Grafana

---
## SonarQube

**Definition:** A code quality and security analysis platform that scans source code for bugs, vulnerabilities, and code smells before deployment.

**Purpose**

- Static code analysis
- Security scanning
- Quality gates

---
## Terraform

**Definition:** An Infrastructure as Code (IaC) tool that provisions and manages cloud infrastructure using declarative configuration files.

**Language**

- HCL (HashiCorp Configuration Language)

**Can manage**

- AWS
- Google Cloud
- Azure
- Kubernetes
- GitHub
- VMware

**Commands**

```
terraform init
terraform plan
terraform apply
terraform destroy
```

---
# How These Tools Work Together

```
Git
   │
   ▼
GitHub / GitLab
   │
   ▼
Jenkins or GitHub Actions or CircleCI
   │
   ▼
SonarQube
   │
   ▼
Docker Build
   │
   ▼
Container Registry
   │
   ▼
Terraform
   │
   ▼
Kubernetes
   │
   ▼
Prometheus
   │
   ▼
Grafana
   │
   ▼
ELK Stack
```

---
## Which Ones Should You Learn?

Based on your goals (Cloud Engineer → Kubernetes → PCA → Consulting), I'd prioritize them like this:

### ⭐⭐⭐⭐⭐ Essential

- Git
- GitHub
- Docker
- Kubernetes
- Terraform

### ⭐⭐⭐⭐ Very Valuable

- Jenkins
- Prometheus
- Grafana
- GitHub Actions
- Ansible

### ⭐⭐⭐ Useful to Know

- SonarQube
- GitLab
- ELK Stack
- CircleCI
- HashiCorp ecosystem (Vault, Consul, Nomad)

This collection would make a strong **"12 – DevOps & Kubernetes Tools.md"** file in your Obsidian PCA/Cloud Engineering dictionary. Even though tools like Jenkins, Ansible, and SonarQube aren't heavily tested on the PCA exam, they are commonly encountered in cloud engineering and consulting roles.