#############################################
# variables.tf for module: jenkins
#############################################

variable "name" {
  description = "Name prefix for resources in this module"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where resources will be created"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for primary resource(s)"
  type        = string
}

variable "security_group_ids" {
  description = "List of security group IDs to associate"
  type        = list(string)
  default     = []
}

variable "ami_id" {
  description = "AMI ID (if this module creates EC2 instances)"
  type        = string
  default     = ""
}

variable "instance_type" {
  description = "EC2 instance type (if used)"
  type        = string
  default     = "t3.micro"
}
