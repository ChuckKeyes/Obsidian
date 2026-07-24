chuck@LAPTOP-1B94MM1R:/d/New Obsidian/New Obsidian/AWS/Kubernetes/Terraform$ 
chuck@LAPTOP-1B94MM1R:/d/New Obsidian/New Obsidian/AWS/Kubernetes/Terraform$ ssh -i ~/.ssh/id_rsa ubuntu@44.216.61.190
Enter passphrase for key '/c/Users/chuck/.ssh/id_rsa': 
Welcome to Ubuntu 22.04.5 LTS (GNU/Linux 6.8.0-1057-aws x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Sat Jun 20 17:22:26 UTC 2026

  System load:  0.25               Processes:             150
  Usage of /:   19.2% of 24.05GB   Users logged in:       0
  Memory usage: 23%                IPv4 address for ens5: 172.31.80.245
  Swap usage:   0%

 * Ubuntu Pro delivers the most comprehensive open source security and
   compliance features.

   https://ubuntu.com/aws/pro

Expanded Security Maintenance for Applications is not enabled.

0 updates can be applied immediately.

2 additional security updates can be applied with ESM Apps.
Learn more about enabling ESM Apps service at https://ubuntu.com/esm


Last login: Thu Jun 18 16:23:14 2026 from 69.136.28.9
ubuntu@k8s-master:~$ 
ubuntu@k8s-master:~$ kubectl apply -f day10-websites/
error: the path "day10-websites/" does not exist
ubuntu@k8s-master:~$ which kubectl
kubectl version --client
/usr/bin/kubectl
Client Version: v1.30.14
Kustomize Version: v5.0.4-0.20230601165947-6ce0bf390ce3
ubuntu@k8s-master:~$ kubectl get nodes
kubectl get pods -A
NAME          STATUS   ROLES           AGE   VERSION
k8s-master    Ready    control-plane   46h   v1.30.14
k8s-worker1   Ready    <none>          46h   v1.30.14
k8s-worker2   Ready    <none>          46h   v1.30.14
NAMESPACE     NAME                                       READY   STATUS    RESTARTS       AGE
default       web-7c56dcdb9b-gjv6s                       1/1     Running   2 (3h7m ago)   46h
default       web-7c56dcdb9b-l2kpg                       1/1     Running   2 (3h7m ago)   46h
default       web-7c56dcdb9b-tbl5l                       1/1     Running   2 (3h7m ago)   46h
kube-system   calico-kube-controllers-7fddf5954d-5tw94   1/1     Running   2 (3h7m ago)   46h
kube-system   calico-node-lb2r7                          1/1     Running   2 (3h7m ago)   46h
kube-system   calico-node-ptv6z                          1/1     Running   2 (3h7m ago)   46h
kube-system   calico-node-r6p9t                          1/1     Running   2 (3h7m ago)   46h
kube-system   coredns-55cb58b774-h4797                   1/1     Running   2 (3h7m ago)   46h
kube-system   coredns-55cb58b774-hfshw                   1/1     Running   2 (3h7m ago)   46h
kube-system   etcd-k8s-master                            1/1     Running   2 (3h7m ago)   46h
kube-system   kube-apiserver-k8s-master                  1/1     Running   2 (3h7m ago)   46h
kube-system   kube-controller-manager-k8s-master         1/1     Running   2 (3h7m ago)   46h
kube-system   kube-proxy-9rq6v                           1/1     Running   2 (3h7m ago)   46h
kube-system   kube-proxy-9tds9                           1/1     Running   2 (3h7m ago)   46h
kube-system   kube-proxy-dcr84                           1/1     Running   2 (3h7m ago)   46h
kube-system   kube-scheduler-k8s-master                  1/1     Running   2 (3h7m ago)   46h
ubuntu@k8s-master:~$ mkdir -p day10-websites
cd day10-websites
ubuntu@k8s-master:~/day10-websites$ nano namespace.yaml
ubuntu@k8s-master:~/day10-websites$ kubectl apply -f namespace.yaml
namespace/websites created
ubuntu@k8s-master:~/day10-websites$ kubectl get ns
NAME              STATUS   AGE
default           Active   46h
kube-node-lease   Active   46h
kube-public       Active   46h
kube-system       Active   46h
websites          Active   11s
ubuntu@k8s-master:~/day10-websites$ nano bread.yaml
ubuntu@k8s-master:~/day10-websites$ kubectl apply -f bread.yaml
kubectl get pods -n websites
kubectl get svc -n websites
deployment.apps/bread created
service/bread-service created
NAME                    READY   STATUS              RESTARTS   AGE
bread-5d579bbbc-5bmsr   0/1     ContainerCreating   0          0s
bread-5d579bbbc-pgf68   0/1     ContainerCreating   0          0s
NAME            TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)   AGE
bread-service   ClusterIP   10.102.61.174   <none>        80/TCP    1s
ubuntu@k8s-master:~/day10-websites$ kubectl get pods -n websites
NAME                    READY   STATUS    RESTARTS   AGE
bread-5d579bbbc-5bmsr   1/1     Running   0          3m57s
bread-5d579bbbc-pgf68   1/1     Running   0          3m57s
ubuntu@k8s-master:~/day10-websites$ kubectl run test-curl -n websites --rm -it --image=curlimages/curl -- sh
If you don't see a command prompt, try pressing enter.
~ $ curl bread-service
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
html { color-scheme: light dark; }
body { width: 35em; margin: 0 auto;
font-family: Tahoma, Verdana, Arial, sans-serif; }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, nginx is successfully installed and working.
Further configuration is required for the web server, reverse proxy, 
API gateway, load balancer, content cache, or other features.</p>

<p>For online documentation and support please refer to
<a href="https://nginx.org/">nginx.org</a>.<br/>
To engage with the community please visit
<a href="https://community.nginx.org/">community.nginx.org</a>.<br/>
For enterprise grade support, professional services, additional 
security features and capabilities please refer to
<a href="https://f5.com/nginx">f5.com/nginx</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
~ $ exit
Session ended, resume using 'kubectl attach test-curl -c test-curl -i -t' command when the pod is running
pod "test-curl" deleted
ubuntu@k8s-master:~/day10-websites$ kubectl get pods -n websites
kubectl get svc -n websites
NAME                    READY   STATUS    RESTARTS   AGE
bread-5d579bbbc-5bmsr   1/1     Running   0          11m
bread-5d579bbbc-pgf68   1/1     Running   0          11m
NAME            TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)   AGE
bread-service   ClusterIP   10.102.61.174   <none>        80/TCP    11m
ubuntu@k8s-master:~/day10-websites$ kubectl patch svc bread-service -n websites -p '{"spec":{"type":"NodePort"}}'
service/bread-service patched
ubuntu@k8s-master:~/day10-websites$ kubectl get svc -n websites
NAME            TYPE       CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE
bread-service   NodePort   10.102.61.174   <none>        80:32433/TCP   12m
ubuntu@k8s-master:~/day10-websites$ Read from remote host 44.216.61.190: Connection reset by peer
Connection to 44.216.61.190 closed.
client_loop: send disconnect: Connection reset by peer