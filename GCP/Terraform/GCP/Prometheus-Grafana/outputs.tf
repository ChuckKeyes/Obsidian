output "urls" {
  value = {
    media_ui   = "http://${google_compute_instance.media.network_interface[0].access_config[0].nat_ip}:8096"
    grafana_ui = "http://${google_compute_instance.grafana.network_interface[0].access_config[0].nat_ip}:3000"
  }
}

# ---- Helpful outputs
output "public_ips" {
  value = {
    media     = google_compute_instance.media.network_interface[0].access_config[0].nat_ip
    collector = google_compute_instance.collector.network_interface[0].access_config[0].nat_ip
    grafana   = google_compute_instance.grafana.network_interface[0].access_config[0].nat_ip
  }
}

output "media_public_ip_reserved" {
  value = google_compute_address.ip_media.address
}
