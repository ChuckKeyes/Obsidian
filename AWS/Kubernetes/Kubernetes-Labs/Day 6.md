
# 📅 DAY 6 — Ingress + Helm + TLS

# Goal

Understand real-world traffic routing and secure ingress access.

---

# Install Helm

```
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
```

---

# Install NGINX Ingress Controller

Using Helm.

---

# Create Ingress Rules

Test:

- hostname routing
- path routing

Examples:

- app1.local
- grafana.local
- /api
- /admin

---

# Add TLS / HTTPS

Understand:

- TLS certificates
- HTTPS termination
- secure ingress traffic

OPTIONAL:

- self-signed certificates
- cert-manager later

---

# Learn

Understand:

- load balancing
- reverse proxy
- ingress controller
- TLS termination
- Layer 7 routing
- hostname-based routing

---

# Troubleshooting

Break:

- wrong ingress class
- wrong hostname
- bad backend service
- TLS secret missing

Fix using:

```
kubectl describe ingresskubectl get ingresskubectl get svckubectl get endpointskubectl logs
```

---

# WHY This Is Important

Ingress is one of the MOST real-world Kubernetes topics.

Because modern applications need:

```
Internet ↓Load Balancer ↓Ingress ↓Services ↓Pods
```

That is real production architecture.

---

# Helm Is ALSO Very Important

Because real Kubernetes teams rarely deploy:

- giant YAML manually

Instead they use:

- Helm charts

For:

- Prometheus
- Grafana
- Jenkins
- Kafka
- ingress-nginx

VERY real-world.

---

# WHY Add TLS

Because almost every real ingress uses:

```
HTTPS
```

And PCA/CKA/cloud interviews increasingly expect awareness of:

- TLS termination
- ingress certificates
- secure traffic flow

---

# PERFECT Follow-Up Labs

After Day 6 you are ready for:

|Next Topic|Why|
|---|---|
|Prometheus/Grafana|observability|
|StorageClass/PVC|persistent apps|
|GitHub Actions|CI/CD|
|cert-manager|automatic TLS|
|NetworkPolicy|Kubernetes security|
|HPA autoscaling|scaling|