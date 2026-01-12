# terraform {
#   required_version = ">= 1.5.0"
#   required_providers {
#     google = {
#       source  = "hashicorp/google"
#       version = "~> 6.0"
#     }
#   }
# }

# # variable "project_id" { type = string }
# variable "region"     {
#      type = string  
#      default = "us-central1" 
# }
# variable "create_vm"  {
#      type = bool    
#      default = true 
# }
# variable "vm_count"   {
#      type = number  
#      default = 1 
# }

# provider "google" {
#   project = var.project_id
#   region  = var.region
# }




resource "google_compute_instance" "ubuntu_vm" {
  count        = var.create_vm ? var.vm_count : 0
  name         = "ubuntu-${count.index + 1}"
  machine_type = "e2-micro"
  zone         = "${var.region}-b"
  tags         = ["ssh"]

  boot_disk {
    initialize_params {
      # Ubuntu LTS image
      image = "projects/ubuntu-os-cloud/global/images/family/ubuntu-2404-lts"
      size  = 10
      type  = "pd-balanced"
    }
  }

  network_interface {
    network       = "default"
    access_config {} # ephemeral public IP (remove if not needed)
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    set -euo pipefail
    apt-get update -y
    apt-get install -y curl jq
    echo "Ubuntu VM ready."
  EOT
}
