variable "aws_region" {
  default = "us-east-2"
}

variable "my_ip" {
  description = "Your public IP in CIDR format"
  type        = string
}

variable "public_key_path" {
  description = "Path to your SSH public key"
  type        = string
}