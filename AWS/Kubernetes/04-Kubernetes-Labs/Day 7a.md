
# Day 7 — Kubernetes Storage

Yes. Day 7 is about this idea:

```
Pods are temporary.Storage must survive.
```

A Pod can die and come back with a new name/IP. A **PersistentVolumeClaim** lets the new Pod reconnect to the same storage. Kubernetes defines PersistentVolume and PersistentVolumeClaim as separate API resources so storage can be provided separately from how Pods consume it.

## Main pieces

```
PersistentVolume  = real storagePersistentVolumeClaim = request for storagePod = uses the claim
```

## Simple flow

```
PV exists ↓PVC asks for storage ↓Kubernetes binds PVC to PV ↓Pod mounts PVC ↓Data survives Pod restart
```

## Key words

|Term|Meaning|
|---|---|
|PV|Storage created by admin or cloud provider|
|PVC|Pod’s request for storage|
|StorageClass|Type/profile of storage|
|Access Mode|Who can mount it|
|Reclaim Policy|What happens after PVC is deleted|

## Access modes

```
ReadWriteOnce  = one node can mount read/writeReadOnlyMany   = many nodes can mount read-onlyReadWriteMany  = many nodes can mount read/write
```

Important: not every storage provider supports every access mode.

## Reclaim policy

```
Retain = keep data after PVC is deletedDelete = delete storage after PVC is deleted
```

For dynamic volumes, Kubernetes says the default reclaim policy is usually **Delete**, but **Retain** is safer for important data.

## StorageClass

A StorageClass is like a storage menu:

```
fast-ssdstandard-diskbackup-enabledencrypted-storage
```

Kubernetes says StorageClasses describe the types of storage an administrator offers, and PVCs can request a specific class.

## Day 7 YAML example

### 1. PersistentVolume

```
apiVersion: v1
kind: PersistentVolume
metadata:
  name: day7-pv
spec:
  capacity:
    storage: 1Gi
  accessModes:
    - ReadWriteOnce
  persistentVolumeReclaimPolicy: Retain
  hostPath:
    path: /mnt/day7-data
```

### 2. PersistentVolumeClaim

```
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: day7-pvc
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 500Mi
```

### 3. Pod using the PVC

```
apiVersion: v1
kind: Pod
metadata:
  name: storage-test-pod
spec:
  containers:
  - name: nginx
    image: nginx
    volumeMounts:
    - mountPath: /usr/share/nginx/html
      name: web-storage
  volumes:
  - name: web-storage
    persistentVolumeClaim:
      claimName: day7-pvc
```

## Commands

```
kubectl apply -f pv.yaml
kubectl apply -f pvc.yaml
kubectl apply -f pod.yaml

kubectl get pv
kubectl get pvc
kubectl get pod
kubectl describe pvc day7-pvc
```

## Break/Fix practice

### Break 1: PVC asks for too much storage

PV has:

```
1Gi
```

PVC asks for:

```
5Gi
```

Result:

```
PVC stays Pending
```

Fix: lower the PVC request or create a bigger PV.

### Break 2: Wrong access mode

PV has:

```
ReadWriteOnce
```

PVC asks for:

```
ReadWriteMany
```

Result:

```
PVC stays Pending
```

Fix: make the access modes match.

## What you should remember

```
PV = storagePVC = claim/requestPod = uses the claimStorageClass = automatic storage typeReclaimPolicy = keep or delete data
```

Day 7 is important because databases, uploads, logs, and application data need storage that survives Pod failure.