# 📅 DAY 5 — Kubernetes Services + Networking

# 🎯 Goal

Today you move from:

- “pods exist”

to:

- “applications communicate”

This is one of the MOST important Kubernetes topics because real applications require:

- networking
- service discovery
- internal communication
- external access

Without Services:

- pods are temporary
- pod IPs constantly change
- applications break

Services solve this.

---

# 🧠 BIG PICTURE

Kubernetes networking works like this:

```
Internet   ↓NodePort / LoadBalancer   ↓Service   ↓Pods
```

OR internally:

```
Pod → Service → Pod
```

---

# 🏗️ Kubernetes Networking Components

|Component|Purpose|
|---|---|
|Pod IP|IP assigned to pod|
|Service|Stable endpoint|
|ClusterIP|Internal-only service|
|NodePort|External access|
|kube-proxy|Routes traffic|
|CoreDNS|Internal DNS|
|Labels|Match pods|
|Selectors|Find pods|

---

# 🚨 IMPORTANT CONCEPT

Pods are TEMPORARY.

If a pod dies:

- new IP
- new container
- old IP disappears

Applications cannot rely on pod IPs.

That is why Services exist.

---

# STEP 1 — Check Current Deployment

On master node:

```
kubectl get deployments
```

Expected:

```
NAME   READY   UP-TO-DATE   AVAILABLEweb    5/5
```

---

# STEP 2 — Check Pods

```
kubectl get pods -o wide
```

Look for:

- pod IPs
- worker node placement

Example:

```
NAME                   IP            NODEweb-xxxxx              10.244.1.3   worker1web-yyyyy              10.244.2.4   worker2
```

Notice:

- every pod has unique IP
- pods spread across nodes

---

# STEP 3 — Create ClusterIP Service

## What is ClusterIP?

Default Kubernetes service type.

Internal-only networking.

Used for:

- databases
- APIs
- microservices
- backend communication

Pods inside cluster can access it.

Outside users cannot.

---

# Create Service

```
kubectl expose deployment web --port=80 --target-port=80 --type=ClusterIP
```

---

# Check Service

```
kubectl get svc
```

Expected:

```
NAME         TYPE        CLUSTER-IPweb          ClusterIP   10.x.x.x
```

---

# IMPORTANT

The ClusterIP is:

- virtual
- stable
- permanent

Even if pods restart.

---

# STEP 4 — Test Internal Networking

Launch temporary test pod:

```
kubectl run testpod --image=busybox -it --rm -- sh
```

Inside pod:

```
wget -qO- http://web
```

OR:

```
nslookup web
```

You should see:

- nginx HTML
- DNS resolution

---

# 🧠 HUGE CONCEPT

This works because of:

- CoreDNS
- Kubernetes DNS
- Service discovery

Pods communicate using:

- service names  
    NOT:
- IP addresses

This is enterprise microservice architecture.

---

# STEP 5 — Create NodePort Service

# What is NodePort?

Exposes application externally.

Opens port on EVERY node.

Traffic flow:

```
Browser   ↓WorkerNodeIP:NodePort   ↓Service   ↓Pods
```

---

# Create NodePort

```
kubectl expose deployment web-nodeport --image=nginx
```

Actually use THIS instead:

```
kubectl expose deployment web --port=80 --type=NodePort
```

---

# Check Service

```
kubectl get svc
```

Example:

```
web   NodePort   10.96.12.50   <none>   80:31234/TCP
```

Critical part:

```
31234
```

This is external port.

---

# STEP 6 — Test From Browser

Open:

```
http://WORKER_PUBLIC_IP:31234
```

Example:

```
http://3.15.197.4:31234
```

You should see:

- nginx welcome page

---

# 🚨 SECURITY GROUP REMINDER

AWS security group must allow:

```
30000-32767
```

TCP inbound.

Otherwise NodePort fails.

---

# STEP 7 — Understand kube-proxy

# What is kube-proxy?

kube-proxy:

- runs on every node
- manages networking rules
- forwards traffic to pods

It creates:

- iptables rules  
    OR
- IPVS rules

Think of it like:

- Kubernetes traffic router

---

# View kube-proxy

```
kubectl get pods -n kube-system
```

Look for:

```
kube-proxy
```

On every node.

---

# STEP 8 — Understand DNS

CoreDNS handles:

```
web.default.svc.cluster.local
```

But Kubernetes allows short names:

```
web
```

This is critical for:

- microservices
- APIs
- databases

---

# STEP 9 — Troubleshooting (VERY IMPORTANT)

# Break Labels Intentionally

View labels:

```
kubectl get pods --show-labels
```

---

# View Service

```
kubectl describe svc web
```

Look for:

```
Selector:
```

Example:

```
app=web
```

---

# BREAK IT

Change pod label:

```
kubectl label pod web-7c8ccc96c8-s5vw2 app=broken --overwrite
```

---

# Result

Now:

```
kubectl get endpoints
```

May show:

```
web   <none>
```

This means:

- service cannot find pods
- selector mismatch

VERY common real-world issue.

---

# FIX IT

Restore label:

```
kubectl label pod web-7c8ccc96c8-s5vw2 app=web --overwrite
```

Then:

```
kubectl get endpoints
```

Endpoints return.

---

# 🧠 MOST IMPORTANT LESSON TODAY

Services do NOT connect to pods directly.

They connect using:

```
labels + selectors
```

This is one of the MOST important Kubernetes concepts.

---

# REAL ENTERPRISE USE

|Service Type|Real Use|
|---|---|
|ClusterIP|Internal APIs|
|NodePort|Testing|
|LoadBalancer|Production|
|Ingress|Enterprise routing|

---

# 🔥 Architecture Today

```
User ↓NodePort ↓Service ↓Pods ↓Containers
```

---

# 📚 Commands You Learned Today

## Services

```
kubectl get svckubectl describe svc webkubectl expose deployment web --port=80 --type=NodePort
```

---

# Networking

```
kubectl get endpoints 
kubectl get pods -o wide
```

---

# DNS Testing

```
nslookup webwget -qO- http://web
```

---

# Troubleshooting

```
kubectl get endpoints 
kubectl describe svc web 
kubectl get pods --show-labels
```





                         🌐 USER / BROWSER
                                   |
                                   |
                    http://3.151.106.241:30195
                                   |
                                   v

+------------------------------------------------------+
|                 AWS EC2 Worker Node                  |
|                  (k8s-worker1)                       |
|                                                      |
|   +----------------------------------------------+   |
|   |             kube-proxy                       |   |
|   |      Routes traffic to pods                  |   |
|   +----------------------------------------------+   |
|                                                      |
|                NodePort : 30195                     |
+------------------------------------------------------+
                                   |
                                   |
                                   v

+------------------------------------------------------+
|            Kubernetes Service : web                  |
|------------------------------------------------------|
| Type: NodePort                                       |
| ClusterIP: 10.99.185.178                             |
| Selector: app=web                                    |
| Port: 80                                             |
+------------------------------------------------------+
                                   |
                    Label Selector: app=web
                                   |
         -------------------------------------------------
         |                     |                        |
         v                     v                        v

+----------------+   +----------------+   +----------------+
|   nginx Pod    |   |   nginx Pod    |   |   nginx Pod    |
| app=web        |   | app=web        |   | app=web        |
| 192.168.x.x    |   | 192.168.x.x    |   | 192.168.x.x    |
+----------------+   +----------------+   +----------------+

         -------------------------------------------------
         |                                               |
         v                                               v

+----------------+                         +----------------+
|   nginx Pod    |                         |   nginx Pod    |
| app=web        |                         | app=web        |
| 192.168.x.x    |                         | 192.168.x.x    |
+----------------+                         +----------------+


==========================================================
                INTERNAL KUBERNETES NETWORKING
==========================================================

+------------------------------------------------------+
|                     CoreDNS                          |
|------------------------------------------------------|
| Resolves:                                            |
| web.default.svc.cluster.local                        |
| web                                                  |
+------------------------------------------------------+

+------------------------------------------------------+
|                    kube-proxy                        |
|------------------------------------------------------|
| Runs on every node                                   |
| Creates iptables/IPVS routing rules                  |
| Routes Service traffic to Pods                       |
+------------------------------------------------------+



![[Pasted image 20260520181119.png]]

