asd

Day 9
# 📅 DAY 9 — Cluster Troubleshooting + etcd + Docker Website Build

# Goal

Practice CKA-style troubleshooting while also learning how to build a website container on the Kubernetes master node.

---

## Part 1 — Install Docker on Master Node

On **k8s-master**:

```
sudo apt update
sudo apt install -y docker.io
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker $USER
```

Log out and back in, then test:

```
docker --versiondocker ps
```

---

## Part 2 — Copy Website Files to Master

From your Windows/Git Bash machine:

```
scp -r "D:/New Obsidian/cloud_foundations/Capstone-Projecti-Lab2/Chuck/Lab2" ubuntu@MASTER_PUBLIC_IP:/home/ubuntu/bread-site
```

Or from WSL:

```
scp -r "/d/New Obsidian/cloud_foundations/Capstone-Projecti-Lab2/Chuck/Lab2" ubuntu@MASTER_PUBLIC_IP:/home/ubuntu/bread-site
```

On master:

```
cd /home/ubuntu/bread-sitels -al
```

You should see files like:

```
index.html
white.html
wheat.html
corn.html
corn-bread/
wheat-bread/
white-bread/
```

---

## Part 3 — Create Dockerfile

Inside `/home/ubuntu/bread-site`:

```
nano Dockerfile
```

Add:

```
FROM nginx:latestCOPY . /usr/share/nginx/htmlEXPOSE 80
```

Build image:

```
docker build -t bread-website:v1 .docker images
```

Test locally on master:

```
docker run -d -p 8080:80 --name bread-test bread-website:v1curl http://localhost:8080docker stop bread-testdocker rm bread-test
```

---

## Part 4 — Use Docker Image in Kubernetes

Because this is a local image on the master, for a real cluster you need the image available to worker nodes too.

Lab option:

```
docker save bread-website:v1 -o bread-website.tarscp bread-website.tar ubuntu@WORKER1_PUBLIC_IP:/home/ubuntu/scp bread-website.tar ubuntu@WORKER2_PUBLIC_IP:/home/ubuntu/
```

On each worker:

```
sudo docker load -i bread-website.tar
```

If your workers use containerd only, use:

```
sudo ctr -n k8s.io images import bread-website.tar
```

---

## Part 5 — Kubernetes Deployment

Create file:

```
nano bread-deployment.yaml
```

Add:

```
apiVersion: apps/v1kind: Deploymentmetadata:  name: bread-websitespec:  replicas: 3  selector:    matchLabels:      app: bread  template:    metadata:      labels:        app: bread    spec:      containers:      - name: bread        image: bread-website:v1        imagePullPolicy: Never        ports:        - containerPort: 80
```

Apply:

```
kubectl apply -f bread-deployment.yaml
kubectl get pods -o wide
```

---

## Part 6 — NodePort Service

```
nano bread-service.yaml
```

Add:

```
apiVersion: v1kind: Servicemetadata:  name: bread-servicespec:  type: NodePort  selector:    app: bread  ports:  - port: 80    targetPort: 80    nodePort: 30090
```

Apply:

```
kubectl apply -f bread-service.yaml
kubectl get svc
```

Test:

```
curl http://MASTER_PUBLIC_IP:30090
```

Browser:

```
http://MASTER_PUBLIC_IP:30090
```

---

# Troubleshooting Practice

## Break kubelet

```
sudo systemctl stop kubelet
kubectl get nodes
```

Fix:

```
sudo systemctl start kubelet
kubectl get nodes
```

---

## Bad image name

Edit deployment:

```
kubectl edit deployment bread-website
```

Change image to:

```
image: bread-website:bad
```

Check:

```
kubectl get pods
kubectl describe pod POD_NAME
```

Fix image back:

```
image: bread-website:v1
```

---

## Bad YAML

Common errors:

```
kubectl apply -f bad.yaml
```

Look for:

```
error converting YAML to JSON
unknown field
missing selector
```

Fix spacing and fields.

---

## DNS Test

```
kubectl run dns-test --image=busybox:1.28 --rm -it -- nslookup kubernetes.default
```

---

## Network Test

```
kubectl get pods -o wide
kubectl describe svc bread-service

curl http://CLUSTER-IP
```

---

# etcd Backup

On master:

```
sudo ETCDCTL_API=3 etcdctl snapshot save backup.db
```

Check backup:

```
ls -lh backup.db
```

---

# Learn

Understand:

```
kubelet = node agent
etcd = cluster database
scheduler = chooses which node runs pod
controller manager = keeps desired state
API server = front door of Kubernetes
container runtime = runs containers
```

Day 9 now connects **Docker + website files + Kubernetes + troubleshooting + etcd**.