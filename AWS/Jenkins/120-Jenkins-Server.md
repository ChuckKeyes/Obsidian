

f0ac3c7461f848ebbb684dc1c3113e43
6f9d8f3bf92e4207a0a663b159ad5013

#!/bin/bash
set -euxo pipefail

exec > >(tee /var/log/jenkins-user-data.log | logger -t user-data -s 2>/dev/console) 2>&1

echo "=== BEGIN JENKINS USER-DATA ==="
date

# Let networking and repo metadata settle
sleep 20

# Update base packages
dnf update -y

# Install only wget
dnf install -y wget

# Add Jenkins repo
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/rpm-stable/jenkins.repo

# Import Jenkins signing key
rpm --import https://pkg.jenkins.io/rpm-stable/jenkins.io-2026.key

# Refresh metadata after adding repo
dnf makecache --refresh -y

# Install Java 21
dnf install -y java-21-amazon-corretto

# Verify Java
java -version

# Install Jenkins
dnf install -y jenkins

# Enable and start Jenkins
systemctl daemon-reload
systemctl enable jenkins
systemctl start jenkins

# Wait for Jenkins startup
sleep 15

# Debug info
systemctl status jenkins --no-pager || true
ss -tulpn | grep 8080 || true

# Save initial admin password
cat /var/lib/jenkins/secrets/initialAdminPassword | tee /root/jenkins-initial-admin-password || true

echo "=== END JENKINS USER-DATA ==="
date
# sudo 1a95b0f01f804bc282717b0838fe9baa

##########################################################################

**Manage Jenkins → Plugins**

Jenkins’ plugin manager is the normal way to install and update plugins from the web UI.

For your AWS + GCP + Terraform lab, I’d do it in this order:

**First wave**

- **GitHub Integration**
    
- **Pipeline: GitHub**
    
- **Git**
    
- **Credentials Binding**
    
- **SSH Agent**
    
- **AWS Credentials**
    
- **Pipeline: AWS Steps**
    
- **Google Cloud Platform SDK::Auth**
    
- **Pipeline Utility Steps**
    

Those give you the basics for:

- pulling code from GitHub
    
- storing secrets safely
    
- running Jenkinsfiles
    
- talking to AWS and GCP from pipelines
    

`Pipeline: AWS Steps` is specifically for AWS API steps inside Jenkins pipelines.

**Second wave**

- **SonarQube Scanner**
    
- **Maven Integration** or **Pipeline Maven Integration**
    
- **Publish Over SSH**
    

Add these once your first pipeline works.

**Be careful with the Terraform plugin**  
The Jenkins Terraform plugin page shows it as a classic build-wrapper style plugin, and its plugin page/version info appears quite old. For modern pipelines, it is usually safer to install the **Terraform CLI on the box** and call it from a `Jenkinsfile` with shell steps rather than depending on that plugin.

So for Terraform, I recommend:

- install **terraform binary** on the EC2 host
    
- use Jenkins pipeline stages like:
    
    - `terraform fmt`
        
    - `terraform init`
        
    - `terraform validate`
        
    - `terraform plan`
        
    - `terraform apply`
        

**For agents later**  
If you want Jenkins to spin up workers dynamically:

- **Amazon EC2** plugin for EC2-based agents
    
- **Kubernetes** plugin for k8s-based agents
    

The EC2 plugin is for starting and terminating Jenkins agents on demand in EC2, and the Kubernetes plugin is for dynamic agents in a cluster.

**What I would skip for now**  
Do not install all of these on day one:

- Aqua scanners
    
- Snyk
    
- ECS/Fargate
    
- CodeDeploy
    
- CodePipeline
    
- Lambda
    
- SAM
    

They are useful, but they can wait until your basic CI pipeline is working.

A clean starter stack for you is:

- GitHub Integration
    
- Pipeline: GitHub
    
- Git
    
- AWS Credentials
    
- Pipeline: AWS Steps
    
- Google Cloud Platform SDK::Auth
    
- Credentials Binding
    
- Pipeline Utility Steps
    
- SonarQube Scanner
    

Then install:

- Terraform CLI on the server
    
- gcloud CLI if you want GCP deploys
    
- AWS CLI if not already present
- ###QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ
- HW == rebuild the Jenkins server as an EC2 OR in a Docker image, using Java 21 instead of Java 17  
  
Be a Man == script out adding the jenkins plugins, so that when the server is built and ready for interaction, the necessary plugins are already installed  
  
Mandatory plugins:  
- AWS Credentials  
- Pipeline: AWS steps  
- Terraform  
- Snyk  
- Pipeline: GCP steps  
- Google Cloud Platform SDK::Auth  
- Github integration  
- Github Authentication  
- Pipeline: Github  
  
BAM 2 is explaining why you need to modify the filesystem; a persistent solution alternative (the current solution fails to properly persist across reboots); and to automate the process in the user data.
- 