# ---- Network
resource "google_compute_network" "net" {
  name                    = "media-gmp-net"
  auto_create_subnetworks = false
}
resource "google_compute_subnetwork" "subnet" {
  name          = "media-gmp-subnet"
  ip_cidr_range = var.network_cidr
  region        = var.region
  network       = google_compute_network.net.id
}




# # Grafana 3000 (admin only)
# resource "google_compute_firewall" "allow_grafana_admin" {
#   name    = "allow-grafana-admin"
#   network = google_compute_network.net.name
#   allow {
#         protocol = "tcp"
#         ports    = ["3000"]
#         }
#   source_ranges = [var.admin_cidr]
# }
# Node exporter 9100 (internal only)
# resource "google_compute_firewall" "allow_node_exporter_internal" {
#   name    = "allow-node-exporter-internal"
#   network = google_compute_network.net.name
#   allow {
#         protocol = "tcp"
#         ports    = ["9100"]
#         }
#   source_ranges = [google_compute_subnetwork.subnet.ip_cidr_range]
# }
# Media ports (Jellyfin 8096; adjust as needed)
resource "google_compute_firewall" "allow_media_http" {
  name    = "allow-media-http"
  network = google_compute_network.net.name
  allow {
    protocol = "tcp"
    ports    = ["80", "443", "8096"]
  }
  source_ranges = ["0.0.0.0/0"] # tighten if desired
}

# # ---- Optional static IPs
# resource "google_compute_address" "ip_media" {
#   count  = var.reserve_static_ips ? 1 : 0
#   name   = "ip-media"
#   region = var.region
# }
resource "google_compute_address" "ip_collector" {
  count  = var.reserve_static_ips ? 1 : 0
  name   = "ip-collector"
  region = var.region
}
resource "google_compute_address" "ip_grafana" {
  count  = var.reserve_static_ips ? 1 : 0
  name   = "ip-grafana"
  region = var.region
}

# ---- Startup YAMLs (cloud-init)
locals {
  startup_media     = file("${path.module}/startup-media.yaml")
  startup_collector = file("${path.module}/startup-collector.yaml")
  startup_grafana   = file("${path.module}/startup-grafana.yaml")
}

