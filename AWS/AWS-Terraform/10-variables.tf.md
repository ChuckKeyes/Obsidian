variable "region"     { type = string  default = "us-east-1" }
variable "admin_cidr" { type = string  description = "Your /32 or office CIDR for RDP to Windows" }

variable "vpc_cidr" { type = string  default = "10.100.0.0/16" }

variable "azs" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "public_subnets" {
  type    = list(string)
  default = ["10.100.0.0/24", "10.100.1.0/24", "10.100.2.0/24"]
}

variable "private_subnets" {
  type    = list(string)
  default = [
    "10.100.10.0/24","10.100.11.0/24","10.100.12.0/24",
    "10.100.20.0/24","10.100.21.0/24","10.100.22.0/24",
    "10.100.30.0/24","10.100.31.0/24","10.100.32.0/24"
  ]
}

variable "key_name" {
  type        = string
  default     = null
  description = "Existing EC2 key pair (optional; else use SSM)"
}

