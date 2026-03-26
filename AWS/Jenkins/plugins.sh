#!/bin/bash
set -euxo pipefail

exec > >(tee /var/log/jenkins-bootstrap.log | logger -t jenkins-bootstrap -s 2>/dev/console) 2>&1

echo "[INFO] Updating OS packages"
dnf update -y

echo "[INFO] Installing required packages"
dnf install -y wget git unzip fontconfig java-21-amazon-corretto

echo "[INFO] Adding Jenkins repository"
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/rpm-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key || true

echo "[INFO] Installing Jenkins"
dnf clean all
dnf makecache
dnf install -y jenkins

echo "[INFO] Configuring Java 21 as default"
alternatives --set java /usr/lib/jvm/java-21-amazon-corretto.x86_64/bin/java || true

echo "[INFO] Cleaning package caches"
dnf clean all
rm -rf /var/cache/dnf/*

echo "[INFO] Enabling and starting Jenkins"
systemctl daemon-reload
systemctl enable jenkins
systemctl start jenkins

echo "[INFO] Waiting for Jenkins service"
for i in {1..36}; do
  if systemctl is-active --quiet jenkins; then
    echo "[INFO] Jenkins is running"
    break
  fi
  sleep 5
done

echo "[INFO] Bootstrap finished"
# sudo cat /var/lib/jenkins/secrets/initialAdminPassword

echo "[INFO] Capturing disk info"

df -h / > /var/log/disk-root.txt
df -h /tmp > /var/log/disk-tmp.txt

cat /var/log/disk-root.txt
cat /var/log/disk-tmp.txt