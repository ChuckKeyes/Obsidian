#!/bin/bash
apt-get update -y
apt-get install -y docker.io awscli git unzip jq tree vim
systemctl enable docker
systemctl start docker
usermod -aG docker ubuntu
mkdir -p /home/ubuntu/builds
chown -R ubuntu:ubuntu /home/ubuntu/builds
