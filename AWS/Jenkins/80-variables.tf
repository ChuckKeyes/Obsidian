variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}

variable "project_name" {
  description = "Project name prefix"
  type        = string
  default     = "cek"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.small"
}

variable "vpc_id" {
  description = "VPC ID for Jenkins VM"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for Jenkins VM"
  type        = string
}

variable "ssh_allowed_cidrs" {
  description = "CIDRs allowed to SSH"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "jenkins_allowed_cidrs" {
  description = "CIDRs allowed to access Jenkins"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
  default = {
    Owner   = "Chuck"
    Project = "Jenkins"
  }
}

variable "key_name" {
  description = "EC2 key pair name for Jenkins access"
  type        = string
}

variable "public_subnet_ids" {
  type = list(string)
}

# variable "jenkins_instance_id" {
#   type = string
# }

variable "route53_zone_name" {
  type    = string
  default = "keyescloudsolutions.com"
}

variable "jenkins_subdomain" {
  type    = string
  default = "jenkins"
}

variable "tmp_size" {
  description = "Configured /tmp tmpfs size"
  type        = string
  default     = "2G"
}