
```
mkdir -p ~/k8s-labs/day3-pods-yamlcd ~/k8s-labs/day3-pods-yaml
```

Use this corrected Day 3 flow:

```
clearkubectl create deployment nginx --image=nginxkubectl scale deployment nginx --replicas=3kubectl get pods -o wide
```

Expose it:

```
kubectl expose deployment nginx --type=NodePort --port=80kubectl get svc nginx
```

Export YAML into your lab folder:

```
kubectl get deployment nginx -o yaml > nginx-deployment.yamlkubectl get svc nginx -o yaml > nginx-service.yaml
```

Create single pod:

```
kubectl run nginx-pod --image=nginxkubectl get pods -o widekubectl get pod nginx-pod -o yaml > nginx-pod.yaml
```

Troubleshooting commands:

```
kubectl describe pod nginx-podkubectl logs nginx-podkubectl get events --sort-by=.metadata.creationTimestamp
```

Your “break/fix” lab:

```
kubectl run broken-pod --image=nginx:fakekubectl get podskubectl describe pod broken-podkubectl delete pod broken-pod
```

Cleanup:

```
kubectl delete deployment nginxkubectl delete pod nginx-podkubectl delete svc nginx
```

Main fix: always replace `<pod-name>` with the real pod name.