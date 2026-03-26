#!/bin/bash
set -euxo pipefail

exec > >(tee /var/log/user-data.log | logger -t user-data -s 2>/dev/console) 2>&1

echo "=== Install Jenkins on Amazon Linux 2023 ==="

dnf update -y

wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/rpm-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/rpm-stable/jenkins.io-2026.key

dnf install -y java-21-amazon-corretto fontconfig jenkins git wget unzip python3 awscli

systemctl daemon-reload
systemctl enable jenkins
systemctl start jenkins

sleep 20

echo "=== Jenkins status ==="
systemctl status jenkins --no-pager -l || true
journalctl -u jenkins --no-pager -n 100 || true

echo "=== Java version ==="
java -version || true

echo "=== Jenkins unlock password ==="
cat /var/lib/jenkins/secrets/initialAdminPassword || true