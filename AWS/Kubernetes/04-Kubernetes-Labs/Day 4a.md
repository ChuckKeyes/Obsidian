
Start fresh:

```
kubectl create deployment web --image=nginxkubectl scale deployment web --replicas=5kubectl get pods -o wide
```

Delete one real pod name:

```
kubectl get podskubectl delete pod <POD_NAME>kubectl get pods -w
```

Press `Ctrl + C` to stop watching.

Expose deployment:

```
kubectl expose deployment web --type=NodePort --port=80kubectl get svc
```

Rolling update:

```
kubectl set image deployment/web nginx=nginx:1.27kubectl rollout status deployment webkubectl rollout history deployment web
```

Break it:

```
kubectl set image deployment/web nginx=nginx:fakekubectl get podskubectl describe pod <POD_NAME>
```

Rollback:

```
kubectl rollout undo deployment webkubectl rollout status deployment webkubectl get pods
```

Main fixes:

```
kubectl get podskubectl describe pod <POD_NAME>
```

not:

```
kubectl get podskubectl describe pod POD_NAME
```

And:

```
kubectl rollout status deployment webkubectl get pods
```