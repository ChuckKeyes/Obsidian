
# Step 1 — Open Obsidian

Read:

- lab instructions
- notes
- copied YAML
- troubleshooting notes

---

# Step 2 — Open VS Code

Use:

- Remote SSH extension
- Connect directly into AWS EC2

Example:

```
master-nodeworker1worker2
```

---

# Step 3 — Use Bash Terminal INSIDE EC2

VERY IMPORTANT:

You are NOT using:

- Windows Docker
- Windows Kubernetes
- Minikube on laptop

You are using:

- AWS EC2 Ubuntu
- Docker on EC2
- Kubernetes on EC2

This avoids your laptop Docker problems entirely.

---

# 🔥 BEST AWS SETUP FOR YOU

# Recommended

|Node|Name|
|---|---|
|Control Plane|k8s-master|
|Worker|k8s-worker1|
|Worker|k8s-worker2|

Ubuntu 22.04 LTS

---

# 🧠 YOUR LEARNING METHOD

You should build your Obsidian notes like this:

# Example Daily Note

```
# Day 3 — Pods & YAML## Commands Learnedkubectl get podskubectl describe pod nginxkubectl logs nginx---## YAML LearnedapiVersionkindmetadataspec---## Problems I Hit### Pod stuck PendingCause:No resourcesFix:kubectl describe pod---## Fast Commandskubectl get pods -Akubectl get eventskubectl logs
```

This becomes your:

- study guide
- troubleshooting guide
- final review notes

---

# ⚠️ MOST IMPORTANT CKA RULE

You MUST stop depending on copy/paste.

By Day 5:

- type commands manually
- type YAML manually
- memorize kubectl structure

---

# 🧪 YOUR DAILY "BREAK IT" REQUIREMENT

EVERY DAY:  
Break something intentionally.

Examples:

- wrong image
- wrong selector
- bad YAML indent
- wrong port
- bad PVC
- stopped kubelet
- deleted pod

Then FIX IT.

This is CRITICAL for CKA success.

---

# 🔥 YOUR MOST IMPORTANT SKILLS

# 1. kubectl speed

You should eventually type:

```
kubectl get po -A
```

instead of:

```
kubectl get pods --all-namespaces
```

---

# 2. YAML speed

You should learn:

```
apiVersion:kind:metadata:spec:
```

from memory.

---

# 3. Troubleshooting flow

Always:

```
kubectl getkubectl describekubectl logskubectl exec
```

in that order.

---

# 📚 HOW TO USE THE PDF

Your PDF is VERY valuable because it already contains:

- lab flow
- YAML examples
- cluster admin tasks
- troubleshooting ideas
- exam domains

You should:

- do the lab
- repeat it
- summarize it in Obsidian
- make your own faster version

---

# 🏆 YOUR ADVANTAGE

Most people learning Kubernetes:

- do not know networking
- do not know Linux
- do not know cloud
- do not know infrastructure

You already know:

- AWS
- GCP
- Terraform
- VPNs
- routing
- Bash
- cloud architecture

That is a HUGE advantage for CKA.

---

# 🚀 AFTER THE 10 DAYS

Then you move to:

## Phase 2

### Timed Labs

Example:

- Create deployment in 3 minutes
- Fix broken service in 5 minutes
- Restore etcd in 10 minutes

---

## Phase 3

### Killer.sh

Closest thing to real exam.

---

# 🧠 Final Advice

DO NOT:

- spend days watching videos
- over-focus on theory
- memorize definitions only

DO:

- build
- break
- fix
- repeat
- use terminal constantly

That is the real path to passing the CKA.