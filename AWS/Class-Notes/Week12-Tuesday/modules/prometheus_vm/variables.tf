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

variable "admin_cidr" {
  type        = string
  description = "Your admin IP/CIDR for SSH and Prometheus UI access"
}

variable "node_targets" {
  description = "List of node_exporter targets (host:port) for scraping"
  type        = list(string)
  default     = []
}
