
# 📅 DAY 9 — Docker Build VM + Kubernetes Website Pods

# Goal

Create a separate **Docker VM** used only for building website containers.  
Then copy the finished container images to the Kubernetes nodes and run them as pods.

---

# Big Picture

```text
Windows / WSL website files
        ↓
Docker Build VM
        ↓
Build Docker images
        ↓
Save images as .tar files
        ↓
Copy .tar files to Kubernetes nodes
        ↓
Import images into containerd
        ↓
Run pods in Kubernetes
```

---

# Part 1 — Create / SSH Into Docker VM

SSH into the new Docker VM:

```bash
ssh -i ~/.ssh/id_rsa ubuntu@DOCKER_VM_PUBLIC_IP
```

Update VM:

```bash
sudo apt update
sudo apt upgrade -y
```

---

# Part 2 — Install Docker on Docker VM

```bash
sudo apt install -y docker.io
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker $USER
```

Log out and SSH back in.

Test:

```bash
docker --version
docker ps
```

---

# Part 3 — Copy All Website Files to Docker VM

From Windows Git Bash / WSL:

```bash
scp -r "/d/New Obsidian/cloud_foundations/Capstone-Projecti-Lab2/Chuck/Lab2" ubuntu@DOCKER_VM_PUBLIC_IP:/home/ubuntu/websites
```

On Docker VM:

```bash
cd /home/ubuntu/websites
ls -al
```

You should see:

```text
index.html
white.html
wheat.html
corn.html
corn-bread/
wheat-bread/
white-bread/
```

---

# Part 4 — Build One Container for All Bread Websites

Inside `/home/ubuntu/websites`:

```bash
nano Dockerfile
```

Add:

```dockerfile
FROM nginx:latest
COPY . /usr/share/nginx/html
EXPOSE 80
```

Build image:

```bash
docker build -t bread-website:v1 .
docker images
```

Test on Docker VM:

```bash
docker run -d -p 8080:80 --name bread-test bread-website:v1
curl http://localhost:8080
docker stop bread-test
docker rm bread-test
```

---

# Part 5 — Save Docker Image

On Docker VM:

```bash
docker save bread-website:v1 -o bread-website.tar
ls -lh bread-website.tar
```

---

# Part 6 — Copy Image to Kubernetes Nodes

From Docker VM:

```bash
scp bread-website.tar ubuntu@K8S_MASTER_PUBLIC_IP:/home/ubuntu/
scp bread-website.tar ubuntu@WORKER1_PUBLIC_IP:/home/ubuntu/
scp bread-website.tar ubuntu@WORKER2_PUBLIC_IP:/home/ubuntu/
```

---

# Part 7 — Import Image on Kubernetes Nodes

On **k8s-master**, **worker1**, and **worker2**:

```bash
sudo ctr -n k8s.io images import /home/ubuntu/bread-website.tar
sudo ctr -n k8s.io images list | grep bread
```

---

# Part 8 — Create Kubernetes Deployment

On **k8s-master**:

```bash
nano bread-deployment.yaml
```

Add:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: bread-website
spec:
  replicas: 3
  selector:
    matchLabels:
      app: bread
  template:
    metadata:
      labels:
        app: bread
    spec:
      containers:
      - name: bread
        image: bread-website:v1
        imagePullPolicy: Never
        ports:
        - containerPort: 80
```

Apply:

```bash
kubectl apply -f bread-deployment.yaml
kubectl get pods -o wide
```

---

# Part 9 — Create NodePort Service

```bash
nano bread-service.yaml
```

Add:

```yaml
apiVersion: v1
kind: Service
metadata:
  name: bread-service
spec:
  type: NodePort
  selector:
    app: bread
  ports:
  - port: 80
    targetPort: 80
    nodePort: 30090
```

Apply:

```bash
kubectl apply -f bread-service.yaml
kubectl get svc
```

Test:

```bash
curl http://K8S_MASTER_PUBLIC_IP:30090
```

Browser:

```text
http://K8S_MASTER_PUBLIC_IP:30090
```

---

# Troubleshooting Practice

## Check Pods

```bash
kubectl get pods -o wide
kubectl describe pod POD_NAME
```

## Check Service

```bash
kubectl get svc
kubectl describe svc bread-service
```

## Bad Image Test

```bash
kubectl edit deployment bread-website
```

Change image to:

```yaml
image: bread-website:bad
```

Check error:

```bash
kubectl get pods
kubectl describe pod POD_NAME
```

Fix image back:

```yaml
image: bread-website:v1
```

---

# Important Lesson

```text
Docker VM = builds containers
Kubernetes master = controls the cluster
Worker nodes = run the pods
containerd = runtime used by Kubernetes
Docker image .tar = package moved from Docker VM to K8s nodes
```

---

# Day 9 Final Goal

By the end of Day 9:

```text
Docker is installed on a separate Docker VM
Website files are copied to Docker VM
Docker image is built
Image is saved as bread-website.tar
Image is copied to all Kubernetes nodes
Image is imported into containerd
Kubernetes runs the website as pods
NodePort exposes the website
```