
# ---- GRAFANA VM
resource "google_compute_instance" "grafana" {
  name         = "vm-grafana"
  machine_type = var.machine_grafana
  zone         = var.zone

  boot_disk {
    initialize_params {
      size  = var.disk_grafana_gb
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.subnet.id

    dynamic "access_config" {
      for_each = var.reserve_static_ips ? [1] : []
      content {
        nat_ip = google_compute_address.ip_grafana[0].address
      }
    }
    dynamic "access_config" {
      for_each = var.reserve_static_ips ? [] : [1]
      content {}
    }
  }

  metadata = {
    user-data = local.startup_grafana
  }

  tags = ["grafana", "ssh"]
}
