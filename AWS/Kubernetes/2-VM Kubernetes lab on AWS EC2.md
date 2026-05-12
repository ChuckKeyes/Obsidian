
![[Pasted image 20260430193450.png]]

![[Pasted image 20260430193635.png]]
![[Pasted image 20260430193802.png]]

![[Pasted image 20260430193858.png]]

![[Pasted image 20260430193935.png]]


- **1 EC2 instance** = Kubernetes Control Plane
- **1 EC2 instance** = Kubernetes Worker
- Same VPC / subnet
- Private networking between them
- SSH from your laptop

---

# ⚠️ Important Reality Check

A 2-node cluster is good for:

- Learning Kubernetes
- Pods / Deployments / Services
- kubectl practice
- Jenkins + CI/CD lab
- Prometheus/Grafana practice

Not ideal for production because:

- Single control plane = no HA
- One worker only

---

# ✅ Best OS Choice

Use:

Amazon Web Services **Ubuntu 22.04 LTS** on EC2

(works easier than Amazon Linux for kubeadm labs)

---

# STEP 1 — Create Security Group

In Amazon Web Services EC2 Console:

Create Security Group:

### Inbound Rules

|Type|Port|Source|
|---|---|---|
|SSH|22|Your IP|
|Custom TCP|6443|Security Group itself|
|Custom TCP|2379-2380|Security Group itself|
|Custom TCP|10250|Security Group itself|
|Custom TCP|30000-32767|Your IP or lab IP|

This allows Kubernetes traffic.

---

# STEP 2 — Launch 2 EC2 Instances

Launch:

### Instance 1

- Name: `k8s-control-plane`

### Instance 2

- Name: `k8s-worker-1`

Settings:

- Ubuntu 22.04
- t3.medium minimum (2 CPU / 4GB RAM)
- Same VPC
- Same subnet
- Same Security Group
- Key pair for SSH

---

# STEP 3 — SSH into BOTH VMs

```
ssh -i mykey.pem ubuntu@PUBLIC-IP
```

Do on both servers.

---

# STEP 4 — Prepare BOTH Nodes

Run on BOTH VMs:

```
sudo apt update && sudo apt upgrade -ysudo hostnamectl set-hostname <name>
```

Disable swap:

```
sudo swapoff -asudo sed -i '/ swap / s/^/#/' /etc/fstab
```

Enable kernel modules:

```
cat <<EOF | sudo tee /etc/modules-load.d/k8s.confoverlaybr_netfilterEOFsudo modprobe overlaysudo modprobe br_netfilter
```

Networking:

```
cat <<EOF | sudo tee /etc/sysctl.d/k8s.confnet.bridge.bridge-nf-call-iptables=1net.ipv4.ip_forward=1net.bridge.bridge-nf-call-ip6tables=1EOFsudo sysctl --system
```

---

# STEP 5 — Install Container Runtime (containerd)

On BOTH:

```
sudo apt install -y containerdsudo mkdir -p /etc/containerdcontainerd config default | sudo tee /etc/containerd/config.tomlsudo systemctl restart containerdsudo systemctl enable containerd
```

---

# STEP 6 — Install Kubernetes Packages

On BOTH:

```
sudo apt install -y apt-transport-https curlcurl -fsSL https://pkgs.k8s.io/core:/stable:/v1.30/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpgecho 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.30/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.listsudo apt updatesudo apt install -y kubelet kubeadm kubectlsudo apt-mark hold kubelet kubeadm kubectl
```

---

# STEP 7 — Initialize Control Plane

On CONTROL PLANE only:

```
sudo kubeadm init --pod-network-cidr=10.244.0.0/16
```

After success:

```
mkdir -p $HOME/.kubesudo cp /etc/kubernetes/admin.conf $HOME/.kube/configsudo chown $(id -u):$(id -g) $HOME/.kube/config
```

---

# STEP 8 — Install Network Plugin

Use Flannel:

```
kubectl apply -f https://github.com/flannel-io/flannel/releases/latest/download/kube-flannel.yml
```

---

# STEP 9 — Join Worker Node

From kubeadm output, copy join command.

Looks like:

```
sudo kubeadm join CONTROL-PRIVATE-IP:6443 --token xxxx \--discovery-token-ca-cert-hash sha256:xxxxx
```

Run on WORKER node.

---

# STEP 10 — Verify Cluster

On control plane:

```
kubectl get nodes
```

Expected:

```
k8s-control-plane Readyk8s-worker-1 Ready
```

---

# STEP 11 — Test Deployment

```
kubectl create deployment nginx --image=nginxkubectl expose deployment nginx --type=NodePort --port=80kubectl get svc
```

Access worker public IP + NodePort.

---

# 🔥 What You Built

- Real Kubernetes cluster
- 1 control plane
- 1 worker
- Networking
- Pod scheduling
- kubectl admin experience

Excellent for portfolio.

---

# ⚠️ Better AWS Alternative

Instead of raw EC2 Kubernetes:

Use Amazon Web Services **Amazon Elastic Kubernetes Service (EKS)**

Because:

- AWS manages control plane
- More realistic enterprise skill
- Easier scaling

But raw EC2 cluster teaches more.

---

# 🧠 Resume Value

> Built self-managed Kubernetes cluster on AWS EC2 using kubeadm with control plane and worker nodes, containerd runtime, overlay networking, and application deployments.