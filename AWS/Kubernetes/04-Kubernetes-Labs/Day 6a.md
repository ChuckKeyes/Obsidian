
# Install Helm

```
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bashhelm version
```

---

# Add Ingress Repository

```
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginxhelm repo update
```

---

# Install NGINX Ingress Controller

```
helm install ingress-nginx ingress-nginx/ingress-nginx \  --namespace ingress-nginx \  --create-namespace
```

Verify:

```
kubectl get pods -n ingress-nginxkubectl get svc -n ingress-nginx
```

---

# Create Test Deployment

```
kubectl create deployment web --image=nginxkubectl expose deployment web --port=80
```

---

# Create Ingress YAML

```
apiVersion: networking.k8s.io/v1kind: Ingressmetadata:  name: web-ingressspec:  ingressClassName: nginx  rules:  - host: app1.local    http:      paths:      - path: /        pathType: Prefix        backend:          service:            name: web            port:              number: 80
```

Save:

```
nano ingress.yaml
```

Apply:

```
kubectl apply -f ingress.yaml
```

---

# Verify Ingress

```
kubectl get ingresskubectl describe ingress web-ingress
```

---

# OPTIONAL Local Hostname Test

On your laptop hosts file:

```
WORKER_PUBLIC_IP app1.local
```

Then browser:

```
http://app1.local
```

---

# TLS Later

For now:

- understand HTTPS termination
- ingress TLS secrets
- reverse proxy behavior

You can add:

- self-signed TLS
- cert-manager  
    later.

---

# Correct Troubleshooting Commands

Run separately:

```
kubectl describe ingress web-ingress
```

```
kubectl get ingress
```

```
kubectl get svc
```

```
kubectl get endpoints
```

```
kubectl logs -n ingress-nginx deployment/ingress-nginx-controller
```

NOT all joined together.