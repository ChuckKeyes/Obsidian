

### 1. Official Kubernetes kubeadm documentation ⭐⭐⭐⭐⭐

This is the reference you'll use throughout your CKA preparation.

- [Creating a cluster with kubeadm](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/?utm_source=chatgpt.com)
- [kubeadm documentation](https://kubernetes.io/docs/reference/setup-tools/kubeadm/?utm_source=chatgpt.com)

These cover:

- `kubeadm init`
- `kubeadm join`
- Upgrades
- Certificates
- Tokens
- Cluster reset
- High Availability concepts

---

### 2. Killercoda ⭐⭐⭐⭐⭐ (Free)

- [Killercoda Kubernetes Labs](https://killercoda.com/about?utm_source=chatgpt.com)

It provides:

- Browser-based Linux terminals
- Real Kubernetes clusters
- kubeadm-based playgrounds
- CKA practice scenarios
- No installation required

Many recent CKA pass reports recommend spending a lot of practice time there because the workflow is very similar to the exam environment.

---

### 3. Your own AWS kubeadm cluster ⭐⭐⭐⭐⭐

This is where I'd spend most of your time.

Practice rebuilding it from scratch:

```
Master
│
├── kubeadm init
├── Calico
├── kubectl
└── etcd

Worker 1
└── kubeadm join

Worker 2
└── kubeadm join
```

Then intentionally break it and repair it.

---

### 4. Things to practice repeatedly

Since you already have the cluster, practice these until you can do them without notes:

- Build a cluster with `kubeadm`
- Join worker nodes
- Install Calico (or another CNI)
- Create Deployments
- Create Services
- Create Ingress
- PersistentVolumes and PVCs
- ConfigMaps
- Secrets
- RBAC
- NetworkPolicies
- Upgrade the cluster
- Drain and uncordon nodes
- etcd backup and restore
- Certificate renewal
- Troubleshoot CoreDNS
- Troubleshoot kubelet
- Debug image pull failures
- Scale workloads
- Rolling updates

---

## For you specifically

Based on the work you've described over the past few months, you already have:

- ✅ Terraform
- ✅ AWS networking
- ✅ Docker
- ✅ A 3-node kubeadm cluster
- ✅ Bread website
- ✅ DNS
- ✅ GitHub
- ✅ Linux
- ✅ Bash

The next step is to **convert your Bread website into a complete CKA project**:

```
Terraform
    ↓
AWS EC2
    ↓
kubeadm Cluster
    ↓
Containerd
    ↓
Bread Website Container
    ↓
Deployment
    ↓
Service
    ↓
Ingress
    ↓
Persistent Volume
    ↓
ConfigMap
    ↓
Secret
    ↓
NetworkPolicy
```

That would cover a large portion of the hands-on skills expected for the CKA while also giving you a strong portfolio project that demonstrates Kubernetes administration rather than just cloud provisioning.