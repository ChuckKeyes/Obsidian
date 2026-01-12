output "self-link" { value = google-compute-instance.this.self-link }
output "nat-ip"    { value = google-compute-instance.this.network-interface[0].access-config[0].nat-ip }
