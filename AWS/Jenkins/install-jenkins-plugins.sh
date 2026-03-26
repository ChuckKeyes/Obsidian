#!/bin/bash
set -euxo pipefail

JENKINS_URL="http://localhost:8080"

echo "[INFO] Waiting for Jenkins web UI"
for i in {1..60}; do
  if curl -fsS "$JENKINS_URL/login" >/dev/null 2>&1; then
    echo "[INFO] Jenkins UI is reachable"
    break
  fi
  sleep 5
done

echo "[INFO] Downloading Jenkins plugin manager tool"
cd /tmp
wget -O jenkins-plugin-manager.jar \
  https://github.com/jenkinsci/plugin-installation-manager-tool/releases/latest/download/jenkins-plugin-manager.jar

echo "[INFO] Installing CLI tools"
# Basic tools
dnf install -y unzip git
# Python
dnf install -y python3 python3-pip
# AWS CLI (v2)
dnf install -y awscli
# Terraform
cd /tmp
wget https://releases.hashicorp.com/terraform/1.8.5/terraform_1.8.5_linux_amd64.zip
unzip terraform_1.8.5_linux_amd64.zip
mv terraform /usr/local/bin/
chmod +x /usr/local/bin/terraform

# Verify installs
python3 --version
aws --version
terraform -version
EOF

echo "[INFO] Installing plugins"
sudo java -jar /tmp/jenkins-plugin-manager.jar \
  --war /usr/share/java/jenkins.war \
  --plugin-download-directory /var/lib/jenkins/plugins \
  --plugin-file /tmp/plugins.txt

echo "[INFO] Fixing ownership"
sudo chown -R jenkins:jenkins /var/lib/jenkins/plugins

echo "[INFO] Restarting Jenkins"
sudo systemctl restart jenkins
sudo systemctl status jenkins --no-pager