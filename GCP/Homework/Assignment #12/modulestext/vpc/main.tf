resource "google-compute-network" "this" {
  name                    = var.vpc-name
  auto-create-subnetworks = var.auto-create-subnetworks
  routing-mode            = var.routing-mode
}
