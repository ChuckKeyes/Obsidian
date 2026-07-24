
[Helm and Helm Charts Explained - Helm Tutorial for Beginners - YouTube](https://www.youtube.com/watch?v=w51lDVuRWuk)


[Artifact Hub](https://artifacthub.io/packages/search?ts_query_web=helm&sort=relevance&page=1)


# Helm v3

## Definition

Helm v3 is the package manager for Kubernetes. It allows administrators and developers to install, upgrade, configure, and manage Kubernetes applications using pre-packaged templates called **Helm Charts**.

Helm simplifies the deployment of complex applications by grouping Kubernetes resources such as Deployments, Services, Ingresses, ConfigMaps, Secrets, and Persistent Volumes into a single reusable package.

## Why Helm is Used

Without Helm, each Kubernetes resource typically requires a separate YAML file. Helm allows these resources to be managed as a single application, making deployments faster, more consistent, and easier to maintain.

## Key Components

### Chart

A Helm Chart is a collection of Kubernetes YAML templates and configuration files that define an application.

### Release

A Release is a running instance of a Helm Chart deployed into a Kubernetes cluster.

### Repository

A Helm Repository is a collection of Helm Charts that can be searched, downloaded, and installed.

## Common Uses

- Deploying NGINX Ingress Controller
- Installing Prometheus and Grafana
- Deploying monitoring and logging stacks
- Installing databases such as PostgreSQL or MySQL
- Managing application upgrades and rollbacks

## Common Commands

Install Helm:

```
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
```

Add a repository:

```
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
```

Update repositories:

```
helm repo update
```

Install an application:

```
helm install myapp ingress-nginx/ingress-nginx
```

List releases:

```
helm list
```

Upgrade a release:

```
helm upgrade myapp ingress-nginx/ingress-nginx
```

Rollback a release:

```
helm rollback myapp 1
```

Uninstall a release:

```
helm uninstall myapp
```

## Helm v3 Advantages

- Simplifies Kubernetes deployments
- Reduces YAML management
- Supports version control of applications
- Enables upgrades and rollbacks
- Large ecosystem of community charts
- Widely used in production Kubernetes environments

## Cloud Engineer Perspective

For a Kubernetes administrator or Cloud Engineer, Helm is one of the most important tools in the Kubernetes ecosystem. It is commonly used to deploy infrastructure components such as Ingress Controllers, Prometheus, Grafana, Cert-Manager, and service meshes with a few commands instead of manually creating dozens of YAML files.