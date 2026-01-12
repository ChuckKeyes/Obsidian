#############################################
# Global Variables
#############################################

variable "project_name" {
  description = "Name prefix for resources"
  type        = string
  default     = "aws-template-test"
}

variable "region" {
  description = "AWS region for deployment"
  type        = string
  default     = "us-east-1"
}

variable "azs" {
  description = "Availability Zones for subnets"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "admin_cidr" {
  description = "Your public /32 IP for SSH or RDP access"
  type        = string
  default     = "0.0.0.0/0"
}

#############################################
# Networking
#############################################

variable "vpc_cidr" {
  description = "CIDR block for the main VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "List of public subnet CIDRs"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "private_subnets" {
  description = "List of private subnet CIDRs"
  type        = list(string)
  default     = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]
}

variable "enable_nat_gateway" {
  description = "Whether to create NAT gateway for private subnets"
  type        = bool
  default     = true
}

#############################################
# EC2 Instance Variables
#############################################

variable "instance_type" {
  description = "Instance type for EC2"
  type        = string
  default     = "t3.micro"
}

variable "windows_instance_type" {
  description = "Instance type for Windows EC2"
  type        = string
  default     = "t3.medium"
}

variable "key_name" {
  description = "Name of AWS key pair for SSH/RDP"
  type        = string
  default     = ""
}

variable "instance_count_min" {
  description = "Minimum number of EC2 instances in the Auto Scaling Group"
  type        = number
  default     = 3
}

variable "instance_count_max" {
  description = "Maximum number of EC2 instances in the Auto Scaling Group"
  type        = number
  default     = 10
}

#############################################
# Security Groups
#############################################

variable "allow_http" {
  description = "Allow inbound HTTP (port 80)"
  type        = bool
  default     = true
}

variable "allow_https" {
  description = "Allow inbound HTTPS (port 443)"
  type        = bool
  default     = true
}

variable "allow_ssh" {
  description = "Allow inbound SSH (port 22) from admin CIDR"
  type        = bool
  default     = true
}

#############################################
# EC2 User Data Script
#############################################

variable "user_data_path" {
  description = "Path to user data shell script"
  type        = string
  default     = "user_data.sh"
}

#############################################
# Tags
#############################################

variable "tags" {
  description = "Common tags applied to all resources"
  type        = map(string)
  default = {
    Environment = "Dev"
    ManagedBy   = "Terraform"
    Owner       = "Charles Keyes"
  }
}
