#!/usr/bin/env bash
set -e

# Usage: ./create_module.sh aws prometheus_vm
#        ./create_module.sh gcp gke_cluster

CLOUD="$1"      # aws or gcp
MODULE_NAME="$2"

if [ -z "$CLOUD" ] || [ -z "$MODULE_NAME" ]; then
  echo "Usage: $0 <aws|gcp> <module_name>"
  exit 1
fi

# Base paths (relative to vault root)
AWS_BASE="Templates/AWS-Templates"
GCP_BASE="Templates/GCP-Templates"

case "$CLOUD" in
  aws|AWS)
    BASE_DIR="$AWS_BASE"
    ;;
  gcp|GCP)
    BASE_DIR="$GCP_BASE"
    ;;
  *)
    echo "ERROR: CLOUD must be 'aws' or 'gcp'"
    exit 1
    ;;
esac

MODULE_DIR="$BASE_DIR/Modules/$MODULE_NAME"

echo "Creating module for '$CLOUD' at: $MODULE_DIR"
mkdir -p "$MODULE_DIR"

#############################################
# main.tf template
#############################################
cat > "$MODULE_DIR/main.tf" <<EOF
#############################################
# Module: $MODULE_NAME ($CLOUD)
# Description: Short description of what this module does.
#############################################

# NOTE:
# - Do NOT put provider "aws" or provider "google" blocks in here.
# - Root module supplies providers and passes variables in.

EOF

if [ "$CLOUD" = "aws" ] || [ "$CLOUD" = "AWS" ]; then
  cat >> "$MODULE_DIR/main.tf" <<'EOF'
# Example AWS resource (customize for this module)
# resource "aws_instance" "example" {
#   ami           = var.ami_id
#   instance_type = var.instance_type
#   subnet_id     = var.subnet_id
#   vpc_security_group_ids = var.security_group_ids
#
#   tags = {
#     Name = var.name
#   }
# }
EOF
else
  cat >> "$MODULE_DIR/main.tf" <<'EOF'
# Example GCP resource (customize for this module)
# resource "google_compute_instance" "example" {
#   name         = var.name
#   machine_type = var.machine_type
#   zone         = var.zone
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
# }
EOF
fi

#############################################
# variables.tf template
#############################################
cat > "$MODULE_DIR/variables.tf" <<EOF
#############################################
# variables.tf for module: $MODULE_NAME
#############################################

EOF

if [ "$CLOUD" = "aws" ] || [ "$CLOUD" = "AWS" ]; then
  cat >> "$MODULE_DIR/variables.tf" <<'EOF'
variable "name" {
  description = "Name tag for resources in this module"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where resources will be created"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for primary resource"
  type        = string
}

variable "security_group_ids" {
  description = "List of security group IDs to associate"
  type        = list(string)
  default     = []
}

variable "ami_id" {
  description = "AMI ID to use (if this module creates EC2 instances)"
  type        = string
  default     = ""
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}
EOF
else
  cat >> "$MODULE_DIR/variables.tf" <<'EOF'
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
  description = "Name for primary resource(s)"
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
EOF
fi

#############################################
# outputs.tf template
#############################################
cat > "$MODULE_DIR/outputs.tf" <<EOF
#############################################
# outputs.tf for module: $MODULE_NAME
#############################################

# Example output(s) - customize per module:

# output "id" {
#   description = "Primary resource ID"
#   value       = aws_instance.example.id
# }

# output "ip_address" {
#   description = "Primary resource IP"
#   value       = aws_instance.example.public_ip
# }
EOF

#############################################
# README.md template
#############################################
cat > "$MODULE_DIR/README.md" <<EOF
# Module: $MODULE_NAME ($CLOUD)

## Purpose

Short description of what this module does and when to use it.
Example: "Deploys a Prometheus VM for monitoring ASG instances in the ck-lab."

## Inputs

See \`variables.tf\`.

## Outputs

See \`outputs.tf\`.

## Usage (from root module)

\`\`\`hcl
module "$MODULE_NAME" {
  source = "$BASE_DIR/Modules/$MODULE_NAME"

  # Example arguments (update for real use)
  name              = "example-$MODULE_NAME"
  vpc_id            = aws_vpc.main.id
  subnet_id         = aws_subnet.public_a.id
  security_group_ids = [aws_security_group.example.id]

  # Plus any other variables from variables.tf...
}
\`\`\`
EOF

echo "Module skeleton created: $MODULE_DIR"
