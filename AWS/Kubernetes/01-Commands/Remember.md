For the **CKA** and for real Kubernetes administration, you need to remember **three things**:

### 1. Commands

Examples:

```
kubectl get podskubectl describe pod nginxkubectl logs nginxkubectl apply -f pod.yamlkubectl delete pod nginx
```

These are the day-to-day commands.

---

### 2. YAML Structure

You don't need every field memorized, but you should recognize:

```
apiVersion:kind:metadata:spec:
```

And know the difference between:

- Pod
- Deployment
- Service
- Ingress
- ConfigMap
- Secret
- PV
- PVC
- Role
- RoleBinding

On the exam, most people use:

```
kubectl explain deployment.speckubectl explain pod.spec.containers
```

to look up fields.

---

### 3. What the Objects Do

This is the important part.

Can you answer:

|Object|Purpose|
|---|---|
|Pod|Runs containers|
|Deployment|Manages pods|
|Service|Networking|
|Ingress|HTTP routing|
|ConfigMap|Configuration|
|Secret|Sensitive data|
|PV|Storage|
|PVC|Requests storage|
|ServiceAccount|Pod identity|
|Role|Permissions|
|RoleBinding|Assigns permissions|

If you understand those, you can usually build the YAML.

---

### For Your 10-Day Lab

You should memorize:

```
kubectl getkubectl describekubectl logskubectl execkubectl applykubectl deletekubectl scalekubectl rolloutkubectl exposekubectl auth can-i
```

and be comfortable creating these YAML types:

```
PodDeploymentServiceIngressConfigMapSecretPVPVCServiceAccountRoleRoleBinding
```

The goal is not to memorize 500 commands. The goal is:

> "I know what Kubernetes object I need, and I know how to create, inspect, and troubleshoot it."

Looking at your progress through Days 1–8, you're already doing the same workflow repeatedly:

```
Create YAMLkubectl apply -f .kubectl get ...kubectl describe ...Fix problemRetest
```
