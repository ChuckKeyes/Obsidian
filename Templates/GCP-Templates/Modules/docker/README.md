# Module: docker (GCP)

## Purpose

TODO: Briefly describe what this module does.

Examples:
- prometheus: Deploys a Prometheus VM on GCE to monitor GCP workloads.
- grafana: Grafana VM/dashboard for Prometheus or Cloud Monitoring.
- jenkins: CI/CD Jenkins server on GCE.
- docker: Single VM with Docker engine installed.
- kubernetes: Single-node GKE Autopilot or k3s on GCE.
- fargate: Placeholder / notes for AWS Fargate from GCP labs.
- windows_server: Windows Server VM (RDP) on GCE.
- security_hardening: Hardened Linux VM or security baseline.
- sagemaker: Placeholder / hybrid AWS–GCP ML workflow notes.
- bedrock: Placeholder / Bedrock integration from GCP-side services.
- gpu_ai_server: GPU-enabled VM for AI workloads on GCE.
- cloudwatch_alarms: Placeholder / map to Cloud Monitoring alerting.

## Inputs

See `variables.tf`.

## Outputs

See `outputs.tf`.

## Usage (from root module)

```hcl
module "docker" {
  source = "./Templates/GCP-Templates/Modules/docker"

  project_id = var.project_id
  region     = var.region
  zone       = var.zone
  name       = "ck-docker"

  network    = google_compute_network.main.self_link
  subnetwork = google_compute_subnetwork.main.self_link

  machine_type          = "e2-medium"
  image                 = "debian-cloud/debian-12"
  instance_tags         = ["ck-docker"]
  service_account_email = var.service_account_email
}
```
