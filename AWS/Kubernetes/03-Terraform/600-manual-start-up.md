1. SSH to the master

ssh -i ~/.ssh/id_rsa ubuntu@52.45.220.77

2. Verify the software

hostname

kubeadm version

kubectl version --client

containerd --version

docker --version

systemctl status containerd

3. Initialize the cluster

sudo kubeadm init --pod-network-cidr=192.168.0.0/16

4. Configure kubectl

Run the commands that kubeadm init prints, typically:

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

5. Verify the control plane

kubectl get nodes
kubectl get pods -A

6. Install Calico

kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.28.3/manifests/calico.yaml

7. Join the workers

Run the kubeadm join ... command that kubeadm init displays on both worker nodes.

8. Final verification

kubectl get nodes -o wide
kubectl get pods -A

kubeadm token create --print-join-command
kubeadm join 172.31.23.15:6443 --token 757325.6wa3lt6h98o0kwcg --discovery-token-ca-cert-hash sha256:52c4ff449376e9f6a30e82c14e66d3f8a5c2e6869653b20ff61899850d9d12fe

9. Join worker  with sudo

sudo kubeadm join 172.31.23.15:6443 --token 757325.6wa3lt6h98o0kwcg --discovery-token-ca-cert-hash sha256:52c4ff449376e9f6a30e82c14e66d3f8a5c2e6869653b20ff61899850d9d12fe

10. Now go back to k8s-master and run:

kubectl get nodes -o wide
NAME          STATUS   ROLES           AGE     VERSION    INTERNAL-IP     EXTERNAL-IP   OS-IMAGE             KERNEL-VERSION   CONTAINER-RUNTIME
k8s-master    Ready    control-plane   31m     v1.30.14   172.31.23.15    <none>        Ubuntu 22.04.5 LTS   6.8.0-1057-aws   containerd://2.2.1
k8s-worker1   Ready    <none>          7m11s   v1.30.14   172.31.20.92    <none>        Ubuntu 22.04.5 LTS   6.8.0-1057-aws   containerd://2.2.1
k8s-worker2   Ready    <none>          6m43s   v1.30.14   172.31.30.110   <none>        Ubuntu 22.04.5 LTS   6.8.0-1057-aws   containerd://2.2.1

11. kubectl get pods -A
    kubectl get svc -A

    NAMESPACE     NAME                                       READY   STATUS    RESTARTS   AGE
kube-system   calico-kube-controllers-7fddf5954d-kdcgf   1/1     Running   0          25m
kube-system   calico-node-jp2hm                          1/1     Running   0          9m55s
kube-system   calico-node-kldgv                          1/1     Running   0          10m
kube-system   calico-node-z8lnv                          1/1     Running   0          25m
kube-system   coredns-55cb58b774-5xxnl                   1/1     Running   0          34m
kube-system   coredns-55cb58b774-qqs84                   1/1     Running   0          34m
kube-system   etcd-k8s-master                            1/1     Running   0          34m
kube-system   kube-apiserver-k8s-master                  1/1     Running   0          34m
kube-system   kube-controller-manager-k8s-master         1/1     Running   0          34m
kube-system   kube-proxy-ghw46                           1/1     Running   0          9m55s
kube-system   kube-proxy-qf2vr                           1/1     Running   0          10m
kube-system   kube-proxy-t7zkz                           1/1     Running   0          34m
kube-system   kube-scheduler-k8s-master                  1/1     Running   0          34m
NAMESPACE     NAME         TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)                  AGE
default       kubernetes   ClusterIP   10.96.0.1    <none>        443/TCP                  34m
kube-system   kube-dns     ClusterIP   10.96.0.10   <none>        53/UDP,53/TCP,9153/TCP   34m