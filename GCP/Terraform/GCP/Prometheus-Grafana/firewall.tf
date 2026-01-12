# # SSH from your /32 to VMs tagged "ssh"
# resource "google_compute_firewall" "allow_ssh" {
#   name    = "allow-ssh-admin"
#   network = google_compute_network.net.name
#   direction = "INGRESS"
#   priority  = 1000

#   allow {
#     protocol = "tcp"
#     ports    = ["22"]
#   }

#   source_ranges = [var.admin_cidr]
#   target_tags   = ["ssh"]
# }

# # Public HTTP/HTTPS to Media (Jellyfin 8096 too)
# resource "google_compute_firewall" "allow_media_web" {
#   name    = "allow-media-web"
#   network = google_compute_network.net.name
#   direction = "INGRESS"
#   priority  = 1000

#   allow {
#         protocol = "tcp" 
#         ports = ["80","443","8096"] 
#         }

#   source_ranges = ["0.0.0.0/0"]   # tighten if you want
#   target_tags   = ["media"]
# }

# # Grafana UI only from your /32
# resource "google_compute_firewall" "allow_grafana_admin" {
#   name    = "allow-grafana-admin"
#   network = google_compute_network.net.name
#   direction = "INGRESS"
#   priority  = 1000

#   allow {
#         protocol = "tcp" 
#         ports = ["3000"] 
#         }

#   source_ranges = [var.admin_cidr]
#   target_tags   = ["grafana"]
# }

# # (Optional) Node Exporter within VPC only
# resource "google_compute_firewall" "allow_node_exporter_internal" {
#   name    = "allow-node-exporter-internal"
#   network = google_compute_network.net.name
#   direction = "INGRESS"
#   priority  = 1000

#   allow {
#         protocol = "tcp" 
#         ports = ["9100"] 
#         }

#   source_ranges = [google_compute_subnetwork.subnet.ip_cidr_range]
#   target_tags   = ["media","grafana","collector"]
# }

# # (Optional safety) Default egress allow all, if you don't already have one and
# # you created a brand-new custom network with no default rules.
# resource "google_compute_firewall" "egress_allow_all" {
#   name      = "egress-allow-all"
#   network   = google_compute_network.net.name
#   direction = "EGRESS"
#   priority  = 65534

#   allow { protocol = "all" }

#   destination_ranges = ["0.0.0.0/0"]
# }
#######################################################################################################
#####################################################################################################
# SSH from your /32 to tag "ssh"
resource "google_compute_firewall" "allow_ssh" {
  name      = "allow-ssh-admin"
  network   = google_compute_network.net.name
  direction = "INGRESS"
  priority  = 1000
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = [var.admin_cidr]
  target_tags   = ["ssh"]
}

# (Recommended) SSH via IAP (Google’s range) to tag "ssh"
resource "google_compute_firewall" "allow_ssh_iap" {
  name      = "allow-ssh-iap"
  network   = google_compute_network.net.name
  direction = "INGRESS"
  priority  = 1000
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["35.235.240.0/20"] # IAP TCP forwarding
  target_tags   = ["ssh"]
}

# Public HTTP/HTTPS/8096 to Media
resource "google_compute_firewall" "allow_media_web" {
  name      = "allow-media-web"
  network   = google_compute_network.net.name
  direction = "INGRESS"
  priority  = 1000
  allow {
    protocol = "tcp"
    ports    = ["80", "443", "8096"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["media"]
}

# Grafana UI from your /32
resource "google_compute_firewall" "allow_grafana_admin" {
  name      = "allow-grafana-admin"
  network   = google_compute_network.net.name
  direction = "INGRESS"
  priority  = 1000
  allow {
    protocol = "tcp"
    ports    = ["3000"]
  }
  source_ranges = [var.admin_cidr]
  target_tags   = ["grafana"]
}
