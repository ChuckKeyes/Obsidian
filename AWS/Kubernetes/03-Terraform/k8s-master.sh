#!/bin/bash

apt-get update -y

apt-get install -y \
  vim \
  curl \
  wget \
  git \
  unzip \
  jq \
  net-tools \
  htop \
  tree \
  apt-transport-https \
  ca-certificates \
  gnupg \
  lsb-release

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

hostnamectl set-hostname k8s-master

echo "alias k=kubectl" >> /home/ubuntu/.bashrc
echo "alias ll='ls -alh'" >> /home/ubuntu/.bashrc

cat <<EOF >> /etc/hosts
127.0.0.1 localhost
127.0.1.1 k8s-master
EOF

mkdir -p /etc/apt/keyrings

curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.30/deb/Release.key | \
gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.30/deb/ /' | \
tee /etc/apt/sources.list.d/kubernetes.list

apt-get update -y
apt-get install -y kubelet kubeadm kubectl
apt-mark hold kubelet kubeadm kubectl

# Extra tools for Kubernetes work
apt-get install -y \
  bash-completion \
  software-properties-common \
  python3 \
  python3-pip \
  docker.io

systemctl enable docker
systemctl start docker
usermod -aG docker ubuntu

# kubectl autocomplete and aliases
echo "source <(kubectl completion bash)" >> /home/ubuntu/.bashrc
echo "complete -o default -F __start_kubectl k" >> /home/ubuntu/.bashrc
chown ubuntu:ubuntu /home/ubuntu/.bashrc

# Make kubectl easier for root too
echo "alias k=kubectl" >> /root/.bashrc
echo "alias ll='ls -alh'" >> /root/.bashrc

# Create lab folders
mkdir -p /home/ubuntu/k8s-labs
mkdir -p /home/ubuntu/k8s-websites
mkdir -p /home/ubuntu/bread-website
mkdir -p /home/ubuntu/scripts
chown -R ubuntu:ubuntu /home/ubuntu/k8s-labs /home/ubuntu/k8s-websites /home/ubuntu/bread-website /home/ubuntu/scripts

# Install Helm
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# Helpful Kubernetes check script
cat <<'EOF' > /home/ubuntu/scripts/k8s-check.sh
#!/bin/bash
echo "===== NODES ====="
kubectl get nodes -o wide

echo
echo "===== PODS ALL NAMESPACES ====="
kubectl get pods -A

echo
echo "===== SERVICES ====="
kubectl get svc -A
EOF

chmod +x /home/ubuntu/scripts/k8s-check.sh
chown ubuntu:ubuntu /home/ubuntu/scripts/k8s-check.sh






# reboot
