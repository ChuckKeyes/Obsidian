variable "vpc_id" {
  type        = string
  description = "VPC where Prometheus VM will live"
}

variable "subnet_id" {
  type        = string
  description = "Subnet for the Prometheus VM (usually a public subnet)"
}

variable "ami_id_linux" {
  type        = string
  description = "Linux AMI for Prometheus VM"
}

# variable "admin_cidr" {
#   type        = string
#   description = "Your admin IP/CIDR for SSH and Prometheus UI access"
# }

variable "node_targets" {
  description = "List of node_exporter targets (host:port) for scraping"
  type        = list(string)
  default     = []
}

variable "notify_email" {
  description = "Email address to receive SNS notifications"
  type        = string
}

variable "prometheus_vpc_id" {
  type        = string
  description = "VPC ID for Prometheus in us-east-1 (east)"
}

variable "prometheus_subnet_id" {
  type        = string
  description = "Subnet ID for Prometheus VM in east"
}

variable "prometheus_ami_id" {
  type        = string
  description = "AMI ID for Prometheus VM in east region"
}

variable "prometheus_admin_cidr" {
  type        = string
  description = "Your IP for SSH/UI access in east"
}
variable "prometheus_vpc_cidr" {
  description = "CIDR block of the Prometheus VPC in east (used for SG rules)"
  type        = string
}

variable "admin_cidr" {
  description = "Admin IP/CIDR allowed for SSH/UI"
  type        = string
  default     = "0.0.0.0/0" # or tighten later
}
