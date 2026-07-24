
# ✅ STEP 4 — See Distribution Across Nodes

```
kubectl get pods -o wide
```

You should see pods spread across workers.

---

# 🧠 IMPORTANT CONCEPT

Kubernetes scheduler decides:

```
Which node runs each pod
```

based on:

- resources
- constraints
- scheduling rules

---

# ✅ STEP 5 — Delete a Pod (Self-Healing)

Delete ONE pod:

```
kubectl delete pod POD_NAME
```

Immediately watch:

```
kubectl get pods -w
```

Kubernetes recreates it automatically.

---

# 🧠 IMPORTANT CONCEPT

You are NOT managing pods directly.

You are managing:

```
desired state
```

Deployment says:

```
I want 5 pods always running
```

---

# ✅ STEP 6 — Expose Deployment

```
kubectl expose deployment web --type=NodePort --port=80
```

Check service:

```
kubectl get svc
```

Test:

```
http://WORKER_IP:NODEPORT
```

---

# ✅ STEP 7 — Rolling Update

Update image version:

```
kubectl set image deployment/web nginx=nginx:1.27
```

Watch rollout:

```
kubectl rollout status deployment web
```

---

# 🧠 IMPORTANT CONCEPT

Rolling update means:

```
replace old pods gradually WITHOUT downtime
```

Very important enterprise feature.

---

# ✅ STEP 8 — View Rollout History

```
kubectl rollout history deployment web
```

---

# ✅ STEP 9 — BREAK THE DEPLOYMENT

Deploy fake image:

```
kubectl set image deployment/web nginx=nginx:fake
```

Now check:

```
kubectl get pods
kubectl describe pod POD_NAME
```

You should see:

```
ImagePullBackOffErrImagePull
```

---

# 🧠 IMPORTANT TROUBLESHOOTING

This simulates:

- typo
- bad image
- failed deployment

Very common real-world issue.

---

# ✅ STEP 10 — Rollback

Fix instantly:

```
kubectl rollout undo deployment web
```

Verify:

```
kubectl rollout status deployment web
kubectl get pods
```

---

# 🎯 What You Learned Today

## Deployments

Manage applications declaratively.

---

## ReplicaSets

Maintain replica count.

---

## Scaling

Increase/decrease pod count dynamically.

---

## Rolling Updates

Deploy new versions safely.

---

## Rollbacks

Recover from bad deployments quickly.

---

# 🔥 VERY Important Enterprise Concept

Kubernetes treats applications like:

```
continuously maintained desired state
```

NOT manually managed servers.

---

# 📌 DAY 4 Success Checklist

You should now be able to:

✅ Create deployments  
✅ Scale applications  
✅ Delete pods safely  
✅ Understand ReplicaSets  
✅ Perform rolling updates  
✅ Roll back failed deployments  
✅ Troubleshoot failed images  
✅ Use kubectl confidently

managing cloud data on kubernetes