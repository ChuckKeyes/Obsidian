variable "region" {
             type = string  
             default = "us-east-1" 
}

# Your public workstation IP/CIDR to allow RDP to Windows
variable "admin_cidr" {
  description = "Your public /32 or office CIDR for RDP"
  type        = string
}

variable "vpc_cidr" {
             type = string  
             default = "10.100.0.0/16" 
}

# Choose 3 AZs
variable "azs" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

# 3 public + 9 private subnets (one /24 each)
variable "public_subnets" {
  type    = list(string)
  default = ["10.100.0.0/24", "10.100.1.0/24", "10.100.2.0/24"]
}

variable "private_subnets" {
  type    = list(string)
  default = [
    "10.100.10.0/24","10.100.11.0/24","10.100.12.0/24",  # group A
    "10.100.20.0/24","10.100.21.0/24","10.100.22.0/24",  # group B
    "10.100.30.0/24","10.100.31.0/24","10.100.32.0/24"   # group C
  ]
}

# Optional: existing key pair name for SSH into Linux from Windows (PuTTY/OpenSSH)
variable "key_name" {
  type        = string
  default     = null
  description = "EC2 key pair name (optional)"
}

#  73.107.137.224/32
