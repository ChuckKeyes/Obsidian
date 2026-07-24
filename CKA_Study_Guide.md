# Certified Kubernetes Administrator (CKA) Study Guide

## Charles Keyes Sr.

> [!info]
> Personal study guide for a self-managed kubeadm Kubernetes cluster on AWS.

---

# Table of Contents

- [Introduction](#introduction)
- [Official Kubernetes Resources](#official-kubernetes-resources)
- [Pods](#pods)
- [Containers](#containers)
- [Volumes](#volumes)
- [RBAC](#rbac)
- [Labels, Selectors, Taints & Tolerations](#labels-selectors-taints--tolerations)
- [etcd Snapshots](#etcd-snapshots)
- [Control Plane & kubelet Debugging](#control-plane--kubelet-debugging)
- [50 Commands to Memorize](#50-commands-to-memorize)

---

# Introduction

This guide is designed for studying the CKA exam while practicing on an AWS kubeadm cluster.

---

# Official Kubernetes Resources

- https://kubernetes.io/docs/
- https://kubernetes.io/docs/concepts/
- https://kubernetes.io/docs/tasks/
- https://kubernetes.io/docs/reference/kubectl/cheatsheet/
- https://kubernetes.io/docs/reference/access-authn-authz/rbac/
- https://kubernetes.io/docs/concepts/storage/
- https://kubernetes.io/docs/concepts/workloads/pods/
- https://kubernetes.io/docs/concepts/containers/
- https://kubernetes.io/docs/concepts/scheduling-eviction/taint-and-toleration/
- https://kubernetes.io/docs/tasks/debug/
- https://kubernetes.io/docs/tasks/administer-cluster/configure-upgrade-etcd/
- https://github.com/kubernetes/kubernetes

---

# Pods

> [!IMPORTANT]
> CKA Weight: ⭐⭐⭐⭐⭐

```bash
kubectl run nginx --image=nginx
kubectl get pods
kubectl get pods -o wide
kubectl describe pod nginx
kubectl logs nginx
kubectl exec -it nginx -- sh
kubectl delete pod nginx
```

## Practice

- [ ] Create a Pod
- [ ] Generate YAML
- [ ] Exec into Pod
- [ ] View logs

---

# Containers

> [!IMPORTANT]
> CKA Weight: ⭐⭐⭐⭐⭐

```bash
kubectl logs POD
kubectl exec -it POD -- sh
kubectl describe pod POD
```

Know init containers, probes, image tags, resource limits, and multi-container Pods.

---

# Volumes

```bash
kubectl get pv
kubectl get pvc
kubectl describe pvc
kubectl get storageclass
```

Practice PV, PVC, emptyDir, hostPath, ConfigMap, Secret volumes.

---

# RBAC

```bash
kubectl create serviceaccount developer
kubectl get roles
kubectl get rolebindings
kubectl auth can-i get pods
```

Practice ServiceAccounts, Roles, RoleBindings, ClusterRoles, ClusterRoleBindings.

---

# Labels, Selectors, Taints & Tolerations

```bash
kubectl label node k8s-worker1 disk=ssd
kubectl taint nodes k8s-worker1 dedicated=db:NoSchedule
kubectl describe node k8s-worker1
```

---

# etcd Snapshots

```bash
sudo ETCDCTL_API=3 etcdctl snapshot save backup.db
sudo ETCDCTL_API=3 etcdctl snapshot status backup.db -w table
```

---

# Control Plane & kubelet Debugging

```bash
kubectl get nodes
kubectl get pods -A
kubectl get events
kubectl describe pod POD
sudo systemctl status kubelet
sudo journalctl -u kubelet -f
sudo systemctl status containerd
```

---

# 50 Commands to Memorize

```bash
kubectl get nodes
kubectl get pods -A
kubectl get svc
kubectl get deploy
kubectl describe pod
kubectl logs
kubectl exec -it
kubectl apply -f
kubectl delete
kubectl edit
kubectl rollout status
kubectl rollout restart
kubectl auth can-i
kubectl get pv
kubectl get pvc
kubectl get storageclass
kubectl get events
kubectl cluster-info
```
## In the future.................................

- ✅ Clickable Table of Contents
- ✅ Internal Markdown links
- ✅ Official Kubernetes.io links for every chapter
- ✅ Kubernetes GitHub project links
- ✅ Proper Bash and YAML code blocks
- ✅ Draw.io diagrams for every major topic
- ✅ CKA exam objectives and weighting
- ✅ Hands-on labs using **your AWS kubeadm cluster**
- ✅ Troubleshooting flowcharts
- ✅ "Common mistakes" callout boxes
- ✅ "CKA Tip" callout boxes
- ✅ Review questions at the end of each chapter
- ✅ Command cheat sheets
- ✅ YAML reference section
- ✅ One comprehensive Markdown file that works well in Obsidian