
That’s because `kubectl get pod nginx-pod -o yaml` only PRINTS the YAML to the screen.

It does not automatically save a file.

To create an actual YAML file:

```
kubectl get pod nginx-pod -o yaml > nginx-pod.yaml
```

Now verify:

```
ls
```

You should see:

```
nginx-pod.yaml
```

Open it:

```
cat nginx-pod.yaml
```

or better:

```
nano nginx-pod.yaml
```

You can also export the deployment YAML:

```
kubectl get deployment nginx -o yaml > nginx-deployment.yaml
```

And service YAML:

```
kubectl get svc nginx -o yaml > nginx-service.yaml
```

These files are important because Kubernetes is heavily YAML-driven:

- Pods
- Deployments
- Services
- Ingress
- ConfigMaps
- Secrets
- Persistent Volumes
- etc.

Eventually most enterprise Kubernetes work becomes:

```
Write YAMLApply YAMLTroubleshoot YAML
```

using:

```
kubectl apply -f file.yaml
```