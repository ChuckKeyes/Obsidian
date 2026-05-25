
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
NAME          STATUS   ROLES           AGE     VERSION
k8s-master    Ready    control-plane   7m18s   v1.30.14
k8s-worker1   Ready    <none>          40s     v1.30.14
k8s-worker2   Ready    <none>          63s     v1.30.14
ubuntu@k8s-master:~$ kubectl get pods -n kube-system
kubectl get nodes -o wide
NAME                                       READY   STATUS    RESTARTS   AGE
calico-kube-controllers-7fddf5954d-fnbrc   1/1     Running   0          15m
calico-node-2ztvw                          1/1     Running   0          11m
calico-node-jfqxv                          1/1     Running   0          15m
calico-node-qdx4d                          1/1     Running   0          10m
coredns-55cb58b774-chslp                   1/1     Running   0          17m
coredns-55cb58b774-d7rgv                   1/1     Running   0          17m
etcd-k8s-master                            1/1     Running   0          17m
kube-apiserver-k8s-master                  1/1     Running   0          17m
kube-controller-manager-k8s-master         1/1     Running   0          17m
kube-proxy-5dw4l                           1/1     Running   0          11m
kube-proxy-h8btx                           1/1     Running   0          10m
kube-proxy-smdcj                           1/1     Running   0          17m
kube-scheduler-k8s-master                  1/1     Running   0          17m
NAME          STATUS   ROLES           AGE   VERSION    INTERNAL-IP     EXTERNAL-IP   OS-IMAGE             KERNEL-VERSION   CONTAINER-RUNTIME
k8s-master    Ready    control-plane   17m   v1.30.14   172.31.32.160   <none>        Ubuntu 22.04.5 LTS   6.8.0-1055-aws   containerd://2.2.1
k8s-worker1   Ready    <none>          10m   v1.30.14   172.31.44.61    <none>        Ubuntu 22.04.5 LTS   6.8.0-1055-aws   containerd://2.2.1
k8s-worker2   Ready    <none>          11m   v1.30.14   172.31.38.73    <none>        Ubuntu 22.04.5 LTS   6.8.0-1055-aws   containerd://2.2.1