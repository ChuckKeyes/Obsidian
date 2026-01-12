
## 0. Provider & basic variables — shared config
provider "aws" {
  region = "us-east-1"
}

# (Optional) basic variables
variable "admin_cidr" {
  description = "Your home/office IP for SSH"
  type        = string
  default     = "0.0.0.0/0" # CHANGE to your /32 in real use
}
