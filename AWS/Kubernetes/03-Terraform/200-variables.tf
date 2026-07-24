variable "aws_region" {
  default = "us-east-1"
}

variable "my_ip" {
  description = "Your public IP in CIDR format"
  type        = string
}

variable "public_key_path" {
  description = "Path to your SSH public key"
  type        = string
}

variable "hosted_zone_id" {}
