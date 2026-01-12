#############################################
# Module: gke_cluster (gcp)
# Description: Short description of what this module does.
#############################################

# NOTE:
# - Do NOT put provider "aws" or provider "google" blocks in here.
# - Root module supplies providers and passes variables in.

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
