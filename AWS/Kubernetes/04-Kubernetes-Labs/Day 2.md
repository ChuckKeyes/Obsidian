
## Install Kubernetes Cluster

# Goal

Build cluster manually using kubeadm.

---

## Install Kubernetes Packages

On ALL nodes:

```
clear
sudo apt update
sudo apt install -y apt-transport-https curl
```

Add repo:

```
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.30/deb/Release.key | 
sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
```

Add source:

```
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.30/deb/ /' | 
sudo tee /etc/apt/sources.list.d/kubernetes.list
```

Install:

```
clear
sudo apt update
sudo apt install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
sudo apt install -y ca-certificates
```

---

## Initialize Cluster

On master:

```
sudo kubeadm init
```

---

## Configure kubectl

```
clear
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

---

## Install CNI

Install Calico:

```
```
kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.28.3/manifests/calico.yaml
kubectl get pods -n kube-system
 kubectl get nodes
---



## Join Workers Run on Master

Use kubeadm join command.

On the control plane, run:

```
kubeadm token create --print-join-command
```

Copy the output. It will look like:

```
sudo kubeadm join 172.31.39.229:6443 --token ... --discovery-token-ca-cert-hash sha256:...
```

## Run that command on the **worker VM**.

Then back on the control plane:

```
kubectl get nodes
```

You want:

```
control-plane   Readyworker          Ready
```
---

## Verify

```
kubectl get nodes
kubectl get pods -n kube-system
kubectl get nodes -o wide

____

ubuntu@k8s-master:~$ kubectl get nodes
kubectl get pods -n kube-system
kubectl get nodes -o wide
NAME          STATUS   ROLES           AGE     VERSION
k8s-master    Ready    control-plane   5m14s   v1.30.14
k8s-worker1   Ready    <none>          2m1s    v1.30.14
k8s-worker2   Ready    <none>          106s    v1.30.14
NAME                                       READY   STATUS    RESTARTS   AGE
calico-kube-controllers-7fddf5954d-5tw94   1/1     Running   0          3m52s
calico-node-lb2r7                          1/1     Running   0          2m1s
calico-node-ptv6z                          1/1     Running   0          106s
calico-node-r6p9t                          1/1     Running   0          3m52s
coredns-55cb58b774-h4797                   1/1     Running   0          5m5s
coredns-55cb58b774-hfshw                   1/1     Running   0          5m5s
etcd-k8s-master                            1/1     Running   0          5m11s
kube-apiserver-k8s-master                  1/1     Running   0          5m11s
kube-controller-manager-k8s-master         1/1     Running   0          5m11s
kube-proxy-9rq6v                           1/1     Running   0          106s
kube-proxy-9tds9                           1/1     Running   0          5m5s
kube-proxy-dcr84                           1/1     Running   0          2m1s
kube-scheduler-k8s-master                  1/1     Running   0          5m11s
NAME          STATUS   ROLES           AGE     VERSION    INTERNAL-IP     EXTERNAL-IP   OS-IMAGE             KERNEL-VERSION   CONTAINER-RUNTIME
k8s-master    Ready    control-plane   5m14s   v1.30.14   172.31.80.245   <none>        Ubuntu 22.04.5 LTS   6.8.0-1057-aws   containerd://2.2.1
k8s-worker1   Ready    <none>          2m1s    v1.30.14   172.31.93.25    <none>        Ubuntu 22.04.5 LTS   6.8.0-1057-aws   containerd://2.2.1
k8s-worker2   Ready    <none>          106s    v1.30.14   172.31.81.8     <none>        Ubuntu 22.04.5 LTS   6.8.0-1057-aws   containerd://2.2.1