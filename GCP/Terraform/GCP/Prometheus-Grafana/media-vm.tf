# ---- MEDIA VM

# Data disk
resource "google_compute_disk" "media_data" {
  name = "disk-media-data"
  type = "pd-balanced"
  zone = var.zone
  size = var.disk_media_gb
}

# Static external IP (top-level, not inside the instance)
resource "google_compute_address" "ip_media" {
  name   = "ip-media"
  region = var.region
}

# VM
resource "google_compute_instance" "media" {
  name         = "vm-media"
  machine_type = var.machine_media
  zone         = var.zone

  boot_disk {
    initialize_params {
      size  = 20
      image = "debian-cloud/debian-12"
    }
  }

  attached_disk {
    source      = google_compute_disk.media_data.id
    device_name = "disk-media-data"
    mode        = "READ_WRITE"
  }

  network_interface {
    subnetwork = google_compute_subnetwork.subnet.id
    access_config {
      # bind the reserved static IP
      nat_ip = google_compute_address.ip_media.address
    }
  }

  # 2) Using metadata with a local:
  metadata = {
    startup-script = local.startup_media
  }

  tags = ["media", "ssh"]
}
