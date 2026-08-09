
---

## 1. Reverse Proxy ⭐⭐⭐⭐ (High Importance)

```
Client
   │
   ▼
Reverse Proxy
   │
   ▼
Application
```

Know what it does:

- Hides backend servers
- SSL termination
- Caching
- Compression (gzip)
- Security headers
- URL rewriting

### AWS equivalents

- **Application Load Balancer (ALB)** for Layer 7 routing
- **CloudFront** for caching
- **AWS WAF** for security
- **API Gateway** for APIs

**Exam Tip:**  
AWS often asks for the managed service instead of running NGINX yourself.

---

## 2. Load Balancer ⭐⭐⭐⭐⭐ (Very High Importance)

This is a major exam topic.

Know:

- Health checks
- Failover
- Multiple Availability Zones
- Session stickiness
- Algorithms (basic understanding)
- Path-based routing
- Host-based routing

AWS services:

- **ALB (Application Load Balancer)** → HTTP/HTTPS
- **NLB (Network Load Balancer)** → TCP/UDP
- **Gateway Load Balancer** → Network appliances
- **Classic Load Balancer** → Legacy

You should definitely know the differences between ALB, NLB, and Gateway Load Balancer.

---

## 3. API Gateway ⭐⭐⭐⭐⭐ (Very High Importance)

Know what it provides:

- Authentication
- Authorization
- Throttling
- Rate limiting
- Request validation
- Response transformation
- Monitoring
- API keys
- Usage plans

AWS service:

- **Amazon API Gateway**

This appears frequently on SAP-C02.

---

# Edge Controls

Your diagram lists:

- SSL
- Cache
- gzip

Know these concepts, but not NGINX syntax.

AWS mapping:

|Feature|AWS Service|
|---|---|
|SSL|ACM + ALB + CloudFront|
|Cache|CloudFront|
|Compression|CloudFront or application|

---

# Traffic Orchestration

Know:

- Health checks
- Failover
- Load balancing
- Blue/Green deployments
- Canary deployments
- Weighted routing

AWS services:

- ALB
- Route 53
- Auto Scaling Groups
- ECS/EKS
- CodeDeploy

---

# API Policies

Know the purpose of:

- Authentication
- Authorization
- Throttling
- Analytics
- Request transformation

AWS mapping:

- IAM
- Cognito
- API Gateway
- Lambda authorizers
- CloudWatch
- X-Ray

---

# If You're Running Kubernetes (CKA + AWS)

You'll likely see:

```
Internet
      │
      ▼
AWS ALB
      │
      ▼
NGINX Ingress Controller
      │
      ▼
Pods
```

or

```
CloudFront
      │
      ▼
ALB
      │
      ▼
EKS
      │
      ▼
NGINX Ingress
      │
      ▼
Pods
```

Knowing where NGINX fits into the architecture is more valuable than memorizing configuration files.

---

# For SAP-C02, I'd rank the topics like this:

|Topic|Importance|
|---|---|
|ALB|⭐⭐⭐⭐⭐|
|NLB|⭐⭐⭐⭐⭐|
|API Gateway|⭐⭐⭐⭐⭐|
|Route 53 routing|⭐⭐⭐⭐⭐|
|CloudFront|⭐⭐⭐⭐⭐|
|Auto Scaling|⭐⭐⭐⭐⭐|
|Reverse Proxy (concept)|⭐⭐⭐⭐|
|Health Checks|⭐⭐⭐⭐|
|SSL/TLS termination|⭐⭐⭐⭐|
|NGINX configuration syntax|⭐|

## Recommendation

Since you're aiming for **Professional-level** AWS certifications, I would create an **AWS Networking & Traffic Management** section in your Obsidian dictionary with entries for:

- Application Load Balancer (ALB)
- Network Load Balancer (NLB)
- Gateway Load Balancer (GWLB)
- Amazon API Gateway
- CloudFront
- Route 53
- Reverse Proxy
- NGINX
- SSL/TLS Termination
- Health Checks
- Auto Scaling
- Blue/Green Deployments
- Canary Deployments

Those services and concepts appear repeatedly across both the **AWS Solutions Architect – Professional** and **AWS Advanced Networking – Specialty** exams and also connect well to the Kubernetes architectures you've been building.

As a network engineer I also have to know about HAProxy, Kong Gateway, etc ??

Yes—but **to different depths depending on your role**.

Since your goal is **Cloud Engineer + Network Engineer + Kubernetes Engineer**, I'd recommend understanding the **architecture and use cases** of these tools rather than becoming an expert in configuring every one of them.

Here's how I'd prioritize them.

|Tool|Cloud Engineer|Network Engineer|Kubernetes Engineer|Learn Level|
|---|---|---|---|---|
|NGINX|⭐⭐⭐⭐⭐|⭐⭐⭐⭐|⭐⭐⭐⭐⭐|High|
|HAProxy|⭐⭐⭐⭐|⭐⭐⭐⭐⭐|⭐⭐⭐|High|
|Kong Gateway|⭐⭐⭐|⭐⭐⭐⭐|⭐⭐⭐⭐|Medium-High|
|Envoy|⭐⭐⭐⭐|⭐⭐⭐⭐⭐|⭐⭐⭐⭐⭐|High|
|Traefik|⭐⭐⭐|⭐⭐⭐|⭐⭐⭐⭐|Medium|
|Apache HTTP Server|⭐⭐|⭐⭐|⭐|Low|
|Istio|⭐⭐⭐⭐|⭐⭐⭐⭐|⭐⭐⭐⭐⭐|High|
|Cilium|⭐⭐⭐|⭐⭐⭐⭐⭐|⭐⭐⭐⭐⭐|High|

---

# NGINX

Best known for:

- Reverse proxy
- Web server
- Ingress Controller
- SSL termination
- Load balancing

Common in:

- AWS
- GCP
- Azure
- Kubernetes

---

# HAProxy

**Definition:**

HAProxy is a **high-performance Layer 4 and Layer 7 load balancer**.

It is widely used in enterprises because it is extremely fast and reliable.

Typical uses:

- Load balancing
- Health checks
- Failover
- TCP routing
- HTTP routing

Example:

```
Internet
      │
      ▼
   HAProxy
   ├── Server 1
   ├── Server 2
   └── Server 3
```

You'll see HAProxy frequently in:

- Financial institutions
- ISPs
- Large enterprise data centers

---

# Kong Gateway

**Definition:**

Kong is an **API Gateway**.

Instead of serving websites, it manages APIs.

Features:

- Authentication
- OAuth
- JWT
- Rate limiting
- Logging
- API keys
- Analytics

Example:

```
Client

↓

Kong Gateway

↓

REST APIs

↓

Microservices
```

Think of Kong as "traffic control for APIs."

---

# Envoy

Probably the hottest networking project today.

Used by:

- Istio
- Google
- Lyft
- AWS App Mesh

Handles:

- Service Mesh
- mTLS
- Traffic routing
- Canary deployments
- Retries
- Circuit breaking

If you're studying Kubernetes networking, you'll encounter Envoy often.

---

# Traefik

A Kubernetes-native reverse proxy and Ingress Controller.

Compared to NGINX:

- Easier setup
- Automatic certificate management
- Strong Docker integration
- Strong Kubernetes integration

---

# Istio

Uses Envoy sidecars.

Provides:

- Service Mesh
- mTLS
- Observability
- Traffic splitting
- Canary releases
- Fault injection

Very important for enterprise Kubernetes.

---

# Cilium

A modern Kubernetes networking platform based on eBPF.

Provides:

- High-performance networking
- NetworkPolicy enforcement
- Service Mesh features
- Load balancing
- Observability

Increasingly adopted in production Kubernetes clusters.

---

# Which certifications expect these?

|Certification|Expected Knowledge|
|---|---|
|AWS Solutions Architect Professional|NGINX concepts, HAProxy concepts, API Gateway, ALB/NLB|
|AWS Advanced Networking Specialty|HAProxy, NGINX, Envoy, BGP, DNS, Layer 4/7 load balancing|
|CKA|NGINX Ingress, Services, Ingress, NetworkPolicy|
|CKS|NGINX, Envoy, mTLS, Istio, NetworkPolicy|
|GCP Professional Cloud Architect|API Gateway, Cloud Load Balancing, Ingress, service mesh concepts|
|CCNA|Mostly traditional networking; very little on these tools|

## Recommendation for your Obsidian dictionary

Given your long-term plan (Cloud + Networking + Kubernetes), I'd create a separate section called **"Network Infrastructure Tools"** with entries such as:

1. NGINX
2. HAProxy
3. Kong Gateway
4. Envoy
5. Traefik
6. Istio
7. Cilium
8. API Gateway
9. Reverse Proxy
10. Service Mesh
11. Ingress Controller
12. Load Balancer (Layer 4 vs. Layer 7)

These technologies are becoming standard in modern cloud-native environments, and understanding **what each one does, when to use it, and how it fits into an architecture** will be much more valuable than memorizing their configuration syntax.