#############################################
# variables.tf for module: security_hardening (GCP)
#############################################

variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
}

variable "zone" {
  description = "GCP zone"
  type        = string
}

variable "name" {
  description = "Name prefix for resources in this module"
  type        = string
}

variable "network" {
  description = "VPC network self_link or name"
  type        = string
}

variable "subnetwork" {
  description = "Subnetwork self_link or name"
  type        = string
}

variable "machine_type" {
  description = "Machine type (e.g. e2-medium)"
  type        = string
  default     = "e2-micro"
}

variable "image" {
  description = "Boot disk image (e.g. debian-cloud/debian-12)"
  type        = string
  default     = "debian-cloud/debian-12"
}

variable "instance_tags" {
  description = "Network tags for instances (firewall rules, etc.)"
  type        = list(string)
  default     = []
}

variable "service_account_email" {
  description = "Service account email (optional)"
  type        = string
  default     = ""
}
