

# 📅 DAY 1 — Linux + Docker + AWS Setup

# Goal

Prepare Kubernetes environment.

---
## OUTPUTS

Apply complete! Resources: 9 added, 0 changed, 0 destroyed.

Outputs:

k8s_master_elastic_ip = "44.216.61.190"
k8s_worker1_elastic_ip = "44.196.55.59"
k8s_worker2_elastic_ip = "100.29.50.119"
kubernetes_dns = "kubernetes.keyescloudsolutions.com"
master_public_ip = "44.216.61.190"
ssh_master = "ssh -i ~/.ssh/id_rsa ubuntu@44.216.61.190"
ssh_worker1 = "ssh -i ~/.ssh/id_rsa ubuntu@44.196.55.59"
ssh_worker2 = "ssh -i ~/.ssh/id_rsa ubuntu@100.29.50.119"
worker1_public_ip = "44.196.55.59"
worker2_public_ip = "100.29.50.119"
## Tasks

### Create EC2 Instances

Launch:

- master      ssh -i ~/.ssh/id_rsa ubuntu@3.132.178.158
		   sudo hostnamectl set-hostname k8s-master   
		   sudo reboot
		   
- worker1    ssh -i ~/.ssh/id_rsa ubuntu@18.220.52.61
		-     sudo hostnamectl set-hostname k8s-worker1   sudo reboot
		- 
- worker2    ssh -i ~/.ssh/id_rsa ubuntu@16.59.212.180
		-    sudo hostnamectl set-hostname k8s-worker2   sudo reboot
		- 
## After reboot, SSH back in using the Elastic IPs.

---

## Install Docker

```
clear
sudo apt update
sudo apt install -y docker.io
sudo systemctl enable docker
sudo systemctl start docker
```

Test:

```
sudo docker run hello-world
```
<span style="background:#fff88f">To allow the `ubuntu` user to run Docker without `sudo`:</span>

<span style="background:#fff88f">```</span>
<span style="background:#fff88f">sudo usermod -aG docker ubuntu</span>
<span style="background:#fff88f">```</span>

<span style="background:#fff88f">Then **log out and back in**:</span>

<span style="background:#fff88f">```</span>
<span style="background:#fff88f">exit</span>
<span style="background:#fff88f">```</span>

<span style="background:#fff88f">SSH back into the VM, then test:</span>

<span style="background:#fff88f">```</span>
<span style="background:#fff88f">docker run hello-world</span>
```

<span style="background:#fff88f">But for Kubernetes: you already have **containerd running**, so Docker is **not required** for kubeadm. Kubernetes will use `containerd`, not Docker.</span>
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
  
## Read / Study

### Containers Fundamentals

- [What is a Container?](https://kubernetes.io/docs/concepts/containers/?utm_source=chatgpt.com)
- [Docker Overview](https://docs.docker.com/get-started/docker-overview/?utm_source=chatgpt.com)

### Kubernetes Architecture Intro

- [Kubernetes Components](https://kubernetes.io/docs/concepts/overview/components/?utm_source=chatgpt.com)

### Linux Topics

Learn:

- processes
- namespaces
- cgroups
- systemd
- networking basics