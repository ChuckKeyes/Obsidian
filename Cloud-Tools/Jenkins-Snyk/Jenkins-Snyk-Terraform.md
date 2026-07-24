
There are 3 common ways:

---

# 1. Jenkins Installs/Uses Snyk Automatically ⭐ MOST COMMON

Your Terraform builds the Jenkins server.

Then Jenkins pipeline installs or calls Snyk automatically.

Example:

```
stage('Snyk Scan') {    steps {        sh 'snyk auth $SNYK_TOKEN'        sh 'snyk iac test .'    }}
```

OR:

```
npm install -g snyk
```

inside bootstrap/user-data.

---

# 2. Terraform Builds Jenkins WITH Snyk Preinstalled ⭐ BEST FOR PORTFOLIO

Terraform can launch EC2 + install:

- Jenkins
- Java
- Terraform
- Docker
- Git
- Snyk CLI

automatically using:

- user_data
- cloud-init
- Ansible
- Packer image

Example EC2 bootstrap:

```
#!/bin/bashdnf install -y java-21-amazon-corretto git dockercurl -Lo snyk https://static.snyk.io/cli/latest/snyk-linuxchmod +x snykmv snyk /usr/local/bin/systemctl enable --now docker
```

Now every Jenkins server already has Snyk.

---

# 3. Docker/Jenkins Agent Method ⭐ ENTERPRISE STYLE

Most modern companies do NOT install tools directly on Jenkins.

Instead:

- Jenkins spins up containers
- container already has:
    - Terraform
    - kubectl
    - Snyk
    - AWS CLI
    - gcloud

Example:

```
agent {  docker {    image 'hashicorp/terraform:latest'  }}
```

or custom image:

```
mycompany/devsecops-agent
```

This is cleaner and scalable.

---

# Where Terraform Fits

Terraform itself usually does NOT "install Snyk into Jenkins UI."

Terraform mainly:

✅ Creates infrastructure  
✅ Creates EC2/Jenkins server  
✅ Adds bootstrap scripts  
✅ Opens security groups  
✅ Creates IAM roles  
✅ Injects environment variables/secrets

The actual Snyk usage happens in:

- Jenkinsfile
- bootstrap script
- Docker image
- CI/CD pipeline

---

# Real Enterprise Flow

Typical modern DevSecOps pipeline:

```
Developer Pushes Code        ↓GitHub Webhook        ↓Jenkins Pipeline        ↓Terraform Plan        ↓Snyk IaC Scan        ↓Terraform Apply        ↓Deploy Kubernetes/App
```

---

# For YOUR Portfolio