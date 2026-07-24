
>This project implements a **fully automated CI/CD pipeline** using Jenkins and Terraform to deploy infrastructure across **AWS and GCP**.
---
---

## 🎯 Objective

Design a CI/CD pipeline that:

- Automates infrastructure deployment
- Integrates with GitHub (version control)
- Uses Terraform (Infrastructure as Code)
- Supports multi-cloud environments (AWS + GCP)
- Provides auditability and repeatability

---

## 🧠 CI/CD Strategy (GitOps Model)

This pipeline follows a **GitOps-style workflow**:

1. Code is pushed to GitHub
2. Webhook triggers Jenkins
3. Jenkins executes Terraform
4. Infrastructure is deployed automatically
5. Logs provide full visibility and audit trail

---

## 🔄 Pipeline Flow

Developer → GitHub → Webhook → Jenkins → Terraform → AWS / GCP Infrastructure

---

## ⚙️ Core Components

### 🐙 GitHub (Source of Truth)

- Stores all Terraform code
- Tracks version history
- Triggers pipeline via webhook

---

### 🏗️ Jenkins (CI/CD Engine)

Runs on **EC2 (Amazon Linux 2023)** and handles:

- Pipeline execution
- Terraform automation
- Credential management
- Build and deployment logging

---

### 📦 Terraform (Infrastructure as Code)

Terraform is responsible for provisioning:

**AWS**

- EC2, ALB, RDS
- CloudFront
- Transit Gateway (TGW)

**GCP**

- VPC networks
- Network Connectivity Center (NCC)
- HA VPN + BGP

---

## 🔐 Credentials & Security

### Secure Access

- AWS credentials via Jenkins credentials store
- GCP service account _(planned / integrated)_

### Best Practices

- No secrets stored in code
- IAM roles with least privilege
- Centralized credential management

---

## ⚙️ Jenkins Pipeline (Terraform Automation)

pipeline {  
    agent any  
  
    environment {  
        AWS_DEFAULT_REGION = 'us-east-1'  
        TF_IN_AUTOMATION   = 'true'  
        TF_DIR             = 'Class-Assignments/new-jenkins-s3-test'  
    }  
  
    stages {  
        stage('Checkout') {  
            steps {  
                checkout scm  
            }  
        }  
  
        stage('Terraform Init') {  
            steps {  
                dir("${TF_DIR}") {  
                    sh 'terraform init'  
                }  
            }  
        }  
  
        stage('Terraform Plan') {  
            steps {  
                dir("${TF_DIR}") {  
                    sh 'terraform plan -out=tfplan'  
                }  
            }  
        }  
  
        stage('Terraform Apply') {  
            steps {  
                dir("${TF_DIR}") {  
                    sh 'terraform apply -auto-approve tfplan'  
                }  
            }  
        }  
    }  
}

---

## 🔗 GitHub Webhook Integration

GitHub triggers Jenkins via:

https://jenkins.keyescloudsolutions.com/github-webhook/

### Trigger Events

- Code push
- Repository updates

### Result

- Automatic pipeline execution
- Zero manual deployment steps

---

## 📊 CI/CD Capabilities

This pipeline enables:

- Automated infrastructure deployment
- Consistent environment provisioning
- Rapid iteration and testing
- Full deployment traceability

---

## 🔍 Observability Integration

CI/CD is integrated into your monitoring stack:

- Jenkins logs → troubleshooting
- Pipeline output → audit trail

### Future Enhancements

- Prometheus metrics for Jenkins
- Grafana dashboards for pipeline health

👉 See: [[08-Logging-Monitoring]]

---

## 📸 Proof of CI/CD (Screenshots)

Add evidence here:

- Jenkins dashboard
- Successful pipeline execution
- Terraform plan output
- Terraform apply output
- GitHub webhook delivery logs
- Deployed AWS/GCP infrastructure

---

## ⚠️ Challenges & Solutions

### Webhook Not Triggering

- Fixed by:
    - Correct webhook URL
    - GitHub push event enabled
    - Jenkins job trigger configured

---

### Terraform Path Errors

- Solved using:

dir("${TF_DIR}")

---

### Credentials Not Loading

- Resolved with:
    - Jenkins credential binding
    - AWS credentials plugin

---

## 📈 Future Enhancements

Planned improvements:

- Approval stage before production deployment
- Environment separation (dev / staging / prod)
- Remote Terraform state (S3 + locking)
- Security scanning:
    - Snyk
    - Terraform validation tools
- Kubernetes deployment pipeline
- Multi-branch pipelines

---

## 🔗 Related Pages

- [[00-Overview]]
- [[01-Architecture]]
- [[05-Terraform]]
- [[08-Logging-Monitoring]]
- [[10-Challenges]]

---

## 🧠 Summary

This CI/CD pipeline transforms the project into a **fully automated cloud platform**.

It demonstrates:

- Real-world DevOps practices
- Infrastructure automation using Terraform
- Seamless GitHub → Jenkins integration
- Multi-cloud deployment capability