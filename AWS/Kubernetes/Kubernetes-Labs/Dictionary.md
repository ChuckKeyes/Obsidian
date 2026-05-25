
# 📘 Kubernetes Commands — Day 1 to Day 4

# 📅 DAY 1 — Cluster Basics

|Command|Purpose|
|---|---|
|`kubectl get nodes`|Show all Kubernetes nodes in the cluster|
|`kubectl get pods`|List pods in current namespace|
|`kubectl get pods -A`|Show pods in ALL namespaces|
|`kubectl cluster-info`|Show cluster control-plane information|
|`kubectl version`|Show kubectl + cluster Kubernetes versions|
|`kubectl describe node NODE_NAME`|Detailed information about a node|
|`kubectl describe pod POD_NAME`|Detailed information about a pod|
|`kubectl logs POD_NAME`|Show logs from a pod/container|
|`kubectl get events`|Show cluster events|
|`kubectl get events --sort-by=.metadata.creationTimestamp`|Sort events by time|

---

# 📅 DAY 2 — Pods + YAML

|Command|Purpose|
|---|---|
|`kubectl run nginx-pod --image=nginx`|Create a simple pod|
|`kubectl get pods -o wide`|Show pod details including node/IP|
|`kubectl exec -it POD_NAME -- bash`|Open shell inside pod|
|`kubectl delete pod POD_NAME`|Delete a pod|
|`kubectl apply -f app.yaml`|Create/update resources from YAML|
|`kubectl get pod POD_NAME -o yaml`|Output pod configuration as YAML|
|`kubectl explain pod`|Show documentation for pod resource|
|`kubectl edit pod POD_NAME`|Edit running pod configuration|

---

# 📅 DAY 3 — Services + Networking

|Command|Purpose|
|---|---|
|`kubectl expose pod nginx-pod --type=NodePort --port=80`|Expose pod externally|
|`kubectl expose deployment nginx --type=NodePort --port=80`|Expose deployment externally|
|`kubectl get svc`|Show services|
|`kubectl describe svc SERVICE_NAME`|Detailed service information|
|`kubectl port-forward pod/POD_NAME 8080:80`|Forward local port to pod|
|`kubectl get endpoints`|Show service endpoints|
|`kubectl get namespaces`|Show namespaces|
|`kubectl get all`|Show most resources in namespace|

---

# 📅 DAY 4 — Deployments + Scaling

|Command|Purpose|
|---|---|
|`kubectl create deployment web --image=nginx`|Create deployment|
|`kubectl get deployment`|Show deployments|
|`kubectl describe deployment web`|Detailed deployment info|
|`kubectl scale deployment web --replicas=5`|Scale deployment|
|`kubectl get pods -w`|Watch pod changes live|
|`kubectl delete pod POD_NAME`|Test self-healing|
|`kubectl set image deployment/web nginx=nginx:1.27`|Update deployment image|
|`kubectl rollout status deployment web`|Watch rollout progress|
|`kubectl rollout history deployment web`|Show rollout revisions|
|`kubectl set image deployment/web nginx=nginx:fake`|Simulate failed deployment|
|`kubectl rollout undo deployment web`|Rollback deployment|

---

# 🔥 Important kubectl Flags

|Flag|Meaning|
|---|---|
|`-A`|All namespaces|
|`-o wide`|Extra details|
|`-o yaml`|Output YAML|
|`-w`|Watch continuously|
|`-it`|Interactive terminal|
|`-f`|File input|

---

# 🧠 Most Important Concepts Learned

|Concept|Meaning|
|---|---|
|Pod|Smallest deployable unit|
|Deployment|Manages pods automatically|
|ReplicaSet|Maintains replica count|
|Service|Stable network access|
|NodePort|External access to app|
|Rollout|Deployment update process|
|Rollback|Restore previous version|
|Desired State|Kubernetes maintains target configuration|

---

# 🔥 Most Important Commands To Master

If preparing for certification:

```
kubectl getkubectl describekubectl logskubectl applykubectl deletekubectl execkubectl exposekubectl scalekubectl rollout
```

These are core daily Kubernetes commands.

[Persistent Volumes | Kubernetes](https://kubernetes.io/docs/concepts/storage/persistent-volumes/)
