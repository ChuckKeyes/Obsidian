
## This is the security/configuration day:

**ConfigMap** = normal settings  
**Secret** = passwords/keys  
**RBAC** = who is allowed to do what

Create this folder on the master:

```
mkdir -p ~/k8s-labs/day8-config-secrets-rbaccd ~/k8s-labs/day8-config-secrets-rbac
```

Files you need:

```
configmap.yamlsecret.yamlpod-configmap-secret.yamlserviceaccount.yamlrole.yamlrolebinding.yaml
```

Apply them:

```
kubectl apply -f configmap.yaml
kubectl apply -f secret.yaml
kubectl apply -f pod-configmap-secret.yaml
kubectl apply -f serviceaccount.yaml
kubectl apply -f role.yaml
kubectl apply -f rolebinding.yaml
```

Check them:

```
kubectl get configmap
kubectl get secret
kubectl get serviceaccount
kubectl get role
kubectl get rolebinding
kubectl get pod
```

RBAC test commands:

```
kubectl auth can-i get pods --as=system:serviceaccount:default:day8-sa
kubectl auth can-i delete pods --as=system:serviceaccount:default:day8-sa
```

You want the answer to be:

```
yes
no
```

That proves **least privilege**.

Day 8 is important for CKA because it teaches:

```
ConfigMap created  
Secret created  
Pod running  
ServiceAccount created  
Role created  
RoleBinding created  
RBAC test: get pods = yes  
RBAC test: delete pods = no
```

This is not extra. This is core Kubernetes admin work.