
# Part 1 — Copy Portfolio Website

From Windows:


scp -r "D:\New Obsidian\New Obsidian\AWS\Kubernetes\Portfolio" \
ubuntu@54.167.24.183:/home/ubuntu/portfolio

## Verify

cd /home/ubuntu/portfolio
ls -al

## Part 2 — Dockerfile

FROM nginx:latest

COPY . /usr/share/nginx/html

EXPOSE 80

## Part 3 — Build Image

docker build -t portfolio-website:v1 .

## Verify

docker images

## Part 4 — Test Container

docker run -d \
-p 8081:80 \
--name portfolio-test \
portfolio-website:v1

## Test

curl localhost:8081

## Browser:

http://DOCKER_VM_PUBLIC_IP:8081

## Cleanup

docker stop portfolio-test

docker rm portfolio-test

## Part 5 — Save Image

docker save \
portfolio-website:v1 \
-o portfolio-website.tar

## Part 6 — Copy Image to Kubernetes

scp portfolio-website.tar ubuntu@K8S_MASTER_PUBLIC_IP:/home/ubuntu/

scp portfolio-website.tar ubuntu@WORKER1_PUBLIC_IP:/home/ubuntu/

scp portfolio-website.tar ubuntu@WORKER2_PUBLIC_IP:/home/ubuntu/

# Part 7 — Import into containerd

Run on **all three nodes**:

sudo ctr -n k8s.io images import \
/home/ubuntu/portfolio-website.tar

## Verify

sudo ctr -n k8s.io images list | grep portfolio

# Part 8 — Deployment

`portfolio-deployment.yaml`

apiVersion: apps/v1
kind: Deployment

metadata:
  name: portfolio-website

spec:
  replicas: 3

  selector:
    matchLabels:
      app: portfolio

  template:
    metadata:
      labels:
        app: portfolio

    spec:
      containers:
      - name: portfolio

        image: portfolio-website:v1

        imagePullPolicy: Never

        ports:
        - containerPort: 80

## Deploy

kubectl apply -f portfolio-deployment.yaml

## Verify

kubectl get pods -o wide

# Part 9 — Service

`portfolio-service.yaml`

apiVersion: v1
kind: Service

metadata:
  name: portfolio-service

spec:
  type: NodePort

  selector:
    app: portfolio

  ports:
  - port: 80

    targetPort: 80

    nodePort: 30091

## Apply

kubectl apply -f portfolio-service.yaml

## Check

kubectl get svc

## Browser:

http://MASTER_PUBLIC_IP:30091

# Part 10 — Rolling Update

Modify the website:

<h1>Version 2</h1>
## Rebuild

docker build -t portfolio-website:v2 .

## Save

docker save portfolio-website:v2 \
-o portfolio-v2.tar

### Copy to nodes.
### Import into containerd.
### Update deployment:

kubectl set image deployment/portfolio-website \
portfolio=portfolio-website:v2

## Watch

kubectl rollout status deployment/portfolio-website

## Rollback


kubectl rollout undo deployment/portfolio-website

# Troubleshooting

kubectl describe pod POD_NAME

kubectl logs POD_NAME

kubectl describe svc portfolio-service

kubectl get events

# 🏁 Day 10 Final Goal

By the end of Day 10, you will have completed a realistic end-to-end deployment workflow:

Portfolio Website
        │
        ▼
Docker Build VM
        │
Build Docker Image
        │
Test Container
        │
Save Image (.tar)
        │
Copy to Kubernetes Nodes
        │
Import into containerd
        │
Deployment
        │
Service
        │
Portfolio Website running in 3 Pods
        │
Rolling Update to Version 2
        │
Rollback to Version 1