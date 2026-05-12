
AWS + VS Code + Bash + Docker on AWS EC2

This plan is designed specifically for:

- Your cloud background
- Your Terraform/AWS/GCP experience
- Your Bash usage
- Your CKA goal
- Your laptop Docker issues

So EVERYTHING runs inside AWS EC2 instances.

---

# 🎯 End Goal

After Day 10 you should be able to:

✅ Build Kubernetes clusters  
✅ Understand control plane + worker nodes  
✅ Use kubectl quickly  
✅ Create YAML from memory  
✅ Troubleshoot pods/nodes/networking  
✅ Configure storage  
✅ Use Ingress  
✅ Understand RBAC  
✅ Backup/restore etcd  
✅ Practice CKA-style questions

You will NOT be “master level” yet…

BUT:

✅ You SHOULD be ready for:

- Killer.sh
- Practice exams
- Timed troubleshooting
- Real CKA preparation

---

# 🏗️ LAB ARCHITECTURE

You will build:

|Node|Purpose|
|---|---|
|k8s-master|Control Plane|
|k8s-worker1|Worker|
|k8s-worker2|Worker|
|bastion(optional)|VS Code SSH jump box|

---

# ☁️ AWS REQUIREMENTS

## EC2 Instances

Use Ubuntu 22.04 LTS

Recommended:

|Instance|Type|
|---|---|
|Master|t3.medium|
|Worker1|t3.medium|
|Worker2|t3.medium|

Minimum:

- 2 vCPU
- 4 GB RAM

---

# 🔐 Security Group

Allow:

|Port|Purpose|
|---|---|
|22|SSH|
|6443|Kubernetes API|
|30000-32767|NodePort|
|80/443|Ingress|

Source:

- Your IP only

---

# 🖥️ Tools Installed

Inside AWS EC2:

- Docker
- containerd
- kubeadm
- kubelet
- kubectl
- Helm
- VS Code Remote SSH

---

# 🧰 DAILY STRUCTURE

Each day:

|Time|Activity|
|---|---|
|30 min|Read concepts|
|2 hrs|Build lab|
|1 hr|Break/fix things|
|30 min|Repeat commands from memory|

---

# 📅 DAY 1 — Linux + Docker + AWS Setup

# Goal

Prepare Kubernetes environment.

---

## Tasks

### Create EC2 Instances

Launch:

- master
- worker1
- worker2

---

## Install Docker

```
sudo apt update 
sudo apt install -y docker.io
sudo systemctl enable docker
sudo systemctl start docker
```

Test:

```
sudo docker run hello-world
```

---

## Install containerd

```
sudo apt install -y containerd
```

---

## Install VS Code Remote SSH

Connect VS Code directly to EC2.

---

## Learn

Understand:

- Containers
- Images
- Namespaces
- cgroups
- containerd
- Docker vs Kubernetes

---

# 📅 DAY 2 — Install Kubernetes Cluster

# Goal

Build cluster manually using kubeadm.

---

## Install Kubernetes Packages

On ALL nodes:

```
sudo apt updatesudo apt install -y apt-transport-https curl
```

Add repo:

```
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.30/deb/Release.key | \sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
```

Add source:

```
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] \https://pkgs.k8s.io/core:/stable:/v1.30/deb/ /' | \sudo tee /etc/apt/sources.list.d/kubernetes.list
```

Install:

```
sudo apt updatesudo apt install -y kubelet kubeadm kubectlsudo apt-mark hold kubelet kubeadm kubectl
```

---

## Initialize Cluster

On master:

```
sudo kubeadm init
```

---

## Configure kubectl

```
mkdir -p $HOME/.kubesudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/configsudo chown $(id -u):$(id -g) $HOME/.kube/config
```

---

## Install CNI

Install Calico:

```
kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/master/manifests/calico.yaml
```

---

## Join Workers

Use kubeadm join command.

---

## Verify

```
kubectl get nodes
```

---

# 📅 DAY 3 — Pods + YAML

# Goal

Master pods.

---

## Tasks

Create:

- nginx pod
- busybox pod
- alpine pod

Commands:

```
kubectl run nginx --image=nginx
```

---

## Learn YAML

Export YAML:

```
kubectl get pod nginx -o yaml
```

---

## Practice

Create YAML manually:

- Pod
- Labels
- Annotations
- Commands
- Environment variables

---

## Troubleshooting

Break:

- wrong image
- bad command
- typo

Fix:

```
kubectl describe podkubectl logs
```

---

# 📅 DAY 4 — Deployments + Scaling

# Goal

Understand application management.

---

## Tasks

Create Deployment:

```
kubectl create deployment web --image=nginx
```

Scale:

```
kubectl scale deployment web --replicas=5
```

---

## Learn

Understand:

- ReplicaSets
- Rolling updates
- Rollbacks

---

## Break/Fix

Deploy bad image:

```
nginx:fake
```

Rollback:

```
kubectl rollout undo deployment web
```

---

# 📅 DAY 5 — Services + Networking

# Goal

Master Kubernetes networking.

---

## Tasks

Create:

- ClusterIP
- NodePort

Expose deployment:

```
kubectl expose deployment web --port=80 --type=NodePort
```

---

## Learn

Understand:

- kube-proxy
- ClusterIP
- DNS
- Pod-to-pod communication

---

## Troubleshooting

Break:

- wrong selector
- wrong labels

Fix using:

```
kubectl get endpoints
```

---

# 📅 DAY 6 — Ingress + Helm

# Goal

Understand real-world traffic routing.

---

## Install Helm

```
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
```

---

## Install NGINX Ingress

Using Helm.

---

## Create Ingress Rules

Test:

- hostname routing
- path routing

---

## Learn

Understand:

- Load balancing
- Reverse proxy
- Ingress controller

---

# 📅 DAY 7 — Storage

# Goal

Master PVC/PV.

---

## Tasks

Create:

- PersistentVolume
- PersistentVolumeClaim

Mount into pod.

---

## Learn

Understand:

- access modes
- reclaim policy
- storage classes

---

## Troubleshooting

Break:

- wrong storage size
- wrong access mode

Fix binding problems.

---

# 📅 DAY 8 — ConfigMaps + Secrets + RBAC

# Goal

Cluster security + configuration.

---

## Tasks

Create:

- ConfigMaps
- Secrets

Mount into pods.

---

## RBAC

Create:

- ServiceAccount
- Role
- RoleBinding

---

## Learn

Understand:

- authentication
- authorization
- least privilege

---

# 📅 DAY 9 — Cluster Troubleshooting + etcd

# Goal

CKA-style troubleshooting.

---

## Practice

Break:

- kubelet
- networking
- DNS
- bad manifests
- image pull failures

---

## etcd Backup

```
ETCDCTL_API=3 etcdctl snapshot save backup.db
```

Restore snapshot.

---

## Learn

Understand:

- control plane
- etcd
- scheduler
- controller manager

---

# 📅 DAY 10 — Mock CKA Exam

# Goal

Simulate exam.

---

# RULES

✅ Only Bash  
✅ No GUI  
✅ Timer running  
✅ No notes  
✅ Only kubectl help/docs

---

## Tasks

You must:

### Build

- pods
- deployments
- services
- ingress
- pvc

### Troubleshoot

- CrashLoopBackOff
- ImagePullBackOff
- DNS failures
- Service failures

### Admin

- RBAC
- drain node
- cordon node
- etcd backup

---

# 🧠 MOST IMPORTANT COMMANDS

You MUST become fast with:

```
kubectl getkubectl describekubectl logskubectl execkubectl applykubectl editkubectl deletekubectl exposekubectl scalekubectl rolloutkubectl cordonkubectl drainkubectl taintkubectl labelkubectl top
```

---

# 🔥 AFTER DAY 10

You should then move to:

## 1. Killer.sh

Closest thing to real exam.

---

## 2. KodeKloud CKA Labs

Very good.

---

## 3. Repeat Labs FAST

Speed matters more than theory.

---

# 🏆 FINAL ADVICE

Your background gives you a HUGE advantage:

- networking
- Terraform
- AWS
- Linux
- cloud architecture

Most people struggle with:

- Linux
- networking
- infrastructure

You already have those skills.

Your biggest challenge will be:

- kubectl speed
- YAML speed
- troubleshooting speed

That comes from repetition.

---

# Expected Outcome

After 10 days:

| Skill           | Expected            |
| --------------- | ------------------- |
| Build cluster   | YES                 |
| Deploy apps     | YES                 |
| Networking      | GOOD                |
| Storage         | GOOD                |
| Troubleshooting | DECENT              |
| RBAC            | GOOD                |
| etcd            | BASIC               |
| Exam readiness  | PRACTICE TEST READY |