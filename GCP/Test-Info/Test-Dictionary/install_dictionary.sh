#!/bin/bash

# Test-Dictionary installer
# Run this from inside your Obsidian vault or project folder

ROOT="Test-Dictionary"

mkdir -p "$ROOT/Google Cloud Platform (PCA)"

cd "$ROOT/Google Cloud Platform (PCA)" || exit

cat > "Dictionary Index.md" <<'EOF'
# Dictionary Index

## Google Cloud Platform (PCA)

- [[01-Compute]]
- [[02-Networking]]
- [[03-Storage]]
- [[04-Databases]]
- [[05-Kubernetes (GKE)]]
- [[06-IAM & Security]]
- [[07-Monitoring & Operations]]
- [[08-CI-CD & DevOps]]
- [[09-Migration]]
- [[10-AI & Analytics]]
- [[11-Governance & Compliance]]
- [[12-Hybrid & Multi-Cloud]]
- [[13-Cost Optimization]]
- [[14-Disaster Recovery & HA]]
- [[15-PCA Exam Keywords]]
EOF

cat > "01-Compute.md" <<'EOF'
# 01 - Compute

- App Engine Standard
- Managed Instance Group
- Cloud Run
- Cloud Functions
- Cloud VMware Engine
- Cloud Deployment Manager
EOF

cat > "02-Networking.md" <<'EOF'
# 02 - Networking

- Partner Interconnect
- Dedicated Interconnect
- Private Google Access
- Global Dynamic Routing
- Global Load Balancer
- Cloud Load Balancer
- VPC Network Peering
- Private Service Connect
- Service Directory
- Direct Peering
- Carrier Peering
- Cloud CDN
- Cloud DNS
- Cloud VPN
- Transfer Appliance
EOF

cat > "03-Storage.md" <<'EOF'
# 03 - Storage

- Cloud Storage
- Object Lifecycle Management
- Persistent Disks
- no-auto-delete flag
- Nearline
- Coldline
- Archive
- Filestore
- Container Registry
- Artifact Registry
- S3 Bucket
- Linux resize2fs
EOF

cat > "04-Databases.md" <<'EOF'
# 04 - Databases

- Cloud SQL
- SQL Server
- Cloud Spanner
- Cloud Spanner Emulator
- BigQuery
- Bigtable
- Firestore
- Datastore
- AlloyDB
- MongoDB
- NoSQL
- RDB
- Pub/Sub
- Datastream
- Dataproc
- Dataflow
- Apache Spark
- Hadoop
- Blobstore
EOF

cat > "05-Kubernetes (GKE).md" <<'EOF'
# 05 - Kubernetes (GKE)

- GKE
- GKE Autopilot
- GKE Enterprise / Anthos
- Kubernetes Secrets
- Workload Identity
- Binary Authorization
- Policy Controller
- Config Sync
- Config Connector
- Anthos Service Mesh
- Vertical Pod Autoscaler
- Horizontal Pod Autoscaler
- Monitoring GKE
- Minikube
- Skaffold
- Docker
- OpenShift
EOF

cat > "06-IAM & Security.md" <<'EOF'
# 06 - IAM & Security

- IAM
- Sensitive Data Loss Protection / DLP
- Customer-Managed Encryption Key / CMEK
- Cloud KMS
- Security Command Center Premium
- Workload Identity Federation
- Identity-Aware Proxy / IAP
- VPC Service Controls
- Firewall Policies
- Cloud Armor
- Secret Manager
- Policy Tags
- Integrity Policy Baseline
- Tokenizer Service
EOF

cat > "07-Monitoring & Operations.md" <<'EOF'
# 07 - Monitoring & Operations

- Cloud Monitoring
- Cloud Logging
- Cloud Trace
- Cloud Profiler
- Cloud Ops
- Stackdriver
- VPC Flow Logs
- Prometheus
- Grafana
- Log Analytics
EOF

cat > "08-CI-CD & DevOps.md" <<'EOF'
# 08 - CI-CD & DevOps

- Cloud Build
- Artifact Registry
- Artifact Analysis
- Cloud Source Repositories
- Jenkins X
- GitHub Actions
- Binary Authorization
- Terraform
- Cloud Deployment Manager
- YAML
- JSON
- Bash Scripts
- Cron Job
EOF

cat > "09-Migration.md" <<'EOF'
# 09 - Migration

- Migration Center
- Migrate for GKE
- Backup and DR
- Cloud VMware Engine
- Transfer Appliance
EOF

cat > "10-AI & Analytics.md" <<'EOF'
# 10 - AI & Analytics

- Vertex AI
- Machine Learning / MLOps
- Large Language Model / LLM
- BigQuery ML
- Vertex AI Vizier
- Vertex AI Vision
- Vertex AI Prediction
- Vertex AI Pipelines
- Vertex AI Workbench
- Vertex AI Model Garden
- Explainable AI
- RAG
- Cloud Natural Language API
- AutoML Natural Language
- AutoML Tables
- Dialogflow ES
- Dialogflow CX
- Gemini Code Assist
- NotebookLM
- Colab Enterprise
- Vision API
- TensorFlow
- PyTorch
- Looker Studio
EOF

cat > "11-Governance & Compliance.md" <<'EOF'
# 11 - Governance & Compliance

- Organization Policy Service
- Recommender API
- Forseti Security
- Security Command Center
- VPC Service Controls
- Data Catalog Policy Tags
- DLP
- CMEK
EOF

cat > "12-Hybrid & Multi-Cloud.md" <<'EOF'
# 12 - Hybrid & Multi-Cloud

- Anthos
- Cloud VPN
- Dedicated Interconnect
- Partner Interconnect
- Direct Peering
- Carrier Peering
- OpenStack
- Cloud VMware Engine
- S3 Bucket
- AWS Lambda
EOF

cat > "13-Cost Optimization.md" <<'EOF'
# 13 - Cost Optimization

- Recommender API
- Object Lifecycle Management
- Nearline
- Coldline
- Archive
- Managed Instance Groups
- Cloud Run
- Autoscaling
EOF

cat > "14-Disaster Recovery & HA.md" <<'EOF'
# 14 - Disaster Recovery & HA

- Backup and DR
- Managed Instance Group
- Global Load Balancer
- Cloud DNS
- Cloud Storage
- Multi-region
- High Availability
- Disaster Recovery
EOF

cat > "15-PCA Exam Keywords.md" <<'EOF'
# 15 - PCA Exam Keywords

- Private Google Access
- signed URLs
- Cloud Datastore composite indexes
- distributed session management service
- Redis through Memorystore
- Application Integration
- Cloud Build
- Artifact Registry
- Artifact Analysis
- Security Command Center
- kubemci
- Locust
- JMeter
- Airflow
- Lamp Stack
EOF

echo "Dictionary installed in: $ROOT/Google Cloud Platform (PCA)"
echo "Open: Dictionary Index.md"