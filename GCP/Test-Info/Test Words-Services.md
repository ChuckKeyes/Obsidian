
# ☁️ GCP → AWS Service Mapping (Your Study Sheet)

---

## 🌐 Networking & Connectivity

|GCP|AWS Equivalent|
|---|---|
|Virtual Private Cloud|Amazon VPC|
|Cloud VPN|Site-to-Site VPN|
|Dedicated Interconnect|Direct Connect|
|Partner Interconnect|Direct Connect (via partner)|
|Direct Peering|AWS Direct Connect Public VIF|
|Carrier Peering|Direct Connect (carrier model)|
|Private Google Access|VPC Endpoint / PrivateLink|
|Cloud DNS|Route 53|
|CDN|CloudFront|
|Cloud Armor|AWS WAF + Shield|
|Cloud IDS|AWS GuardDuty / Network Firewall|
|VPC Service Controls|PrivateLink + SCP + IAM boundaries|

---

## 🖥️ Compute & Containers

|GCP|AWS Equivalent|
|---|---|
|Compute Engine|EC2|
|GKE (Kubernetes Engine)|EKS|
|Cloud Run|AWS Fargate / App Runner|
|App Engine|Elastic Beanstalk|
|App Engine Flexible|ECS / EC2|
|Anthos|EKS Anywhere / Hybrid Kubernetes|
|Anthos Service Mesh|AWS App Mesh|
|Anthos Config Management|AWS Config + Systems Manager|
|Minikube|Local Kubernetes (no AWS equivalent)|
|OpenShift|ROSA (Red Hat OpenShift on AWS)|
|Tanzu|VMware Tanzu on AWS|

---

## 🗄️ Databases & Storage

|GCP|AWS Equivalent|
|---|---|
|Cloud SQL (MySQL/Postgres)|RDS|
|Cloud Spanner|Aurora Global / DynamoDB (hybrid concept)|
|Bigtable|DynamoDB|
|Firestore / Datastore|DynamoDB|
|BigQuery|Redshift / Athena|
|Cloud Storage|S3|
|Filestore|EFS|
|Gcsfuse|S3FS|
|Blobstore|S3|
|Read Replica / Failover|RDS Read Replica / Multi-AZ|
|Sharding|DynamoDB partitioning / Aurora sharding|

---

## 📊 Data & Analytics

|GCP|AWS Equivalent|
|---|---|
|Dataflow|AWS Glue / Kinesis Data Analytics|
|Dataproc|EMR|
|Datalab|SageMaker Notebook|
|Dataprep|AWS Glue DataBrew|
|Vertex AI|SageMaker|
|Apache Spark / Hadoop|EMR|
|BigQuery Billing Export|Cost Explorer / CUR|

---

## 🔐 Security & Identity

|GCP|AWS Equivalent|
|---|---|
|IAM|IAM|
|Cloud DLP|Macie|
|KMS|KMS|
|Secret Manager|Secrets Manager|
|Identity-Aware Proxy (IAP)|AWS Verified Access / ALB + Cognito|
|SAML SSO|AWS IAM Identity Center|
|Binary Authorization|ECR scanning + IAM policies|
|Shielded VM|Nitro Enclaves / Secure Boot EC2|
|VPC Service Controls|PrivateLink + SCP|
|Cloud Security Scanner|Inspector|

---

## 📈 Monitoring, Logging, DevOps

|GCP|AWS Equivalent|
|---|---|
|Stackdriver (Cloud Monitoring)|CloudWatch|
|Cloud Logging|CloudWatch Logs|
|Cloud Debugger|X-Ray / CloudWatch Insights|
|Alerting Policy|CloudWatch Alarms|
|Asset Inventory / History|AWS Config|
|Deployment Manager|CloudFormation|
|Cloud Functions|AWS Lambda|
|Spinnaker|CodePipeline / CodeDeploy|
|Jenkins|Jenkins (same)|

---

## 🔄 DevOps / CI-CD / Config

|GCP|AWS Equivalent|
|---|---|
|Config Management (Anthos)|Systems Manager|
|Puppet / Ansible|Same tools (cloud-agnostic)|
|Blue-Green Deployment|CodeDeploy|
|Canary Releases|CodeDeploy / App Mesh|
|Instance Group Updater|Auto Scaling Rolling Updates|

---

## 🧠 Concepts (No Direct Service Match)

|Concept|AWS Equivalent|
|---|---|
|Microservices|Same concept|
|Lifecycle Management|S3 Lifecycle / Backup policies|
|PCI DSS / GDPR|Compliance frameworks (shared responsibility)|
|Hot Disaster Recovery|Multi-region failover|
|Binary Logging|RDS binlog|
|Semisynchronous replication|Aurora replication|
|OS patch management|Systems Manager Patch Manager|

---

## 🧰 Tools / CLI

|GCP|AWS Equivalent|
|---|---|
|gsutil|aws s3|
|bq|aws athena / redshift query|
|.boto config|AWS CLI config|

---

# 🔥 Important Exam Insights (VERY IMPORTANT)

## 🧠 1. Not everything is 1:1

Example:

- BigQuery ≠ Redshift exactly
- Spanner has **no true AWS equivalent**

---

## 🧠 2. GCP is more “managed-first”

- BigQuery → serverless
- Dataflow → serverless

AWS often:

- Requires more setup

---

## 🧠 3. Networking differences (your strength)

- GCP VPC = global
- AWS VPC = regional

---

# 🎯 How to use this

- Study **patterns**, not just names
- Translate questions mentally:
    - “BigQuery” → “data warehouse”
    - “Cloud Armor” → “WAF”

---

# ✅ Final Answer

👉 You now have a **GCP ↔ AWS mapping sheet** covering:

- Networking
- Compute
- Data
- Security
- DevOps