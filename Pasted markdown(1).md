### Volumes

## What you should know

### 1. Persistent Volumes (PV) ⭐⭐⭐⭐⭐

Understand:

- What a PV is
- How to create one
- Capacity
- Access modes
- Reclaim policy

Practice:

```
kubectl apply -f pv.yamlkubectl get pvkubectl describe pvkubectl delete pv my-pv
```

---

### 2. Persistent Volume Claims (PVC) ⭐⭐⭐⭐⭐

Know how to:

- Request storage
- Bind to a PV
- Verify the binding

Practice:

```
kubectl apply -f pvc.yamlkubectl get pvckubectl describe pvc
```

You should recognize states like:

```
PendingBoundLost
```

---

### 3. Mounting storage into Pods ⭐⭐⭐⭐⭐

This is one of the most common CKA tasks.

Example:

```
volumes:- name: my-storage  persistentVolumeClaim:    claimName: my-pvcvolumeMounts:- mountPath: /data  name: my-storage
```

Verify:

```
kubectl exec -it mypod -- shcd /data
```

---

### 4. Storage Classes ⭐⭐⭐⭐☆

Know:

- What a StorageClass is
- Dynamic provisioning
- Default StorageClass

Commands:

```
kubectl get storageclasskubectl describe storageclass
```

---

### 5. Access Modes ⭐⭐⭐⭐⭐

Know these by memory:

```
ReadWriteOnce (RWO)ReadOnlyMany (ROX)ReadWriteMany (RWX)ReadWriteOncePod (RWOP)
```

Understand when each is appropriate.

---

### 6. Reclaim Policies ⭐⭐⭐⭐☆

Know:

```
RetainDeleteRecycle (deprecated)
```

---

### 7. emptyDir ⭐⭐⭐⭐☆

Very common on the CKA.

Example:

```
volumes:- name: cache  emptyDir: {}
```

Know:

- Lives as long as the Pod
- Deleted when the Pod is removed

---

### 8. hostPath ⭐⭐⭐⭐☆

Example:

```
volumes:- name: logs  hostPath:    path: /var/log
```

Know:

- Uses the node's filesystem
- Mostly for labs or special workloads

---

### 9. ConfigMap volumes ⭐⭐⭐☆☆

Mount configuration files:

```
volumes:- name: config  configMap:    name: app-config
```

---

### 10. Secret volumes ⭐⭐⭐☆☆

Mount secrets:

```
volumes:- name: secret-volume  secret:    secretName: db-secret
```

---

# Commands to practice

```
kubectl get pvkubectl get pvckubectl get storageclasskubectl describe pvkubectl describe pvckubectl apply -f pv.yamlkubectl apply -f pvc.yamlkubectl apply -f pod.yamlkubectl delete pv my-pvkubectl delete pvc my-pvc
```

---

# YAML you should be able to write

- ✅ PersistentVolume
- ✅ PersistentVolumeClaim
- ✅ Pod using a PVC
- ✅ Pod using `emptyDir`
- ✅ Pod using `hostPath`
- ✅ ConfigMap volume
- ✅ Secret volume

---

# Troubleshooting (very important)

Be comfortable diagnosing:

- PVC stuck in `Pending`
- PV not binding to a PVC
- Wrong access mode
- Capacity mismatch
- Pod cannot mount a volume
- StorageClass doesn't exist or is incorrect

Use:

```
kubectl describe pvckubectl describe podkubectl get events
```

### RBAC

RBAC = **Role-Based Access Control**

It answers:

> **Who can do what on which resources?**

Example:

```
User Bob     │     ▼Role     │     ▼Can:  ✔ get pods  ✔ list pods  ✔ create deployments  ✘ delete namespaces
```

---

# CKA Topics You Need to Know

## 1. Service Accounts ⭐⭐⭐⭐⭐

Create:

```
kubectl create serviceaccount developer
```

View:

```
kubectl get sakubectl describe sa developer
```

YAML:

```
apiVersion: v1kind: ServiceAccountmetadata:  name: developer
```

---

## 2. Roles ⭐⭐⭐⭐⭐

Roles work **inside one namespace**.

Example:

```
apiVersion: rbac.authorization.k8s.io/v1kind: Rolemetadata:  name: pod-readerrules:- apiGroups: [""]  resources:  - pods  verbs:  - get  - list  - watch
```

Practice:

```
kubectl apply -f role.yamlkubectl get roleskubectl describe role pod-reader
```

---

## 3. RoleBindings ⭐⭐⭐⭐⭐

Connects:

```
Role      ↓ServiceAccount
```

Example:

```
kind: RoleBindingsubjects:- kind: ServiceAccount  name: developerroleRef:  kind: Role  name: pod-reader
```

Practice:

```
kubectl apply -f rolebinding.yamlkubectl get rolebindings
```

---

## 4. ClusterRoles ⭐⭐⭐⭐☆

Cluster-wide permissions.

Example:

```
kind: ClusterRole
```

Can allow access to:

- Nodes
- PersistentVolumes
- Namespaces
- Cluster-wide resources

Commands:

```
kubectl get clusterroleskubectl describe clusterrole admin
```

---

## 5. ClusterRoleBindings ⭐⭐⭐⭐☆

Connects:

```
ClusterRole       ↓ServiceAccount/User
```

Practice:

```
kubectl get clusterrolebindings
```

---

## 6. Check Permissions ⭐⭐⭐⭐⭐

One of the most useful CKA commands:

```
kubectl auth can-i create pods
```

Test another service account:

```
kubectl auth can-i delete deployments \--as=system:serviceaccount:default:developer
```

You'll use this frequently for troubleshooting.

---

## 7. Namespaces ⭐⭐⭐⭐☆

Know that Roles are namespace-scoped.

Example:

```
kubectl get roles -n production
```

---

## 8. Default Service Account ⭐⭐⭐⭐☆

Every namespace has one.

View:

```
kubectl get sa
```

Know how to replace it with your own.

---

# Commands to Practice

```
kubectl get sakubectl create serviceaccount appkubectl get roleskubectl get rolebindingskubectl get clusterroleskubectl get clusterrolebindingskubectl auth can-i get podskubectl auth can-i create deploymentskubectl describe rolekubectl describe rolebinding
```

---

# YAML You Should Be Able to Write

- ✅ ServiceAccount
- ✅ Role
- ✅ RoleBinding
- ✅ ClusterRole
- ✅ ClusterRoleBinding

---

# Troubleshooting

Be comfortable with:

```
Forbiddencannot list podscannot create deploymentpermission deniedservice account not foundrole binding missing
```

Use:

```
kubectl auth can-ikubectl describe rolekubectl describe rolebindingkubectl get events
```

---

# A Great Practice Lab

Since your Kubernetes cluster is already running, try this:

1. Create a namespace called `development`.
2. Create a ServiceAccount named `developer`.
3. Create a Role that allows:
    - `get`
    - `list`
    - `watch`  
        on Pods only.
4. Bind the Role to the `developer` ServiceAccount with a RoleBinding.
5. Verify permissions with `kubectl auth can-i`.
6. Modify the Role to also allow creating Pods.
7. Test again with `kubectl auth can-i`.

---

# CKA Study Priority

For the CKA, I'd rank RBAC topics like this:

|Topic|Priority|
|---|---|
|ServiceAccount|⭐⭐⭐⭐⭐|
|Role|⭐⭐⭐⭐⭐|
|RoleBinding|⭐⭐⭐⭐⭐|
|`kubectl auth can-i`|⭐⭐⭐⭐⭐|
|Namespaces|⭐⭐⭐⭐☆|
|ClusterRole|⭐⭐⭐⭐☆|
|ClusterRoleBinding|⭐⭐⭐⭐☆|
|Default ServiceAccount|⭐⭐⭐⭐☆|
|Troubleshooting RBAC|

### Labels, taints/tolerations

This is another **high-value CKA topic**. Labels, selectors, taints, tolerations, and node selection are used throughout the exam. Since you already have a 3-node cluster, you can practice all of these on your own lab.

---

# 1. Labels ⭐⭐⭐⭐⭐

A **label** is a key/value pair attached to a Kubernetes object.

Example:

```
metadata:  labels:    app: nginx    env: production    tier: frontend
```

View labels:

```
kubectl get pods --show-labelskubectl get nodes --show-labels
```

Add a label:

```
kubectl label node k8s-worker1 disk=ssd
```

Remove a label:

```
kubectl label node k8s-worker1 disk-
```

---

# 2. Selectors ⭐⭐⭐⭐⭐

Selectors match labels.

Example:

```
kubectl get pods -l app=nginx
```

Multiple labels:

```
kubectl get pods -l app=nginx,tier=frontend
```

Nearly every Deployment and Service uses selectors.

---

# 3. Node Selectors ⭐⭐⭐⭐⭐

This is commonly tested.

Label a node:

```
kubectl label node k8s-worker2 website=bread
```

Deployment:

```
spec:  nodeSelector:    website: bread
```

Only nodes with:

```
website=bread
```

will run that Pod.

---

# 4. Taints ⭐⭐⭐⭐⭐

A taint keeps Pods **off** a node unless they tolerate it.

Example:

```
kubectl taint nodes k8s-worker1 dedicated=database:NoSchedule
```

Now nothing schedules there unless it has a matching toleration.

View taints:

```
kubectl describe node k8s-worker1
```

Remove taint:

```
kubectl taint nodes k8s-worker1 dedicated-
```

---

# 5. Tolerations ⭐⭐⭐⭐⭐

A Pod can tolerate a taint.

Example:

```
tolerations:- key: "dedicated"  operator: "Equal"  value: "database"  effect: "NoSchedule"
```

Now it can run on the tainted node.

---

# 6. Control Plane Taint ⭐⭐⭐⭐⭐

You've already seen this.

Normally:

```
k8s-master
```

has a taint like:

```
NoSchedule
```

That's why your Bread pod stayed **Pending** until you changed the deployment.

See it:

```
kubectl describe node k8s-master
```

Remove it (lab only):

```
kubectl taint nodes k8s-master node-role.kubernetes.io/control-plane-
```

---

# 7. Affinity ⭐⭐⭐⭐☆

The CKA may include basic affinity.

Example:

```
affinity:  nodeAffinity:
```

Know the difference:

```
nodeSelector
```

Simple.

```
NodeAffinity
```

More powerful and flexible.

---

# 8. Pod Affinity ⭐⭐⭐☆☆

Example:

```
Run Pod A near Pod B
```

---

# 9. Pod Anti-Affinity ⭐⭐⭐⭐☆

Example:

```
Never put two replicas on the same node.
```

Very common in production.

---

# Commands to Practice

```
kubectl get nodes --show-labelskubectl label node k8s-worker1 disk=ssdkubectl get pods --show-labelskubectl get pods -l app=nginxkubectl describe node k8s-worker1kubectl taint nodes k8s-worker1 dedicated=test:NoSchedulekubectl taint nodes k8s-worker1 dedicated-
```

---

# YAML You Should Be Able to Write

- Pod with labels
- Deployment using labels
- Service using selectors
- `nodeSelector`
- Tolerations
- Basic `nodeAffinity`

---

# Troubleshooting

You should recognize:

```
Pending
```

because:

- Wrong nodeSelector
- Missing label
- Missing toleration
- Node tainted
- No matching nodes

Useful commands:

```
kubectl describe podkubectl describe nodekubectl get events
```

---

# Excellent Practice Lab for Your Cluster

Using your current nodes:

```
k8s-masterk8s-worker1k8s-worker2
```

Practice this sequence:

1. Label `k8s-worker1` with `website=bread`.
2. Label `k8s-worker2` with `website=portfolio`.
3. Deploy the Bread website using a `nodeSelector` so it only runs on `k8s-worker1`.
4. Deploy a Portfolio website using a `nodeSelector` so it only runs on `k8s-worker2`.
5. Taint `k8s-worker2` with `dedicated=portfolio:NoSchedule`.
6. Watch the Portfolio Pod become unschedulable.
7. Add the correct toleration to the Deployment and verify it runs again.
8. Remove the taint and confirm normal scheduling resumes.

---

# CKA Study Priority

|Topic|Priority|
|---|---|
|Labels|⭐⭐⭐⭐⭐|
|Selectors|⭐⭐⭐⭐⭐|
|`nodeSelector`|⭐⭐⭐⭐⭐|
|Taints|⭐⭐⭐⭐⭐|
|Tolerations|⭐⭐⭐⭐⭐|
|`kubectl label`|⭐⭐⭐⭐⭐|
|`kubectl taint`|⭐⭐⭐⭐⭐|
|`kubectl describe` (troubleshooting)|⭐⭐⭐⭐⭐|
|Node Affinity|⭐⭐⭐⭐☆|
|Pod Affinity / Anti-Affinity|⭐⭐⭐⭐☆|

For the CKA, the most important skill is being able to recognize **why a Pod is stuck in `Pending`**. The first things to check are labels, selectors, taints, tolerations, resource availability, and the output of `kubectl describe pod`. Since you recently diagnosed a `Pending` pod caused by scheduling constraints in your own cluster, you've already encountered the kind of troubleshooting the exam expects.

### Etcd snapshots  v3

**etcd** is one of the highest-value topics on the **CKA** because it is the Kubernetes database. You are expected to know how to **back it up and restore it** on a kubeadm cluster like yours.

---

# What is etcd?

etcd stores the cluster state:

- Pods
- Deployments
- Services
- Secrets
- ConfigMaps
- RBAC
- Nodes
- Namespaces

Think of it as:

```
Kubernetes      │      ▼+----------------------+|        etcd          ||  Cluster Database    |+----------------------+
```

If etcd is lost, Kubernetes loses its cluster state.

---

# 1. Find the etcd Pod ⭐⭐⭐⭐⭐

Practice:

```
kubectl get pods -n kube-system
```

You should see:

```
etcd-k8s-master
```

---

# 2. Locate the etcd certificates ⭐⭐⭐⭐⭐

On a kubeadm cluster:

```
/etc/kubernetes/pki/etcd/
```

Verify:

```
ls -al /etc/kubernetes/pki/etcd
```

You should see files like:

```
ca.crtca.keyserver.crtserver.keyhealthcheck-client.crthealthcheck-client.keypeer.crtpeer.key
```

---

# 3. Check the etcd endpoint ⭐⭐⭐⭐⭐

Practice:

```
sudo ETCDCTL_API=3 etcdctl \endpoint health \--endpoints=https://127.0.0.1:2379 \--cacert=/etc/kubernetes/pki/etcd/ca.crt \--cert=/etc/kubernetes/pki/etcd/healthcheck-client.crt \--key=/etc/kubernetes/pki/etcd/healthcheck-client.key
```

You should see:

```
healthy
```

---

# 4. Create a Snapshot ⭐⭐⭐⭐⭐

This is one of the most important CKA tasks.

```
sudo ETCDCTL_API=3 etcdctl snapshot save backup.db \--endpoints=https://127.0.0.1:2379 \--cacert=/etc/kubernetes/pki/etcd/ca.crt \--cert=/etc/kubernetes/pki/etcd/healthcheck-client.crt \--key=/etc/kubernetes/pki/etcd/healthcheck-client.key
```

Verify:

```
ls -lh backup.db
```

---

# 5. Check Snapshot Status ⭐⭐⭐⭐⭐

Practice:

```
sudo ETCDCTL_API=3 etcdctl snapshot status backup.db -w table
```

Example:

```
+---------+----------+------------+------------+| HASH    | REVISION | TOTAL KEYS | TOTAL SIZE |+---------+----------+------------+------------+
```

---

# 6. Restore a Snapshot ⭐⭐⭐⭐⭐

Restore to a new directory:

```
sudo ETCDCTL_API=3 etcdctl snapshot restore backup.db \--data-dir=/tmp/etcd-restore
```

Verify:

```
ls /tmp/etcd-restore
```

On the exam, you may also need to update the etcd static Pod manifest to use the restored data directory.

---

# 7. Inspect the Static Pod Manifest ⭐⭐⭐⭐☆

Practice:

```
cat /etc/kubernetes/manifests/etcd.yaml
```

Notice:

- Image
- Volume mounts
- Data directory
- Certificate paths

---

# 8. Check Cluster Health ⭐⭐⭐⭐☆

Practice:

```
kubectl get nodeskubectl get pods -Akubectl cluster-info
```

---

# Commands to Practice

```
kubectl get pods -n kube-systemls /etc/kubernetes/pki/etcdsudo ETCDCTL_API=3 etcdctl endpoint health \--endpoints=https://127.0.0.1:2379 \--cacert=/etc/kubernetes/pki/etcd/ca.crt \--cert=/etc/kubernetes/pki/etcd/healthcheck-client.crt \--key=/etc/kubernetes/pki/etcd/healthcheck-client.keysudo ETCDCTL_API=3 etcdctl snapshot save backup.db \--endpoints=https://127.0.0.1:2379 \--cacert=/etc/kubernetes/pki/etcd/ca.crt \--cert=/etc/kubernetes/pki/etcd/healthcheck-client.crt \--key=/etc/kubernetes/pki/etcd/healthcheck-client.keysudo ETCDCTL_API=3 etcdctl snapshot status backup.db -w tablesudo ETCDCTL_API=3 etcdctl snapshot restore backup.db \--data-dir=/tmp/etcd-restore
```

---

# What You Should Understand

- What etcd is.
- Why backups matter.
- Where certificates are stored.
- Why `ETCDCTL_API=3` is used (the supported etcd API version).
- Where the data directory is (typically `/var/lib/etcd` on kubeadm).
- How to verify a snapshot.
- How to restore a snapshot.

---

# Troubleshooting

You should recognize errors such as:

```
certificate signed by unknown authority
```

Usually means the wrong certificate was specified.

```
connection refused
```

The etcd service or static Pod isn't reachable.

```
permission denied
```

You likely need `sudo`.

---

# Practice Lab for Your Cluster

On your `k8s-master`:

1. Verify the etcd Pod is running.
2. Check endpoint health.
3. Create `backup.db`.
4. Verify it with `snapshot status`.
5. Copy `backup.db` to another directory.
6. Restore it to `/tmp/etcd-restore`.
7. Inspect the restored data.
8. Review `/etc/kubernetes/manifests/etcd.yaml` to understand how kubeadm runs etcd.

---

# CKA Study Priority

|Topic|Priority|
|---|---|
|Locate etcd|⭐⭐⭐⭐⭐|
|`ETCDCTL_API=3`|⭐⭐⭐⭐⭐|
|Endpoint health|⭐⭐⭐⭐⭐|
|Snapshot save|⭐⭐⭐⭐⭐|
|Snapshot status|⭐⭐⭐⭐⭐|
|Snapshot restore|⭐⭐⭐⭐⭐|
|Certificates|⭐⭐⭐⭐⭐|
|Static Pod manifest (`etcd.yaml`)|⭐⭐⭐⭐☆|
|Data directory|⭐⭐⭐⭐☆|

For your self-managed kubeadm cluster, etcd is one of the best topics to practice because you'll use the same certificate paths and commands that commonly appear in CKA-style backup and restore tasks.

### Controlplane/kubelet debugging

This is **one of the most heavily tested areas** on the CKA. You'll often be given a cluster with something broken and asked to find and fix the problem.

Since you've built your own kubeadm cluster, you can practice almost everything the exam expects.

---

# 1. Check Node Status ⭐⭐⭐⭐⭐

First command:

```
kubectl get nodes
```

Look for:

```
ReadyNotReadySchedulingDisabledUnknown
```

Get more detail:

```
kubectl describe node k8s-worker1
```

---

# 2. Check System Pods ⭐⭐⭐⭐⭐

```
kubectl get pods -n kube-system
```

Know the key components:

```
etcdkube-apiserverkube-controller-managerkube-schedulercorednskube-proxycalico-nodecalico-kube-controllers
```

---

# 3. Check Control Plane Static Pods ⭐⭐⭐⭐⭐

On the master:

```
ls /etc/kubernetes/manifests
```

You should see:

```
etcd.yamlkube-apiserver.yamlkube-controller-manager.yamlkube-scheduler.yaml
```

These are **static Pods** managed by the kubelet.

---

# 4. Kubelet Status ⭐⭐⭐⭐⭐

Very common CKA task.

```
sudo systemctl status kubelet
```

Restart:

```
sudo systemctl restart kubelet
```

Enable:

```
sudo systemctl enable kubelet
```

---

# 5. Kubelet Logs ⭐⭐⭐⭐⭐

```
sudo journalctl -u kubelet
```

Follow logs live:

```
sudo journalctl -u kubelet -f
```

Look for:

- certificate problems
- image pull failures
- container runtime errors
- API server connection issues

---

# 6. Container Runtime ⭐⭐⭐⭐⭐

Check:

```
sudo systemctl status containerd
```

Restart:

```
sudo systemctl restart containerd
```

Images:

```
sudo ctr -n k8s.io images ls
```

---

# 7. API Server ⭐⭐⭐⭐⭐

Check:

```
kubectl cluster-info
```

Or:

```
kubectl get componentstatuses
```

(API note: `componentstatuses` is deprecated in newer Kubernetes versions, but you may still encounter it in practice. On current clusters, checking the static Pods and logs is more reliable.)

---

# 8. Describe Resources ⭐⭐⭐⭐⭐

Your best troubleshooting command:

```
kubectl describe pod mypod
```

Read:

- Events
- Scheduling
- Image pulls
- Mount failures
- Readiness probe failures

---

# 9. Logs ⭐⭐⭐⭐⭐

```
kubectl logs mypod
```

Multiple containers:

```
kubectl logs mypod -c nginx
```

---

# 10. Exec into a Pod ⭐⭐⭐⭐⭐

```
kubectl exec -it mypod -- sh
```

Or:

```
kubectl exec -it mypod -- bash
```

---

# 11. Events ⭐⭐⭐⭐⭐

Often the fastest way to find the issue.

```
kubectl get events
```

Sort newest first:

```
kubectl get events --sort-by=.metadata.creationTimestamp
```

---

# 12. ImagePullBackOff ⭐⭐⭐⭐⭐

You already practiced this.

Typical causes:

- wrong image
- private registry
- bad tag
- registry unavailable

Commands:

```
kubectl describe pod
```

---

# 13. CrashLoopBackOff ⭐⭐⭐⭐⭐

Usually means:

- application crashes
- bad command
- bad configuration

Check:

```
kubectl logs
```

---

# 14. Pending Pods ⭐⭐⭐⭐⭐

Common causes:

- taints
- nodeSelector mismatch
- insufficient CPU or memory
- PVC not bound

Check:

```
kubectl describe pod
```

---

# 15. DNS Problems ⭐⭐⭐⭐☆

Check CoreDNS:

```
kubectl get pods -n kube-system
```

Test DNS:

```
kubectl exec -it busybox -- nslookup kubernetes.default
```

---

# 16. Networking ⭐⭐⭐⭐☆

Check CNI:

```
kubectl get pods -n kube-system
```

You should see:

```
calico-node
```

---

# 17. Resources ⭐⭐⭐⭐☆

Check:

```
kubectl top nodeskubectl top pods
```

(Requires Metrics Server.)

---

# Commands You Should Know by Memory

```
kubectl get nodeskubectl get pods -Akubectl describe podkubectl logskubectl exec -itkubectl get eventskubectl cluster-infosudo systemctl status kubeletsudo journalctl -u kubeletsudo systemctl restart kubeletsudo systemctl status containerd
```

---

# Typical CKA Troubleshooting Tasks

You might be asked to:

- Fix a Pod stuck in `Pending`
- Resolve an `ImagePullBackOff`
- Diagnose a `CrashLoopBackOff`
- Restart the kubelet
- Restore node connectivity
- Repair a bad Deployment YAML
- Investigate a failed mount
- Restore DNS resolution
- Fix a Service selector
- Correct an Ingress configuration

---

# Practice Lab on Your Cluster

Using your existing three-node cluster:

1. Stop the kubelet on `k8s-worker1` and observe the node become `NotReady`.
2. Restart the kubelet and verify it returns to `Ready`.
3. Deploy a Pod with an incorrect image name and diagnose the resulting `ImagePullBackOff`.
4. Create a Deployment with an incorrect label/selector and fix it.
5. Create a Pod with a `nodeSelector` that matches no node and determine why it stays `Pending`.
6. Delete a CoreDNS Pod and watch Kubernetes recreate it.
7. View logs from a running Pod and from a failing Pod.
8. Use `kubectl exec` to inspect files inside a container.

---

# CKA Study Priority

|Topic|Priority|
|---|---|
|`kubectl describe`|⭐⭐⭐⭐⭐|
|`kubectl logs`|⭐⭐⭐⭐⭐|
|`kubectl exec`|⭐⭐⭐⭐⭐|
|`kubectl get events`|⭐⭐⭐⭐⭐|
|Kubelet (`systemctl`, `journalctl`)|⭐⭐⭐⭐⭐|
|Container runtime (`containerd`)|⭐⭐⭐⭐⭐|
|Static control plane Pods|⭐⭐⭐⭐⭐|
|Pending Pods|⭐⭐⭐⭐⭐|
|`ImagePullBackOff`|⭐⭐⭐⭐⭐|
|`CrashLoopBackOff`|⭐⭐⭐⭐⭐|
|CoreDNS|⭐⭐⭐⭐☆|
|CNI (Calico)|⭐⭐⭐⭐☆|
|Metrics Server|⭐⭐⭐☆☆|

Based on the work you've already done—building a kubeadm cluster, troubleshooting `ImagePullBackOff`, fixing scheduling issues, joining worker nodes, and verifying kubelet health—you've already covered many of the practical skills this section of the CKA is designed to test. The next step is to intentionally break parts of your cluster and practice diagnosing them quickly.

### Run Pods


Running Pods is one of the **core skills** of the CKA. You should be able to create, inspect, troubleshoot, and modify Pods quickly using both imperative commands and YAML.

---

# 1. Create a Pod Imperatively ⭐⭐⭐⭐⭐

Fastest way:

```
kubectl run nginx \  --image=nginx
```

Verify:

```
kubectl get pods
```

Delete:

```
kubectl delete pod nginx
```

---

# 2. Generate YAML ⭐⭐⭐⭐⭐

Very common CKA technique.

Generate without creating:

```
kubectl run nginx \  --image=nginx \  --dry-run=client \  -o yaml > pod.yaml
```

Then:

```
kubectl apply -f pod.yaml
```

---

# 3. View Pod Details ⭐⭐⭐⭐⭐

```
kubectl get podskubectl get pods -o widekubectl describe pod nginx
```

Know how to interpret:

- Events
- Scheduling
- Image
- IP
- Node

---

# 4. Logs ⭐⭐⭐⭐⭐

```
kubectl logs nginx
```

Follow logs:

```
kubectl logs -f nginx
```

---

# 5. Execute Inside a Pod ⭐⭐⭐⭐⭐

```
kubectl exec -it nginx -- sh
```

or

```
kubectl exec -it nginx -- bash
```

Useful commands inside:

```
hostnameip addrlscatpwd
```

---

# 6. Delete Pods ⭐⭐⭐⭐⭐

```
kubectl delete pod nginx
```

Delete all Pods:

```
kubectl delete pods --all
```

---

# 7. Labels ⭐⭐⭐⭐⭐

Create with labels:

```
kubectl run nginx \--image=nginx \--labels app=web
```

View:

```
kubectl get pods --show-labels
```

---

# 8. Environment Variables ⭐⭐⭐⭐☆

Example YAML:

```
env:- name: APP_ENV  value: production
```

Verify:

```
kubectl exec nginx -- env
```

---

# 9. Resource Limits ⭐⭐⭐⭐☆

Example:

```
resources:  requests:    cpu: "100m"    memory: "128Mi"  limits:    cpu: "500m"    memory: "256Mi"
```

---

# 10. Commands and Arguments ⭐⭐⭐⭐☆

Example:

```
command:- sleepargs:- "3600"
```

---

# 11. Restart Policy ⭐⭐⭐☆☆

Know:

```
AlwaysOnFailureNever
```

---

# 12. Multiple Containers ⭐⭐⭐☆☆

Know basic Pod structure:

```
containers:- nginx- busybox
```

---

# 13. Init Containers ⭐⭐⭐⭐☆

Example:

```
initContainers:- name: init
```

Know:

- Run before app containers
- Must finish successfully

---

# 14. ImagePullBackOff ⭐⭐⭐⭐⭐

You already practiced this.

Check:

```
kubectl describe pod
```

---

# 15. CrashLoopBackOff ⭐⭐⭐⭐⭐

Check:

```
kubectl logs
```

---

# Commands to Know by Memory

```
kubectl runkubectl get podskubectl get pods -o widekubectl describe podkubectl logskubectl exec -itkubectl delete podkubectl apply -fkubectl edit pod
```

---

# YAML You Should Be Able to Write

- Simple Pod
- Labels
- Environment variables
- Resource requests/limits
- Volume mount
- ConfigMap
- Secret
- ServiceAccount
- Init Container

---

# Troubleshooting

Be comfortable diagnosing:

```
PendingImagePullBackOffCrashLoopBackOffCompletedErrorContainerCreatingTerminating
```

Use:

```
kubectl describe podkubectl logskubectl get eventskubectl exec
```

---

# Great Practice Lab for Your Cluster

Using your 3-node cluster:

### Lab 1

Create an NGINX Pod with `kubectl run`.

### Lab 2

Generate the Pod YAML with `--dry-run=client -o yaml`, edit it, and apply it.

### Lab 3

Label the Pod and query it with a label selector.

### Lab 4

Exec into the Pod and inspect the filesystem.

### Lab 5

View the logs.

### Lab 6

Delete the Pod and recreate it from YAML.

### Lab 7

Change the image to an invalid tag and troubleshoot the resulting `ImagePullBackOff`.

### Lab 8

Add CPU and memory requests and limits.

### Lab 9

Mount a ConfigMap into the Pod.

### Lab 10

Mount a PVC into the Pod and verify that data persists after the Pod is recreated.

---

# CKA Study Priority

|Topic|Priority|
|---|---|
|`kubectl run`|⭐⭐⭐⭐⭐|
|Generate YAML (`--dry-run`)|⭐⭐⭐⭐⭐|
|`kubectl get pods`|⭐⭐⭐⭐⭐|
|`kubectl describe pod`|⭐⭐⭐⭐⭐|
|`kubectl logs`|⭐⭐⭐⭐⭐|
|`kubectl exec`|⭐⭐⭐⭐⭐|
|Labels|⭐⭐⭐⭐⭐|
|Resource requests/limits|⭐⭐⭐⭐☆|
|Environment variables|⭐⭐⭐⭐☆|
|Init Containers|⭐⭐⭐⭐☆|
|Restart policies|⭐⭐⭐☆☆|
|Multi-container Pods|⭐⭐⭐☆☆|

## For your Kubernetes lab

Since you've already:

- Built a three-node kubeadm cluster,
- Deployed your Bread website,
- Created a `NodePort` Service,
- Worked through `ImagePullBackOff`,
- Used labels, `nodeSelector`, and scheduling,

the next step is to become fast at **creating and modifying Pods from memory**. A good CKA goal is to be able to create a Pod, generate its YAML, edit it, apply it, and troubleshoot it in just a few minutes. That speed is often as important as knowing the concepts.

### Containers

Containers are at the heart of Kubernetes. The CKA doesn't test Docker commands in depth, but it **does** expect you to understand how containers behave inside Pods and how to troubleshoot them.

---

# 1. Container Images ⭐⭐⭐⭐⭐

Know:

- Images come from a registry (Docker Hub, Amazon ECR, etc.)
- Kubernetes pulls images using the `image:` field.
- Image tags (`:v1`, `:latest`) matter.

Example:

```
containers:- name: nginx  image: nginx:1.27
```

Practice:

```
kubectl describe pod nginx
```

Look for the image name and tag.

---

# 2. Container States ⭐⭐⭐⭐⭐

Recognize these states:

```
ContainerCreatingRunningCompletedErrorCrashLoopBackOffImagePullBackOffErrImagePull
```

Check:

```
kubectl get podskubectl describe pod mypod
```

---

# 3. Multiple Containers in a Pod ⭐⭐⭐⭐☆

A Pod can contain more than one container.

Example:

```
containers:- name: nginx  image: nginx- name: busybox  image: busybox
```

Access a specific container:

```
kubectl logs mypod -c nginxkubectl exec -it mypod -c busybox -- sh
```

---

# 4. Init Containers ⭐⭐⭐⭐⭐

Run before the main application starts.

Example:

```
initContainers:- name: init-db  image: busybox  command: ["sh","-c","echo Initializing..."]
```

Know:

- They run one at a time.
- They must succeed before the application container starts.

---

# 5. Commands and Arguments ⭐⭐⭐⭐⭐

Override the container's default startup command.

Example:

```
command:- sleepargs:- "3600"
```

Practice:

```
kubectl exec -it mypod -- ps
```

---

# 6. Environment Variables ⭐⭐⭐⭐☆

Example:

```
env:- name: APP_ENV  value: production
```

Verify:

```
kubectl exec mypod -- env
```

---

# 7. Resource Requests and Limits ⭐⭐⭐⭐⭐

Example:

```
resources:  requests:    cpu: "100m"    memory: "128Mi"  limits:    cpu: "500m"    memory: "256Mi"
```

Check:

```
kubectl describe pod mypod
```

---

# 8. Volume Mounts ⭐⭐⭐⭐⭐

Containers mount storage using `volumeMounts`.

Example:

```
volumeMounts:- name: storage  mountPath: /data
```

---

# 9. Probes ⭐⭐⭐⭐⭐

Very common on the CKA.

### Liveness Probe

Restarts unhealthy containers.

```
livenessProbe:  httpGet:    path: /    port: 80
```

### Readiness Probe

Controls whether the Pod receives traffic.

```
readinessProbe:  httpGet:    path: /    port: 80
```

Practice:

```
kubectl describe pod
```

---

# 10. Restart Policies ⭐⭐⭐⭐☆

Know:

```
AlwaysOnFailureNever
```

---

# 11. Image Pull Policy ⭐⭐⭐⭐☆

```
imagePullPolicy: Always
```

or

```
imagePullPolicy: IfNotPresent
```

You've already used `IfNotPresent` in your Bread deployment.

---

# 12. Logs ⭐⭐⭐⭐⭐

View logs:

```
kubectl logs mypod
```

Follow:

```
kubectl logs -f mypod
```

Specific container:

```
kubectl logs mypod -c nginx
```

---

# 13. Execute into Containers ⭐⭐⭐⭐⭐

```
kubectl exec -it mypod -- sh
```

or

```
kubectl exec -it mypod -- bash
```

Useful commands:

```
hostnamepwdlsenvip addrcat
```

---

# 14. Troubleshooting Containers ⭐⭐⭐⭐⭐

Know how to fix:

```
ImagePullBackOffCrashLoopBackOffContainerCreatingOOMKilledCompleted
```

Use:

```
kubectl describe podkubectl logskubectl get events
```

---

# Commands to Practice

```
kubectl run nginx --image=nginxkubectl get podskubectl describe pod nginxkubectl logs nginxkubectl logs -f nginxkubectl exec -it nginx -- shkubectl delete pod nginxkubectl edit pod nginx
```

---

# YAML You Should Be Able to Write

- Pod with one container
- Pod with two containers
- Init container
- Environment variables
- Resource requests and limits
- Liveness probe
- Readiness probe
- Volume mounts
- Image pull policy
- Command and args

---

# Practice Lab for Your Cluster

Using your existing three-node cluster:

1. Deploy an NGINX Pod.
2. Add CPU and memory requests and limits.
3. Add environment variables and verify them.
4. Add a liveness probe and observe its behavior.
5. Add a readiness probe.
6. Create a Pod with an init container.
7. Create a Pod with two containers (for example, `nginx` and `busybox`).
8. Use `kubectl exec` to inspect each container.
9. Change the image to a bad tag and troubleshoot the `ImagePullBackOff`.
10. Fix the image and verify the Pod returns to `Running`.

---

# CKA Study Priority

|Topic|Priority|
|---|---|
|Container images|⭐⭐⭐⭐⭐|
|`kubectl logs`|⭐⭐⭐⭐⭐|
|`kubectl exec`|⭐⭐⭐⭐⭐|
|Commands & args|⭐⭐⭐⭐⭐|
|Init containers|⭐⭐⭐⭐⭐|
|Resource requests/limits|⭐⭐⭐⭐⭐|
|Liveness probes|⭐⭐⭐⭐⭐|
|Readiness probes|⭐⭐⭐⭐⭐|
|Volume mounts|⭐⭐⭐⭐⭐|
|Environment variables|⭐⭐⭐⭐☆|
|Multi-container Pods|⭐⭐⭐⭐☆|
|Image pull policy|⭐⭐⭐⭐☆|
|Restart policy|⭐⭐⭐⭐☆|

### Based on your current lab

You've already gained experience with:

- Building container images on your Docker Builder VM.
- Storing images in Amazon ECR.
- Deploying your Bread website to Kubernetes.
- Troubleshooting `ImagePullBackOff`.
- Using `imagePullPolicy`.
- Running NGINX in Pods.

The next skills to add are **liveness/readiness probes**, **init containers**, and **multi-container Pods**. Those topics appear regularly in CKA-style tasks and build directly on the work you've already completed.


- ** Kubernetes Documentation:** [https://kubernetes.io/docs/](https://kubernetes.io/docs/)

The most useful sections during the exam are:

- **kubectl Cheat Sheet:** [https://kubernetes.io/docs/reference/kubectl/cheatsheet/](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)
- **kubectl Command Reference:** [https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands/](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands/)
- **API Reference:** [https://kubernetes.io/docs/reference/kubernetes-api/](https://kubernetes.io/docs/reference/kubernetes-api/)
- **Tasks:** [https://kubernetes.io/docs/tasks/](https://kubernetes.io/docs/tasks/)
- **Concepts:** [https://kubernetes.io/docs/concepts/](https://kubernetes.io/docs/concepts/)

### For the CKA, I recommend bookmarking these sections before you start practicing:

```
https://kubernetes.io/docs/reference/kubectl/cheatsheet/https://kubernetes.io/docs/tasks/https://kubernetes.io/docs/concepts/https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands/
```

These are the pages you'll use most often for:

- Pods
- Deployments
- Services
- ConfigMaps
- Secrets
- RBAC
- Storage (PV/PVC)
- Ingress
- Troubleshooting
- `kubectl` syntax