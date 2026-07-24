
## 📖 Executive Summary

Designed and implemented a CI/CD pipeline using Jenkins to automate infrastructure provisioning in AWS using Terraform. The pipeline integrates with GitHub webhooks to trigger deployments on code changes, ensuring consistent, repeatable, and validated infrastructure delivery.

---

## 🎯 Objectives

- Automate infrastructure deployment using Terraform
- Implement event-driven CI/CD using webhooks
- Validate infrastructure using pipeline health checks
- Demonstrate real-world DevOps practices

---

## 🏗️ Architecture Overview

### Components:

- **CI/CD Engine:** Jenkins
- **Source Control:** GitHub
- **Infrastructure as Code:** Terraform
- **Cloud Provider:** Amazon Web Services
- **Storage Service:** Amazon S3

---

## 🔄 Workflow Design

1. Developer pushes code to GitHub
2. GitHub sends webhook to Jenkins
3. Jenkins pipeline is triggered automatically
4. Terraform initializes and applies infrastructure
5. Health checks validate deployment

---

## ⚙️ Jenkins Pipeline Implementation

### Key Stages:

pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = 'us-east-1'
        TF_IN_AUTOMATION   = 'true'
    }

    stages {

        stage('Checkout') {
            steps { checkout scm }
        }

        stage('Terraform Validate') {
            steps { sh 'terraform validate' }
        }

        stage('Terraform Plan') {
            steps { sh 'terraform plan -out=tfplan' }
        }

        stage('Terraform Apply') {
            steps { sh 'terraform apply -auto-approve tfplan' }
        }

        stage('Health Check') {
            steps {
                sh 'aws s3 ls'
            }
        }
    }
}
## 🔐 Security & Best Practices

- Used Jenkins credentials binding for AWS authentication
- Avoided hardcoding secrets in Terraform
- Implemented least privilege IAM roles
- Validated infrastructure before deployment

---

## 🧪 Pipeline Health Checks

To ensure reliability, the pipeline includes:

- **Terraform validation** → prevents syntax errors
- **Terraform plan review** → prevents unintended changes
- **AWS CLI verification** → confirms resource creation
- **Optional HTTP checks** → validates application availability

---

## 🛠️ Challenges & Solutions

### Challenge 1: Jenkins Plugin Compatibility

- Issue: Plugins failing due to Java version mismatch
- Solution: Standardized on Java 21 and reinstalled dependencies

### Challenge 2: Webhook Not Triggering

- Issue: Jenkins job not starting on push
- Solution: Configured GitHub webhook endpoint and verified delivery logs

### Challenge 3: S3 Bucket Deletion Failures

- Issue: Terraform destroy failed due to non-empty bucket
- Solution: Implemented pre-destroy cleanup using AWS CLI

---

## 📊 Results

- Fully automated CI/CD pipeline
- Real-time deployment triggered by GitHub commits
- Verified infrastructure using health checks
- Reduced manual provisioning effort to zero

---

## 🧾 Verification Steps

- Jenkins console output showing successful pipeline execution
- GitHub webhook delivery logs
- AWS CLI output confirming resource creation
- Terraform logs showing successful apply/destroy

---

## 📚 Key Skills Demonstrated

- CI/CD pipeline design
- Infrastructure as Code (Terraform)
- Cloud automation (AWS)
- Jenkins administration and troubleshooting
- Webhook integration
- Pipeline validation and monitoring

---

## 🚀 Future Enhancements

- Add multi-environment support (dev/stage/prod)
- Integrate security scanning (Snyk, Trivy)
- Implement automated rollback on failure
- Extend pipeline to multi-cloud (AWS + GCP, aligning with Lab4)