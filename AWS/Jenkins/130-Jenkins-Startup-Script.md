
#!/bin/bash
set -euxo pipefail

# Log everything for debugging
exec > >(tee /var/log/jenkins-bootstrap.log | logger -t user-data -s 2>/dev/console) 2>&1

# Update OS
dnf update -y

# Install tools
dnf install -y wget curl

# Add Jenkins repo + key
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

# Refresh metadata
dnf clean all
dnf makecache

# Install Java 17 and Jenkins
dnf install -y java-17-amazon-corretto
dnf install -y jenkins

# Enable + start Jenkins
systemctl enable jenkins
systemctl start jenkins

# Wait a moment, then show status
sleep 10
systemctl status jenkins --no-pager || true

# Save the initial admin password to an easy-to-find file
if [ -f /var/lib/jenkins/secrets/initialAdminPassword ]; then
  cat /var/lib/jenkins/secrets/initialAdminPassword > /root/jenkins-admin-password.txt
fi