
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

