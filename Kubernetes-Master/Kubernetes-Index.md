
# 1. PCA (Google Cloud)

**Goal:** Know **when** to choose GKE and related Google Cloud services.

### Topics:

GKE
Autopilot
Standard Cluster
Workload Identity
Binary Authorization
Config Connector
Config Sync
Anthos
Cloud Operations
Cloud Logging
Cloud Monitoring
Cloud Armor
Cloud Load Balancer
Cloud DNS
Helm (basic)
Namespaces (basic)
Ingress (basic)
[[05-Kubernetes (GKE)]]

# 2. CKA (Certified Kubernetes Administrator)

**Goal:** Operate a Kubernetes cluster.

### Topics:

Pods
Deployments
ReplicaSets
Services
Namespaces
ConfigMaps
Secrets
Volumes
Persistent Volumes
Persistent Volume Claims
Storage Classes
DaemonSets
StatefulSets
Jobs
CronJobs
RBAC
NetworkPolicies
Helm
Ingress
etcd
kubeadm
Troubleshooting

# 3. Kubernetes Networking

**Goal:** Understand how traffic flows.

### Topics:

ClusterIP
NodePort
LoadBalancer
Ingress
CoreDNS
Service Discovery
CNI
Calico
Flannel
Cilium
MetalLB
Network Policy
Istio
Envoy
Service Mesh
Gateway API

# 4. AWS Kubernetes (EKS)

**Goal:** Learn AWS's managed Kubernetes service.

### Topics:

EKS
ECR
IAM Roles for Service Accounts (IRSA)
AWS Load Balancer Controller
VPC CNI
Fargate
Node Groups
Auto Mode
CloudWatch
AWS IAM
AWS WAF
Route53
ALB Ingress Controller



- **Namespace** is the same Kubernetes feature everywhere.
- The **PCA** asks _when to use it_.
- The **CKA** asks _how to create and manage it_.
- **AWS EKS** asks _how it integrates with AWS IAM and networking_.
- **Kubernetes Networking** asks _how it affects communication and traffic flow_.