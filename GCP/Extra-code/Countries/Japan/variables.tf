# === Japan VPN Configuration ===
variable "japan_shared_secret" {
  description = "Shared secret for Japan HA VPN"
  type        = string
  sensitive   = true
}

variable "japan_peer_asn" {
  description = "Peer ASN for Japan HA VPN"
  type        = number
}

variable "japan_peer_vpn_gateway_id" {
  description = "Peer HA VPN Gateway ID for Japan (e.g., from NCC/hub side)"
  type        = string
}
