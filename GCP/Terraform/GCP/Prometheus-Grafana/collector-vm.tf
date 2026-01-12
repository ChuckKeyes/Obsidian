
# ---- COLLECTOR VM (OpenTelemetry Collector -> Google Managed Prometheus)
resource "google_compute_instance" "collector" {
  name         = "vm-gmp-collector"
  machine_type = var.machine_collector
  zone         = var.zone

  service_account {
    email  = google_service_account.collector_sa.email
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }

  boot_disk {
    initialize_params {
      size  = 20
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.subnet.id

    dynamic "access_config" {
      for_each = var.reserve_static_ips ? [1] : []
      content {
        nat_ip = google_compute_address.ip_collector[0].address
      }
    }
    dynamic "access_config" {
      for_each = var.reserve_static_ips ? [] : [1]
      content {}
    }
  }

  metadata = {
    user-data    = local.startup_collector
    gmp-project  = var.project_id
    gmp-location = var.region
  }

  tags = ["collector", "ssh"]
}
