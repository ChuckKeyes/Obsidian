variable "project_name" { type = string }

variable "vpc_id" { type = string }

variable "private_subnet_ids" {
  type = list(string)
}

variable "private_route_table_id" {
  type = string
}

variable "ec2_ami_id" { type = string }
variable "ec2_instance_type" { type = string }

variable "ec2_security_group_id" {
  description = "SG for the private EC2 instance"
  type        = string
}

variable "ec2_instance_profile_name" {
  description = "Instance profile name to attach to the private EC2"
  type        = string
}

variable "ec2_role_name" {
  description = "Role name used by the EC2 instance profile (for attaching least-privilege policies)"
  type        = string
}

variable "cloudwatch_log_group_arn" {
  description = "ARN of the app log group to scope logs permissions"
  type        = string
}

variable "ssm_param_path_prefix" {
  description = "SSM Parameter path prefix to allow read (example: /lab/db/)"
  type        = string
  default     = "/lab/db/"
}

variable "db_secret_name" {
  description = "Secrets Manager secret name (example: kcs-keyescloudsolutions/rds/mysql)"
  type        = string
}
