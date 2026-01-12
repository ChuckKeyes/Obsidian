#!/usr/bin/env bash
set -e

# Base directory for AWS modules inside your Obsidian Templates
BASE_DIR="Templates/AWS-Templates/Modules"

# List of module folder names
MODULES=(
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

echo "Creating AWS module folders under: $BASE_DIR"
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
# Module: $name (AWS)
# Description: TODO - describe what this module does.
#
# NOTE:
# - Do NOT put provider "aws" in here.
# - Root module will pass in variables and provider.
#############################################

# Example resource block (replace with real resources)
# resource "aws_instance" "${name}_example" {
#   ami           = var.ami_id
#   instance_type = var.instance_type
#   subnet_id     = var.subnet_id
#   vpc_security_group_ids = var.security_group_ids
#
#   tags = {
#     Name = "\${var.name}-example"
#   }
# }
EOF

  #############################################
  # variables.tf
  #############################################
  cat > "$dir/variables.tf" <<EOF
#############################################
# variables.tf for module: $name
#############################################

variable "name" {
  description = "Name prefix for resources in this module"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where resources will be created"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for primary resource(s)"
  type        = string
}

variable "security_group_ids" {
  description = "List of security group IDs to associate"
  type        = list(string)
  default     = []
}

variable "ami_id" {
  description = "AMI ID (if this module creates EC2 instances)"
  type        = string
  default     = ""
}

variable "instance_type" {
  description = "EC2 instance type (if used)"
  type        = string
  default     = "t3.micro"
}
EOF

  #############################################
  # outputs.tf
  #############################################
  cat > "$dir/outputs.tf" <<EOF
#############################################
# outputs.tf for module: $name
#############################################

# TODO: Customize outputs for this module.

# output "id" {
#   description = "Primary resource ID"
#   value       = aws_instance.${name}_example.id
# }

# output "public_ip" {
#   description = "Primary resource public IP"
#   value       = aws_instance.${name}_example.public_ip
# }
EOF

  #############################################
  # README.md
  #############################################
  cat > "$dir/README.md" <<EOF
# Module: $name (AWS)

## Purpose

TODO: Briefly describe what this module does.

Examples:
- grafana: Deploys a Grafana VM that visualizes Prometheus metrics.
- jenkins: CI/CD Jenkins server for building and deploying apps.
- docker: Single VM with Docker engine installed.
- kubernetes: Single-node K3s/Kubernetes cluster.
- fargate: ECS service running on AWS Fargate.
- windows_server: Windows Server VM with RDP.
- security_hardening: Hardened Linux VM with extra security config.
- sagemaker: SageMaker notebook instance.
- bedrock: Demo of Lambda / app calling Bedrock.
- gpu_ai_server: GPU-enabled VM for AI workloads.
- cloudwatch_alarms: Common CloudWatch alarms for EC2/ASG.

## Inputs

See \`variables.tf\`.

## Outputs

See \`outputs.tf\`.

## Usage (from root module)

\`\`\`hcl
module "$name" {
  source = "./Templates/AWS-Templates/Modules/$name"

  name              = "ck-$name"
  vpc_id            = aws_vpc.main.id
  subnet_id         = aws_subnet.public_a.id
  security_group_ids = [aws_security_group.example.id]

  # Add or remove variables based on variables.tf
}
\`\`\`
EOF

  #############################################
  # SETUP.md
  #############################################
  cat > "$dir/SETUP.md" <<EOF
# Setup notes for module: $name

Use this file to record:

- Any manual steps (e.g., AWS console prerequisites)
- Specific AMI IDs used in each region
- Example \`terraform apply\` commands
- Links to docs (Prometheus, Jenkins, Docker, etc.)
- Troubleshooting notes

This file is for your own use inside Obsidian so you remember
how you wired this module into different labs.
EOF

}

# Loop modules
for m in "${MODULES[@]}"; do
  create_module "$m"
done

echo "All module folders created."
