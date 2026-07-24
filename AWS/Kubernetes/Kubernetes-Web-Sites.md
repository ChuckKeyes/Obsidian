
**Terraform builds the infrastructure.**  
**kubectl deploys and manages what runs inside Kubernetes.**

For your 3-site project:

```
Terraform should create:

- VPC / subnets
  - EC2 nodes or GKE/EKS cluster
    - security groups / firewall rules
      - load balancer
        - Route53 DNS records
          - IAM roles
            - storage disks if needed
```

```
kubectl should create:

- Deployments
  - Pods
    - Services
      - Ingress
        - ConfigMaps
          - Secrets
            - Prometheus deployment
              - NetworkPolicies
```

For your websites:

```
Terraform:
bread.keyescloudsolutions.com DNS
portfolio.keyescloudsolutions.com DNS
www.keyescloudsolutions.com DNS
cluster / nodes / networking
```

```
kubectl:
bread website pod
portfolio website pod
main website pod
Prometheus pod
services for each site
Ingress routing rules
```

Simple rule:

```
Terraform = cloud foundation
kubectl = Kubernetes applications
```

Example:

```
Terraform makes the apartment building.
kubectl moves people and furniture into the rooms.
```

So for your design:

```
Terraform builds the Kubernetes cluster
.kubectl puts Bread, Portfolio, Main Site, and Prometheus into the cluster.
```