variable "owner_name" {
  description = "Name to display on the web page"
  type        = string
  default     = "Charles Keyes Sr."
}

# variable "s3_bucket_name" {
#   description = "S3 bucket to display on the web page"
#   type        = string
#   default     = "KeyesCloudSolutions" # <-- put your real bucket name here
# }
######################################################################################

# variable "enable_prometheus" {
#   description = "Whether to deploy Prometheus VM"
#   type        = bool
#   default     = true
# }

variable "ami_id_linux" {
  description = "Linux AMI for Prometheus VM"
  type        = string
  default     = "ami-0fa3fe0fa7920f68e"  # or a region-appropriate one
}

variable "admin_cidr" {
  description = "Your workstation public IP (for SSH + Prometheus UI)"
  type        = string
  default     = "0.0.0.0/0"   # CHANGE to your real /32 for security
}

variable "notify_email" {
  description = "Email address to receive Auto Scaling notifications"
  type        = string
  default     = "chuck37080@gmail.com"   # <-- you can update this
}

# variable "subnet_public_a_id" { type = string }
# variable "subnet_public_b_id" { type = string }
# variable "subnet_public_c_id" { type = string }

variable "public_subnet_ids" {
  description = "List of public subnet IDs used for the ASG / launch template (e.g. 3 subnets across AZs)."
  type        = list(string)
}
