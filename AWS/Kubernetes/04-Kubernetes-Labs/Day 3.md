```
# Day 3 — Pods + YAML

## Goal

Run basic workloads on the Kubernetes cluster and learn how Pods, Deployments, Services, and YAML work.

---

## Tasks

Create test workloads:

- nginx
- busybox
- alpine

---

## 1. Create an NGINX Deployment

```bash
clear
kubectl create deployment nginx --image=nginx
kubectl scale deployment nginx --replicas=3
kubectl get pods -o wide
```

This proves the worker nodes can run real workloads.

---

## 2. Expose NGINX with NodePort

```
kubectl expose deployment nginx --type=NodePort --port=80
kubectl get svc
```

Then look for the NodePort, example:

```
nginx   NodePort   10.x.x.x   <none>   80:31234/TCP
```

Test from browser:

```
http://WORKER_PUBLIC_IP:31234
```

Example:

```
http://16.58.91.123:31234
```

---

## 3. Create a Single Pod

```
kubectl run nginx-pod --image=nginx
kubectl get pods -o wide
```

---

## 4. Export YAML

```
kubectl get pod nginx-pod -o yaml > nginx-pod.yaml
```

For Deployment YAML:

```
kubectl get deployment nginx -o yaml > nginx-deployment.yaml
```

---

## 5. Practice YAML

Create YAML manually for:

- Pod
- Labels
- Annotations
- Commands
- Environment variables

---

## 6. Troubleshooting Practice

Break something on purpose:

- wrong image name
- bad command
- typo in YAML

Fix with:

```
kubectl describe pod <nginx-pod>
kubectl logs <nginx-pod>
kubectl get events --sort-by=.metadata.creationTimestamp
```

---

## 7. Cleanup

```
kubectl delete deployment nginx
kubectl delete pod nginx-pod
kubectl delete svc nginx
```

```
Big fixes:```bash
kubectl expose deployment nginx --type=NodePort --port=80
kubectl get svc
```

should be two commands:

```
kubectl expose deployment nginx --type=NodePort --port=80
kubectl get svc
```

And this:

```
kubectl describe pod
kubectl logs
```

should be:

```
kubectl describe pod <pod-name>
kubectl logs <pod-name>
```

[[YAML-Kubernetes]]

