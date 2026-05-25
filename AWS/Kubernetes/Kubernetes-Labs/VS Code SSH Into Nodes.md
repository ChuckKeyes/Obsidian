
# 📅 Kubernetes Lab — VS Code SSH Into Nodes

Today you are going to use:

- Visual Studio Code
- SSH
- Kubernetes nodes
- Remote development workflow

This is VERY important because real Kubernetes/cloud engineers rarely work directly from terminal-only environments all day.

You’ll learn:

- remote SSH access
- remote file editing
- YAML editing
- log viewing
- multi-node management

Exactly how many real cloud engineers work.

---

# 🎯 Goal

Connect VS Code directly into:

- Kubernetes Master
- Worker 1
- Worker 2

Using:

- Remote SSH extension

---

# 🧰 What You Need

You already have:

- VS Code
- SSH keys
- AWS EC2 instances
- Kubernetes cluster

Need:

- Remote SSH extension

---

# STEP 1 — Install Remote SSH Extension

Open VS Code.

Go to:

```
Extensions
```

Search:

```
Remote - SSH
```

Install extension from:  
Microsoft

---

# STEP 2 — Test SSH in Bash FIRST

From Git Bash / terminal:

Master:

```
ssh -i ~/.ssh/id_rsa ubuntu@18.216.63.42
```

Worker1:

```
ssh -i ~/.ssh/id_rsa ubuntu@3.15.197.4
```

Worker2:

```
ssh -i ~/.ssh/id_rsa ubuntu@3.19.222.156
```

If these work:

- VS Code will work too.

---

# STEP 3 — Configure SSH Config File

On Windows:

Open:

```
C:\Users\chuck\.ssh\config
```

OR in Git Bash:

```
nano ~/.ssh/config
```

Add:

```
Host k8s-master    HostName 18.216.63.42    User ubuntu    IdentityFile ~/.ssh/id_rsaHost k8s-worker1    HostName 3.15.197.4    User ubuntu    IdentityFile ~/.ssh/id_rsaHost k8s-worker2    HostName 3.19.222.156    User ubuntu    IdentityFile ~/.ssh/id_rsa
```

Save file.

---

# STEP 4 — Connect from VS Code

In VS Code:

Press:

```
Ctrl + Shift + P
```

Type:

```
Remote-SSH: Connect to Host
```

Choose:

```
k8s-master
```

VS Code opens remote session.

---

# STEP 5 — Open Kubernetes Files

Inside remote VS Code:

You can now:

- edit YAML
- view logs
- manage kube configs
- use integrated terminal
- install Kubernetes extensions

---

# IMPORTANT FOLDERS

## Kubernetes Config

```
~/.kube/config
```

---

# Common Kubernetes Commands

## Check Nodes

```
kubectl get nodes -o wide
```

---

# Check Pods

```
kubectl get pods -A
```

---

# Describe Pod

```
kubectl describe pod nginx-pod
```

---

# Logs

```
kubectl logs nginx-pod
```

---

# YAML Output

```
kubectl get deployment web -o yaml
```

---

# STEP 6 — Install Kubernetes Extension in VS Code

Search extensions:

```
Kubernetes
```

Install from:  
Microsoft

This gives:

- cluster explorer
- YAML validation
- pod browsing
- logs
- deployments
- namespaces

VERY useful.

---

# Why This Matters Professionally

This is how many engineers work:

- VS Code
- SSH
- YAML
- GitHub
- Kubernetes extension
- Terraform extension

Not just raw terminal windows.

---

# Real Cloud Engineer Workflow

Typical setup:

```
Laptop   ↓VS Code   ↓SSH   ↓Kubernetes Master   ↓kubectl   ↓Cluster
```

---

# BIG Advantage

Now you can:

- edit YAML directly on nodes
- save Kubernetes manifests
- organize configs
- manage logs visually
- use split terminals
- work faster than plain SSH

---

# Recommended Folder Structure

On master node:

```
mkdir ~/k8s-labscd ~/k8s-labs
```

Create folders:

```
day1/day2/day3/deployments/services/yaml/
```

This becomes your Kubernetes workspace.

---

# Next Big Step After This

Once VS Code SSH works:

- YAML deployments
- Helm
- Ingress
- Prometheus
- Grafana
- CI/CD
- GitOps
- ArgoCD