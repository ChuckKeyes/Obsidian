

#!/bin/bash

# --------------------------------------
# Update all installed packages
# --------------------------------------
sudo yum update -y

# --------------------------------------
# Add the Jenkins repository to yum sources
# --------------------------------------
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo

# --------------------------------------
# Import the Jenkins GPG key to verify packages
# --------------------------------------
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

# --------------------------------------
# Upgrade all packages (including those from the new Jenkins repo)
# --------------------------------------
sudo yum upgrade -y

# --------------------------------------
# Install Amazon Corretto 17 (required Java version for Jenkins)
# --------------------------------------
sudo yum install java-17-amazon-corretto -y

# --------------------------------------
# Install Jenkins
# --------------------------------------
sudo yum install jenkins -y

# --------------------------------------
# Enable Jenkins to start at boot
# --------------------------------------
sudo systemctl enable jenkins

# --------------------------------------
# Start the Jenkins service
# --------------------------------------
sudo systemctl start jenkins

# --------------------------------------
# Optional: Check the status of Jenkins (won’t display in EC2 user data logs but useful for debugging)
# --------------------------------------
sudo systemctl status jenkins
# Q to quit lol