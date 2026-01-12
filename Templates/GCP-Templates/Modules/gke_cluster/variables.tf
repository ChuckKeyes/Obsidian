#############################################
# variables.tf for module: gke_cluster
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
  description = "Name for primary resource(s)"
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
