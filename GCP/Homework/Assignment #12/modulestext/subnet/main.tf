resource "google-compute-subnetwork" "this" {
  name          = var.name
  ip-cidr-range = var.ip-cidr-range
  region        = var.region
  network       = var.network
}
