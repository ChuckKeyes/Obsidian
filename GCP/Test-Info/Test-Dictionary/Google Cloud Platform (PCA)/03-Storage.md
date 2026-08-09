

## Artifact Registry

**Definition:**

Artifact Registry is Google Cloud's managed repository for storing and managing **container images, language packages, and build artifacts**. It replaces Container Registry and integrates with Cloud Build, GKE, Cloud Run, and Binary Authorization.

**PCA Exam Tip:**

If the question says **"store Docker images," "package repository,"** or **"container image scanning,"** the answer is **Artifact Registry**.

---
## Archive Storage

**Definition:**

Archive Storage is the **lowest-cost** Cloud Storage class designed for **long-term archival** and disaster recovery. Data is rarely accessed and has the highest retrieval latency and minimum storage duration.

**PCA Exam Tip:**

If the question says **"store data for years," "compliance archives,"** or **"rarely accessed,"** the answer is **Archive Storage**.

---
# Bucket Lock

**Definition:**

Bucket Lock is a Cloud Storage feature that **enforces a retention policy**, preventing objects from being modified or deleted until the retention period expires.

**PCA Exam Tip:**

If the question says **"meet compliance requirements,"** **"prevent deletion,"** **"immutable storage,"** or **"retention policy,"** think **Bucket Lock**.


---
## Cloud Storage

**Definition:**

Cloud Storage is Google Cloud's fully managed **object storage** service used to store files, images, videos, backups, logs, and application data. It offers multiple storage classes to balance cost and access frequency.

**PCA Exam Tip:**

If the question says **"store unstructured files," "object storage,"** or **"high durability,"** the answer is **Cloud Storage**.

---

### Cloud Storage FUSE

**Definition:**

Cloud Storage FUSE allows Linux applications to **mount a Cloud Storage bucket as a local file system**, enabling applications to access Cloud Storage objects using standard file-system operations.

**Best For:**

- Machine learning datasets
- AI training workloads
- Large datasets stored in Cloud Storage
- Sequential/read-heavy workloads
- Applications expecting filesystem paths

**Not Best For:**

- File locking
- Full POSIX filesystem semantics
- Complex filesystem operations
- Workloads requiring a traditional NFS filesystem

**PCA Exam Tip:**

If a question says:

> **"Data is in Cloud Storage + application needs filesystem access + doesn't require full POSIX/NFS functionality"**

Think:
#### Cloud Storage FUSE

---
## Coldline Storage

**Definition:**

Coldline Storage is a low-cost Cloud Storage class intended for **data accessed infrequently**, such as disaster recovery backups and archived datasets.

**PCA Exam Tip:**

If the question says **"backup data accessed a few times per year,"** the answer is **Coldline Storage**.

---
## Container Registry _(Legacy)_

**Definition:**

Container Registry is Google's legacy service for storing Docker container images. Google recommends using **Artifact Registry** for all new projects.

**PCA Exam Tip:**

If the question mentions **"legacy container image repository,"** the answer is **Container Registry**. For new deployments, choose **Artifact Registry**.

---
## Filestore

**Definition:**

Filestore is Google Cloud's fully managed **Network File System (NFS)** service that provides shared file storage for Compute Engine, GKE, and other applications requiring a common filesystem.

**PCA Exam Tip:**

If the question says **"shared file storage," "NFS,"** or **"multiple VMs or Pods accessing the same files,"** the answer is **Filestore**.

---
## Linux `resize2fs`

**Definition:**

`resize2fs` is a Linux command used to **expand or shrink an ext2/ext3/ext4 filesystem** after increasing the size of a Persistent Disk. After resizing a Google Cloud disk, the filesystem must also be expanded before the operating system can use the additional space.

**PCA Exam Tip:**

If the question says **"Persistent Disk was increased but Linux still shows the old size,"** the answer is to run **`resize2fs`** (for ext4 filesystems).

---
# Local SSD

**Definition:**

Local SSD is **high-performance solid-state storage** that is **physically attached to a Compute Engine VM**. It provides very low latency and high I/O performance but **the data is not persistent** if the VM is stopped, terminated, or the host fails.

**PCA Exam Tip:**

If the question says **"highest disk performance,"** **"temporary storage,"** or **"very high IOPS with no persistence,"** think **Local SSD**.

---
## Nearline Storage

**Definition:**

Nearline Storage is a low-cost Cloud Storage class designed for **data accessed about once per month**, such as backups and long-term datasets.

**PCA Exam Tip:**

If the question says **"monthly access"** or **"low-cost backup storage,"** the answer is **Nearline Storage**.

---
## no-auto-delete Flag

**Definition:**

The **`--no-auto-delete`** flag prevents a Persistent Disk from being automatically deleted when its attached Compute Engine VM is deleted. This protects important data stored on the disk.

**PCA Exam Tip:**

If the question says **"delete the VM but keep the data,"** the answer is to use the **`--no-auto-delete`** flag (or disable auto-delete for the disk).

---
## Object Lifecycle Management

**Definition:**

Object Lifecycle Management automatically transitions or deletes Cloud Storage objects based on rules such as **object age, storage class, or creation date**, helping reduce storage costs without manual intervention.

**PCA Exam Tip:**

If the question says **"automatically move old objects to cheaper storage"** or **"delete objects after a retention period,"** the answer is **Object Lifecycle Management**.

---
# Object Versioning

**Definition:**

Object Versioning is a Cloud Storage feature that **preserves previous versions of objects** whenever they are overwritten or deleted, allowing recovery of earlier versions.

**PCA Exam Tip:**

If the question says **"restore deleted files,"** **"recover previous versions,"** or **"protect against accidental overwrites,"** think **Object Versioning**.

---
# Persistent Disk

**Definition:**

Persistent Disk is Google Cloud's durable **block storage** service for Compute Engine virtual machines and GKE nodes. Data remains available even if the VM is stopped or restarted, and disks can be resized without recreating them.

**PCA Exam Tip:**

If the question says **"boot disk," "block storage,"** or **"persistent VM storage,"** the answer is **Persistent Disk**.

---
# Standard Storage

**Definition:**

Standard Storage is the **default Cloud Storage class** designed for data that is **frequently accessed**. It provides low-latency access and high availability for active applications, websites, and frequently used files.

**PCA Exam Tip:**

If the question says **"frequently accessed data,"** **"active application storage,"** or **"low-latency object storage,"** think **Standard Storage**.

---
# Signed URLs

**Definition:**

Signed URLs provide **temporary, secure access** to a private Cloud Storage object without making the entire bucket public. The URL expires after a specified time.

**PCA Exam Tip:**

If the question says **"temporary access to a private file,"** **"share a private object,"** or **"time-limited download,"** think **Signed URLs**.

---
# Storage Classes

**Definition:**

Storage Classes are Cloud Storage options that balance **cost, availability, and access frequency**. The available classes are **Standard, Nearline, Coldline, and Archive**.

**PCA Exam Tip:**

If the question says **"store data based on how often it is accessed,"** think **Storage Classes**.

---
# Transfer Appliance

**Definition:**

Transfer Appliance is a **physical device provided by Google** that allows organizations to **transfer very large amounts of on-premises data** to Google Cloud without relying on the internet. The appliance is shipped to the customer, loaded with data, and returned to Google for upload into Cloud Storage.

**PCA Exam Tip:**

If the question says **"petabytes of on-premises data,"** **"limited network bandwidth,"** or **"offline data migration,"** think **Transfer Appliance**.

---
# Uniform Bucket-Level Access

**Definition:**

Uniform Bucket-Level Access (UBLA) disables individual object ACLs and manages permissions **only through Cloud IAM policies** at the bucket level, simplifying access control.

**PCA Exam Tip:**

If the question says **"manage permissions with IAM only,"** **"disable object ACLs,"** or **"uniform access control,"** think **Uniform Bucket-Level Access**.