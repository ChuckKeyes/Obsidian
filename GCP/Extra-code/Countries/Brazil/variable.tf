variable "country" {}
variable "vpc_name" {}
variable "subnet_name" {}
variable "cidr" {}
variable "region" {}
variable "ncc_hub_id" {}
variable "name_prefix" {}
variable "local_asn" {}
variable "vpn_tunnel_uris" {
  type = list(string)
}
