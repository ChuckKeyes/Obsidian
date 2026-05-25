#!/bin/bash

apt-get update -y
apt-get install -y curl wget git vim net-tools apt-transport-https ca-certificates gnupg lsb-release

swapoff -a
sed -i '/ swap / s/^/#/' /etc/fstab

modprobe overlay
modprobe br_netfilter

cat <<EOF > /etc/sysctl.d/kubernetes.conf
net.bridge.bridge-nf-call-iptables = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.ipv4.ip_forward = 1



EOF

sysctl --system

apt-get install -y containerd

mkdir -p /etc/containerd
containerd config default > /etc/containerd/config.toml

sed -i 's/SystemdCgroup = false/SystemdCgroup = true/' /etc/containerd/config.toml

systemctl restart containerd
systemctl enable containerd

hostnamectl set-hostname k8s-worker1

cat <<EOF >> /etc/hosts
127.0.0.1 localhost
127.0.1.1 k8s-worker1
EOF

reboot