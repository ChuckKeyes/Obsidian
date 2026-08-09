
# 01 – Compute

[[00-Dictionary Index|← Back to AWS Dictionary Index]]

---

## AMI (Amazon Machine Image)

**Definition:**  
A template used to launch EC2 instances. An AMI contains the operating system and can also contain applications, configuration, and other software required by the instance.

**SAA Exam Tip:**  
Think **"reusable EC2 server image."** AMIs can be copied between AWS Regions and shared between AWS accounts.

---

## App Runner

**Definition:**  
A managed AWS service for deploying web applications and APIs directly from source code or container images without managing the underlying infrastructure.

**SAA Exam Tip:**  
Think **"deploy a web application/container without managing servers."**

---

## Auto Scaling

**Definition:**  
Automatically adjusts the number of EC2 instances based on demand, health, schedules, or defined scaling policies.

**SAA Exam Tip:**  
Think **elasticity + availability**. Auto Scaling Groups can replace unhealthy instances and distribute instances across multiple Availability Zones.

**Common triggers:**
- CPU utilization
- ALB request count
- CloudWatch metrics
- SQS queue depth
- Scheduled scaling

---

## AWS Batch

**Definition:**  
A managed service for running batch computing workloads. AWS Batch provisions and manages the compute resources needed to execute submitted jobs.

**SAA Exam Tip:**  
Think **"large numbers of scheduled or queued compute jobs."**

---

## EC2 (Elastic Compute Cloud)

**Definition:**  
AWS virtual server service that provides resizable compute capacity in the cloud.

EC2 instances can run Linux or Windows and are available in many instance families optimized for compute, memory, storage, accelerated computing, and general-purpose workloads.

**SAA Exam Tip:**  
Think **"I need control over the virtual server."**

Know:
- Instance types
- Security groups
- EBS
- AMIs
- Auto Scaling
- User data
- IAM roles
- Placement Groups
- Purchasing options

---

## ECS (Elastic Container Service)

**Definition:**  
AWS-managed container orchestration service used to deploy, manage, and scale containerized applications.

ECS can run containers on:

- EC2
- AWS Fargate

**SAA Exam Tip:**  
Think **"AWS-native container orchestration."**

---

## EKS (Elastic Kubernetes Service)

**Definition:**  
AWS-managed Kubernetes service. AWS manages the Kubernetes control plane while workloads can run on EC2 instances or AWS Fargate.

**SAA Exam Tip:**  
If the requirement specifically says **Kubernetes**, think **EKS**.

---

## Elastic Beanstalk

**Definition:**  
Platform-as-a-Service (PaaS) that deploys and manages applications while AWS handles much of the underlying infrastructure.

You upload application code and Elastic Beanstalk can provision resources such as:

- EC2
- Auto Scaling
- Load Balancers
- Monitoring

**SAA Exam Tip:**  
Think **"developers want to deploy code without manually building the AWS infrastructure."**

---

## Elastic IP Address (EIP)

**Definition:**  
A static public IPv4 address that can be associated with AWS resources such as EC2 instances.

**SAA Exam Tip:**  
Think **"public IP that must remain fixed."**

Elastic IP addresses are scarce IPv4 resources and incur charges under AWS's public IPv4 pricing.

---

## Fargate

**Definition:**  
Serverless compute engine for containers that works with ECS and EKS.

AWS manages the underlying servers and infrastructure while you define the container workload and required CPU/memory.

**SAA Exam Tip:**  
Think:

**Containers + don't manage EC2 instances → Fargate**

---

## Lambda

**Definition:**  
AWS serverless compute service that runs code in response to events without requiring you to provision or manage servers.

Common triggers include:

- S3
- API Gateway
- EventBridge
- SQS
- SNS
- DynamoDB Streams

**SAA Exam Tip:**  
Think **event-driven + short-lived processing + no servers to manage**.

Lambda execution has a maximum runtime of **15 minutes** per invocation.

---

## Launch Templates

**Definition:**  
Reusable configuration templates for launching EC2 instances.

A launch template can define:

- AMI
- Instance type
- Security groups
- IAM role
- Storage
- User data
- Network settings

**SAA Exam Tip:**  
Auto Scaling Groups commonly use **Launch Templates** to determine how new EC2 instances should be created.

---

## Lightsail

**Definition:**  
Simplified AWS compute platform providing virtual servers, storage, networking, and databases using predictable bundled pricing.

**SAA Exam Tip:**  
Think **simple website or small application where full AWS infrastructure complexity isn't required.**

---

## Local Zones

**Definition:**  
AWS infrastructure placed near large population and industry centers to provide very low-latency access to selected AWS services.

**SAA Exam Tip:**  
Think:

**Very low latency + users geographically far from an AWS Region → Local Zone**

---

## Outposts

**Definition:**  
AWS-managed hardware installed at a customer's on-premises location that provides AWS infrastructure and services inside the customer's data center.

**SAA Exam Tip:**  
Think:

**AWS services must run on-premises → AWS Outposts**

Common reasons:
- Low latency
- Local processing
- Data residency
- Hybrid cloud

---

## Placement Groups

**Definition:**  
Control how EC2 instances are physically placed within AWS infrastructure.

### Cluster Placement Group

Places instances close together.

**Use:** High-performance, low-latency networking.

### Spread Placement Group

Places instances on separate underlying hardware.

**Use:** Reduce correlated hardware failures.

### Partition Placement Group

Divides instances into separate logical partitions.

**Use:** Large distributed workloads such as Hadoop, Cassandra, and Kafka.

**SAA Exam Tip:**

- **Maximum network performance → Cluster**
- **Maximum separation → Spread**
- **Large distributed system → Partition**

---

## Reserved Instances (RI)

**Definition:**  
EC2 pricing model providing significant discounts compared with On-Demand pricing in exchange for a **1-year or 3-year commitment**.

**SAA Exam Tip:**  
Think **predictable, long-running EC2 workloads**.

Do not confuse Reserved Instances with capacity reservation. A pricing reservation does not always mean physical EC2 capacity has been reserved.

---

## Savings Plans

**Definition:**  
AWS pricing model that provides discounts in exchange for committing to a consistent amount of compute usage, measured in dollars per hour, for **1 or 3 years**.

Major types include:

### Compute Savings Plans
More flexible and can apply across eligible EC2 usage, Fargate, and Lambda.

### EC2 Instance Savings Plans
Less flexible but can provide greater savings for specified EC2 usage characteristics.

**SAA Exam Tip:**  
Think **long-term compute discount with more flexibility than traditional Reserved Instances.**

---

## Spot Instances

**Definition:**  
Unused EC2 capacity offered at substantial discounts compared with On-Demand pricing.

AWS can interrupt Spot Instances when AWS needs the capacity back.

**Best for:**
- Batch processing
- Data analysis
- CI/CD workers
- Fault-tolerant applications
- Flexible workloads

**SAA Exam Tip:**  
Think:

**Cheapest EC2 + workload can tolerate interruption → Spot Instances**

Avoid Spot for workloads that cannot tolerate interruption unless the architecture is specifically designed around that behavior.

---

## Wavelength

**Definition:**  
AWS infrastructure designed to place compute and storage services within telecommunications providers' 5G networks, reducing latency between mobile devices and applications.

**SAA Exam Tip:**  
Think:

**5G + ultra-low-latency mobile application → AWS Wavelength**

Examples:
- Gaming
- AR/VR
- Connected vehicles
- Real-time mobile applications

---

# SAA Quick Recognition

| Question says... | Think... |
|---|---|
| Virtual server | **EC2** |
| Reusable EC2 image | **AMI** |
| Automatically add/remove EC2 instances | **Auto Scaling** |
| Standard configuration for new EC2 instances | **Launch Template** |
| Static public IPv4 address | **Elastic IP** |
| Very low latency between EC2 instances | **Cluster Placement Group** |
| Separate EC2 instances across hardware | **Spread Placement Group** |
| Interruptible, cheapest EC2 capacity | **Spot Instances** |
| Predictable EC2 workload + commitment | **Reserved Instances** |
| Flexible long-term compute discount | **Savings Plans** |
| AWS container orchestration | **ECS** |
| Kubernetes | **EKS** |
| Serverless containers | **Fargate** |
| Event-driven serverless code | **Lambda** |
| Batch processing jobs | **AWS Batch** |
| Deploy web app without managing infrastructure | **App Runner / Elastic Beanstalk** |
| Simple small server/application | **Lightsail** |
| AWS hardware/services on premises | **Outposts** |
| AWS compute closer to metro users | **Local Zones** |
| 5G edge computing | **Wavelength** |

---

## Related AWS Dictionary Pages

- [[GCP/Test-Info/Test-Dictionary/Google Cloud Platform (PCA)/02-Networking]]
- [[GCP/Test-Info/Test-Dictionary/Google Cloud Platform (PCA)/03-Storage]]
- [[05-Containers & Kubernetes]]
- [[06-IAM & Security]]
- [[13-Cost Optimization]]
- [[14-Disaster Recovery & HA]]
- [[15-SAA Exam Keywords]]

---

#AWS #SAA #SAA-C03 #Compute