variable "project_id" {
  type    = string
  default = "prometheus-475022"
}
variable "region" {
  type    = string
  default = "us-east1"
}
variable "zone" {
  type    = string
  default = "us-east1-b"
}

# Your admin /32 (or office CIDR) for SSH + admin UIs
# variable "admin_cidr" {
#   description = "Public /32 or office CIDR for SSH and admin ports"
#   type        = string
# }

variable "network_cidr" {
  type    = string
  default = "10.60.0.0/16"
}

# VM types
variable "machine_media" {
  type    = string
  default = "e2-standard-2"
} # media server
variable "machine_collector" {
  type    = string
  default = "e2-small"
} # otel collector for GMP
variable "machine_grafana" {
  type    = string
  default = "e2-small"
}

# Disks
variable "disk_media_gb" {
  type    = number
  default = 200
}
variable "disk_grafana_gb" {
  type    = number
  default = 20
}

# Static IPs?
variable "reserve_static_ips" {
  type    = bool
  default = true
}

variable "admin_cidr" {
  description = "Your public IPv4 /32 (home router) for SSH/admin access"
  type        = string
  validation {
    condition     = can(cidrhost(var.admin_cidr, 0)) && cidrnetmask(var.admin_cidr) == "255.255.255.255"
    error_message = "Provide a single-host /32 IPv4 CIDR like 73.107.137.224/32."
  }
}
