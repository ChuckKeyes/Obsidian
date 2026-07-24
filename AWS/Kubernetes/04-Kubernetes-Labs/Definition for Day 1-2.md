# 📘 Kubernetes Lab — Day 1 & Day 2 Command Definitions

Based on your completed Day 1 and Day 2 Kubernetes lab setup.

---

# 📅 DAY 1 — Linux + Docker + AWS Setup

---

# `sudo apt update`

Updates Ubuntu package lists from repositories.

### Purpose

Downloads the latest package metadata before installations.

### Example

```
sudo apt update
```

---

# `sudo apt install -y docker.io`

Installs Docker Engine from Ubuntu repositories.

### Purpose

Provides container runtime capabilities.

### `-y`

Automatically answers “yes” to prompts.

---

# `sudo systemctl enable docker`

Enables Docker service at boot.

### Purpose

Docker starts automatically when VM reboots.

---

# `sudo systemctl start docker`

Starts Docker service immediately.

### Purpose

Launches Docker daemon without rebooting.

---

# `sudo docker run hello-world`

Runs Docker test container.

### Purpose

Verifies Docker is installed correctly.

### What happens

Docker:

1. Downloads image
2. Creates container
3. Executes test message

---

# `sudo apt install -y containerd`

Installs containerd runtime.

### Purpose

Container runtime used by Kubernetes.

### Important

Modern Kubernetes uses:

- containerd  
    instead of:
- Docker Engine directly

---

# `systemctl status containerd --no-pager`

Checks containerd service status.

### Purpose

Verifies container runtime is running.

### `--no-pager`

Shows output directly without scrolling tool.

---

# 🧠 Important Day 1 Concepts

|Term|Definition|
|---|---|
|Container|Lightweight isolated application environment|
|Image|Read-only template used to create containers|
|Namespace|Linux isolation mechanism|
|cgroups|Linux resource control system|
|containerd|Kubernetes container runtime|
|Docker|Container platform and tooling|

---

# 📅 DAY 2 — Kubernetes Cluster Setup

---

# `sudo swapoff -a`

Disables swap memory.

### Purpose

Kubernetes requires swap disabled.

---

# `sudo modprobe overlay`

Loads Linux overlay filesystem module.

### Purpose

Supports container layered filesystems.

---

# `sudo modprobe br_netfilter`

Loads bridge networking filter module.

### Purpose

Allows Kubernetes networking rules through iptables.

---

# `sudo sysctl --system`

Applies kernel networking settings.

### Purpose

Enables Kubernetes networking features.

---

# `curl -fsSL URL`

Downloads files silently.

### Flags

|Flag|Meaning|
|---|---|
|`-f`|Fail silently on errors|
|`-s`|Silent mode|
|`-S`|Show errors|
|`-L`|Follow redirects|

---

# `sudo gpg --dearmor`

Converts GPG key into binary format.

### Purpose

APT repository trust verification.

---

# `sudo tee`

Writes output into protected system files.

### Purpose

Allows writing config files using pipes.

---

# `sudo apt install -y kubelet kubeadm kubectl`

Installs Kubernetes components.

---

# `kubelet`

Node agent running on every Kubernetes node.

### Purpose

Communicates with Kubernetes control plane.

### Responsibilities

- Starts pods
- Monitors containers
- Reports node health

---

# `kubeadm`

Cluster bootstrap tool.

### Purpose

Creates Kubernetes clusters.

### Responsibilities

- Initializes control plane
- Generates certificates
- Creates join tokens

---

# `kubectl`

Kubernetes command-line tool.

### Purpose

Administers Kubernetes cluster.

### Examples

```
kubectl get nodeskubectl get podskubectl apply -f file.yaml
```

---

# `sudo apt-mark hold`

Locks package versions.

### Purpose

Prevents accidental upgrades.

---

# `sudo kubeadm init`

Initializes Kubernetes control plane.

### What it creates

- API server
- etcd
- scheduler
- controller manager
- certificates

---

# `mkdir -p $HOME/.kube`

Creates kubectl configuration folder.

### Purpose

Stores Kubernetes admin configuration.

---

# `sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config`

Copies cluster admin configuration.

### Purpose

Allows kubectl to communicate with cluster.

---

# `kubectl apply -f`

Applies Kubernetes manifest file.

### Purpose

Creates or updates Kubernetes resources.

### Example

```
kubectl apply -f calico.yaml
```

---

# Calico

Calico

### Purpose

Provides Kubernetes pod networking.

### Features

- Pod communication
- Network policies
- Routing

---

# `kubeadm token create --print-join-command`

Generates worker join command.

### Purpose

Allows worker nodes to join cluster securely.

---

# `sudo kubeadm join`

Joins worker node to cluster.

### Purpose

Registers node with control plane.

---

# `kubectl get nodes`

Displays cluster nodes.

### Purpose

Verifies cluster health.

### Example Output

```
control-plane Readyworker1       Readyworker2       Ready
```
![[Pasted image 20260509145331.png]]

![[Pasted image 20260509145449.png]]

![[Pasted image 20260509145713.png]]


# 🧠 Control Plane Components

|Component|Purpose|
|---|---|
|API Server|Main Kubernetes interface|
|etcd|Cluster database|
|Scheduler|Assigns pods to nodes|
|Controller Manager|Maintains desired state|
|kubelet|Node agent|
|kube-proxy|Service networking|

---

# 🏆 What You Accomplished

You built:

- Real Kubernetes cluster
- 1 control plane
- 2 worker nodes
- containerd runtime
- Calico networking
- kubectl administration
- kubeadm deployment