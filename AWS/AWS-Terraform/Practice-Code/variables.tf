# ---------------------------------------
# Variables (optional but recommended)
# ---------------------------------------
variable "admin_cidr" {
  description = "Your public /32 for SSH (e.g. 203.0.113.10/32)"
  type        = string
  default     = "0.0.0.0/0"  # tighten to your /32
}
