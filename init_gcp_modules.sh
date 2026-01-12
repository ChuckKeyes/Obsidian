#!/usr/bin/env bash
set -e

# Base directory for GCP modules inside your Obsidian Templates
BASE_DIR="Templates/GCP-Templates/Modules"

# List of module folder names
MODULES=(
  "prometheus"
  "grafana"
  "jenkins"
  "docker"
  "kubernetes"
  "fargate"
  "windows_server"
  "security_hardening"
  "sagemaker"
  "bedrock"
  "gpu_ai_server"
  "cloudwatch_alarms"
)

echo "Creating GCP module folders under: $BASE_DIR"
mkdir -p "$BASE_DIR"

create_module() {
  local name="$1"
  local dir="$BASE_DIR/$name"

  echo "  -> Creating module: $name at $dir"
  mkdir -p "$dir"

  #############################################
  # main.tf
  #############################################
  cat > "$dir/main.tf" <<EOF
#############################################
# Module: $name (GCP)
# Description: TODO - describe what this module does.
#
# NOTE:
# - Do NOT put provider "google" in here.
# - Root module will pass in variables and provider.
#############################################

# Example GCP resource block (replace with real resources)
# resource "google_compute_instance" "${name}_example" {
#   name         = "\${var.name}-example"
#   project      = var.project_id
#   zone         = var.zone
#   machine_type = var.machine_type
#
#   boot_disk {
#     initialize_params {
#       image = var.image
#     }
#   }
#
#   network_interface {
#     subnetwork = var.subnetwork
#   }
#
#   tags = var.instance_tags
# }
EOF

  #############################################
  # variables.tf
  #############################################
  cat > "$dir/variables.tf" <<EOF
#############################################
# variables.tf for module: $name (GCP)
#############################################

variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
}

variable "zone" {
  description = "GCP zone"
  type        = string
}

variable "name" {
  description = "Name prefix for resources in this module"
  type        = string
}

variable "network" {
  description = "VPC network self_link or name"
  type        = string
}

variable "subnetwork" {
  description = "Subnetwork self_link or name"
  type        = string
}

variable "machine_type" {
  description = "Machine type (e.g. e2-medium)"
  type        = string
  default     = "e2-micro"
}

variable "image" {
  description = "Boot disk image (e.g. debian-cloud/debian-12)"
  type        = string
  default     = "debian-cloud/debian-12"
}

variable "instance_tags" {
  description = "Network tags for instances (firewall rules, etc.)"
  type        = list(string)
  default     = []
}

variable "service_account_email" {
  description = "Service account email (optional)"
  type        = string
  default     = ""
}
EOF

  #############################################
  # outputs.tf
  #############################################
  cat > "$dir/outputs.tf" <<EOF
#############################################
# outputs.tf for module: $name (GCP)
#############################################

# TODO: Customize outputs for this module.

# output "id" {
#   description = "Primary resource ID"
#   value       = google_compute_instance.${name}_example.id
# }

# output "ip_address" {
#   description = "Primary resource IP"
#   value       = google_compute_instance.${name}_example.network_interface[0].access_config[0].nat_ip
# }
EOF

  #############################################
  # README.md
  #############################################
  cat > "$dir/README.md" <<EOF
# Module: $name (GCP)

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

See \`variables.tf\`.

## Outputs

See \`outputs.tf\`.

## Usage (from root module)

\`\`\`hcl
module "$name" {
  source = "./Templates/GCP-Templates/Modules/$name"

  project_id = var.project_id
  region     = var.region
  zone       = var.zone
  name       = "ck-$name"

  network    = google_compute_network.main.self_link
  subnetwork = google_compute_subnetwork.main.self_link

  machine_type          = "e2-medium"
  image                 = "debian-cloud/debian-12"
  instance_tags         = ["ck-$name"]
  service_account_email = var.service_account_email
}
\`\`\`
EOF

  #############################################
  # SETUP.md
  #############################################
  cat > "$dir/SETUP.md" <<EOF
# Setup notes for module: $name (GCP)

Use this file to record:

- Any manual steps (e.g., enable APIs: compute.googleapis.com, monitoring.googleapis.com, container.googleapis.com, etc.)
- Specific machine types or images used
- Example \`terraform apply\` commands
- IAM roles / service accounts needed
- Integration notes (e.g. Prometheus scraping GKE, Grafana dashboards)
- Troubleshooting notes

This file is for your own use inside Obsidian so you remember
how you wired this module into different GCP labs.
EOF

}

# Loop modules
for m in "${MODULES[@]}"; do
  create_module "$m"
done

echo "All GCP module folders created."
