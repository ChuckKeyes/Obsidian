resource "google-compute-instance" "this" {
  name         = var.name
  machine_type = var.machine_type
  zone         = var.zone
  tags         = var.tags

  boot-disk {
    initialize-params {
      image = var.image
    }
  }

  network-interface {
    subnetwork   = var.subnetwork
    access-config {} # ephemeral public IP
  }
}
