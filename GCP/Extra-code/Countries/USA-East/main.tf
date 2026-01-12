resource "google_compute_network" "vpc" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
}

resource "google_compute_subnetwork" "subnet" {
  name          = var.subnet_name
  ip_cidr_range = var.cidr
  region        = var.region
  network       = google_compute_network.vpc.id
}

resource "google_compute_router" "router" {
  name    = "${var.name_prefix}-router"
  region  = var.region
  network = google_compute_network.vpc.id
  bgp {
    asn = var.local_asn
  }
}

resource "google_compute_ha_vpn_gateway" "vpn_gateway" {
  name    = "${var.name_prefix}-vpn"
  region  = var.region
  network = google_compute_network.vpc.id
}

resource "google_network_connectivity_spoke" "vpn_spoke" {
  name     = "${var.name_prefix}-vpn-spoke"
  hub      = var.ncc_hub_id
  location = var.region

  linked_vpn_tunnels {
    site_to_site_data_transfer = true
    uris = var.vpn_tunnel_uris  # These come from pre-configured tunnels (or can be built inside this module)
  }

  description = "HA VPN Spoke for ${var.country}"
}
