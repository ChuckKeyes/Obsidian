
# 03 – Storage

[[00-Dictionary Index|← Back to AWS Dictionary Index]]

---

## AWS Backup

**Definition:**  
A managed service for centrally configuring, scheduling, monitoring, and managing backups across supported AWS services.

AWS Backup can protect resources such as:

- EBS volumes
- EC2 instances
- RDS databases
- DynamoDB tables
- EFS file systems
- FSx file systems
- Other supported AWS resources

**SAA Exam Tip:**

Think:

**Centralized backup management across AWS services → AWS Backup**

Do not confuse AWS Backup with simply creating an S3 bucket for storing files.

---

## DataSync

**Definition:**  
A managed data-transfer service used to move large amounts of data between on-premises storage, AWS storage services, and supported cloud storage locations.

Common destinations include:

- S3
- EFS
- FSx

**SAA Exam Tip:**

Think:

**Online automated bulk data transfer → DataSync**

Typical scenario:

```text
On-Premises File Server
        ↓
     DataSync
        ↓
       S3
```

---

## EBS (Elastic Block Store)

**Definition:**  
Persistent **block storage** primarily used with EC2 instances.

An EBS volume behaves similarly to a virtual hard drive attached to a server.

Common uses:

- Operating systems
- Databases
- Applications
- Boot volumes

**Important:**

EBS volumes are created within an **Availability Zone**.

**SAA Exam Tip:**

**EC2 needs a persistent virtual hard drive → EBS**

Remember:

```text
EC2 + Block Storage = EBS
```

---

## EFS (Elastic File System)

**Definition:**  
A managed, elastic **NFS file system** that can be mounted simultaneously by multiple Linux-based compute resources.

EFS can automatically grow and shrink as files are added or removed.

**SAA Exam Tip:**

**Multiple Linux EC2 instances need shared files → EFS**

Think:

```text
EC2 ─┐
EC2 ─┼── EFS
EC2 ─┘
```

---

## FSx for Lustre

**Definition:**  
A high-performance managed file system designed for workloads requiring extremely fast storage throughput.

Common workloads:

- High-performance computing (HPC)
- Machine learning
- Financial modeling
- Video processing
- Large-scale analytics

It can integrate with Amazon S3.

**SAA Exam Tip:**

**HPC + extremely high-performance file storage → FSx for Lustre**

The word **Lustre** should make you think:

> PERFORMANCE.

---

## FSx for NetApp ONTAP

**Definition:**  
Managed AWS storage based on NetApp ONTAP technology.

Supports multiple storage protocols, including:

- NFS
- SMB
- iSCSI

Useful for organizations already using NetApp or applications requiring enterprise NAS/storage capabilities.

**SAA Exam Tip:**

Look for:

**Existing NetApp environment + migration to AWS → FSx for NetApp ONTAP**

You do **not** need to become a NetApp administrator for SAA.

Recognition is the important part.

---

## FSx for OpenZFS

**Definition:**  
A managed shared file storage service based on the OpenZFS file system.

Designed for workloads that depend on ZFS-compatible features and high-performance file storage.

**SAA Exam Tip:**

Look for:

**Existing ZFS/OpenZFS workload → FSx for OpenZFS**

Again, this is primarily a **recognition service** for SAA.

---

## FSx for Windows File Server

**Definition:**  
A managed Windows file system providing shared file storage using the **SMB protocol**.

It integrates with Microsoft Active Directory.

Common uses:

- Windows applications
- Windows home directories
- Shared corporate drives
- Microsoft workloads

**SAA Exam Tip:**

**Windows + SMB + shared file storage → FSx for Windows File Server**

Think:

```text
Windows Servers
      ↓
     SMB
      ↓
FSx for Windows
```

---

## S3 (Simple Storage Service)

**Definition:**  
Highly scalable AWS **object storage** used to store files and other objects.

Common uses:

- Backups
- Images
- Documents
- Logs
- Static websites
- Data lakes
- Application assets

S3 stores data as:

```text
Bucket
  ↓
Object
```

**SAA Exam Tip:**

**Object storage → S3**

S3 is not:

- Block storage
- A traditional mounted disk
- A traditional file system

Know:

- Versioning
- Lifecycle policies
- Replication
- Encryption
- Bucket policies
- Storage classes
- Object Lock
- Pre-signed URLs

---

## S3 Glacier

**Definition:**  
S3 archival storage classes designed for long-term data that is accessed infrequently.

Important archival options include:

### S3 Glacier Instant Retrieval

Archive data that still requires millisecond access.

### S3 Glacier Flexible Retrieval

Low-cost archive storage where retrieval can take minutes to hours.

### S3 Glacier Deep Archive

Very low-cost storage for long-term archives where retrieval can take hours.

**SAA Exam Tip:**

Think:

**Long-term archive → Glacier**

**Lowest-cost long-term archive → Glacier Deep Archive**

---

## S3 Intelligent-Tiering

**Definition:**  
An S3 storage class that automatically moves objects between access tiers based on changing access patterns.

Useful when you **do not know how frequently objects will be accessed**.

**SAA Exam Tip:**

**Unpredictable or changing access patterns → S3 Intelligent-Tiering**

AWS handles the tier movement automatically.

---

## Snowball Edge

**Definition:**  
A physical AWS device used to transfer large amounts of data between an organization and AWS when transferring everything across the network would be too slow or impractical.

AWS ships the device to the customer.

The customer copies data to it and returns it to AWS.

**SAA Exam Tip:**

**Large offline data migration → Snowball Edge**

Think:

> "The network would take weeks/months to transfer the data."

---

## Snowcone

**Definition:**  
A small, portable AWS edge computing and data-transfer device.

Designed for environments where a larger Snowball Edge device may be impractical.

Can be useful in:

- Remote locations
- Factories
- Vehicles
- Edge environments

**SAA Exam Tip:**

**Small portable edge device → Snowcone**

Think:

> Snowcone = smallest Snow-family device.

---

## Snowmobile

**Definition:**  
An extremely large-scale physical data-transfer solution designed for moving enormous datasets to AWS.

The storage system is transported using a secure shipping container/truck.

**SAA Exam Tip:**

**Exabytes of data → Snowmobile**

Think:

```text
Snowcone      → Small
Snowball Edge → Large
Snowmobile    → ENORMOUS
```

---

## Storage Gateway

**Definition:**  
A hybrid cloud storage service connecting on-premises environments with AWS cloud storage.

It allows existing on-premises applications to use familiar storage protocols while data is integrated with AWS storage.

Major gateway types include:

### S3 File Gateway

Provides file-based access to objects stored in S3.

### Tape Gateway

Provides virtual tape infrastructure backed by AWS storage.

### Volume Gateway

Provides block-storage volumes integrated with AWS.

**SAA Exam Tip:**

**On-premises applications need ongoing hybrid access to AWS storage → Storage Gateway**

This is different from DataSync.

```text
Storage Gateway
= Hybrid storage relationship

DataSync
= Move/synchronize data
```

---

# SAA Storage Types

This is one of the most important tables on this page.

| Storage Type | AWS Service | Think |
|---|---|---|
| **Object** | S3 | Files/objects at massive scale |
| **Block** | EBS | EC2 hard drive |
| **File – Linux/NFS** | EFS | Shared Linux storage |
| **File – Windows/SMB** | FSx for Windows | Shared Windows storage |
| **High Performance File** | FSx for Lustre | HPC |
| **NetApp** | FSx for NetApp ONTAP | Enterprise NetApp |
| **ZFS** | FSx for OpenZFS | ZFS workloads |

---

# EBS vs EFS vs S3

This comparison is extremely important for SAA.

### EBS

```text
EC2
 │
 ▼
EBS

BLOCK STORAGE
```

Think:

> Hard drive.

---

### EFS

```text
EC2 ─┐
EC2 ─┼──► EFS
EC2 ─┘

SHARED FILE STORAGE
```

Think:

> Linux network file server.

---

### S3

```text
Applications
    │
    ▼
 S3 Bucket
    │
    ├── image.jpg
    ├── backup.zip
    └── report.pdf

OBJECT STORAGE
```

Think:

> Massive object repository.

---

# Storage Gateway vs DataSync vs Snow Family

Another major SAA distinction.

| Requirement | Service |
|---|---|
| Ongoing hybrid storage | **Storage Gateway** |
| Online data migration/synchronization | **DataSync** |
| Physical offline migration | **Snowball Edge** |
| Small portable edge device | **Snowcone** |
| Extremely massive physical migration | **Snowmobile** |

---

# SAA Quick Recognition

| Question says... | Think... |
|---|---|
| Object storage | **S3** |
| EC2 persistent disk | **EBS** |
| Shared Linux file system | **EFS** |
| Windows SMB shares | **FSx for Windows** |
| HPC storage | **FSx for Lustre** |
| Existing NetApp workloads | **FSx for NetApp ONTAP** |
| Existing ZFS workloads | **FSx for OpenZFS** |
| Unknown S3 access pattern | **S3 Intelligent-Tiering** |
| Long-term archive | **S3 Glacier** |
| Lowest-cost archive | **Glacier Deep Archive** |
| Centralized AWS backups | **AWS Backup** |
| On-premises hybrid storage | **Storage Gateway** |
| Online migration to AWS storage | **DataSync** |
| Offline bulk migration | **Snowball Edge** |
| Small portable edge storage | **Snowcone** |
| Exabyte-scale migration | **Snowmobile** |

---

# SAA Exam Traps

### EBS vs EFS

**One EC2 server needs a disk:**

→ EBS

**Multiple Linux servers need shared storage:**

→ EFS

---

### EFS vs FSx Windows

**Linux + NFS:**

→ EFS

**Windows + SMB:**

→ FSx for Windows

---

### Storage Gateway vs DataSync

**Application needs continued access between on-premises and AWS:**

→ Storage Gateway

**Need to move a large dataset into AWS:**

→ DataSync

---

### DataSync vs Snowball

**Good network connection available:**

→ DataSync

**Network transfer would take too long:**

→ Snowball Edge

---

### Backup vs Archive

These are not necessarily the same requirement.

**Need centralized backup policies and recovery:**

→ AWS Backup

**Need inexpensive long-term object retention:**

→ S3 Glacier

---

## Related AWS Dictionary Pages

- [[01-Compute]]
- [[02-Networking]]
- [[04-Databases]]
- [[09-Migration & Transfer]]
- [[13-Cost Optimization]]
- [[14-Disaster Recovery & HA]]
- [[15-SAA Exam Keywords]]

---

#AWS #SAA #SAA-C03 #Storage