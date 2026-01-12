variable "project_name" {
  type        = string
  description = "Name prefix for resources"
}

variable "aws_region" {
  type        = string
  description = "AWS region for CloudWatch dashboard widgets"
}

variable "tags" {
  type        = map(string)
  description = "Common tags"
  default     = {}
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where ALB/TG live"
}

variable "vpc_cidr_blocks" {
  type        = list(string)
  description = "CIDR blocks for egress to targets (usually [vpc_cidr])"
}

variable "public_subnet_ids" {
  type        = list(string)
  description = "Public subnet IDs for the internet-facing ALB"
}

variable "private_instance_id" {
  type        = string
  description = "Private EC2 instance ID to register in the target group"
}

variable "ec2_security_group_id" {
  type        = string
  description = "Security group ID attached to the private EC2 instance"
}

variable "target_port" {
  type        = number
  description = "App port on the private instance"
  default     = 80
}

variable "health_check_path" {
  type        = string
  description = "Target group health check path"
  default     = "/"
}

variable "health_check_interval" {
  type        = number
  default     = 30
}

variable "health_check_timeout" {
  type        = number
  default     = 5
}

variable "health_check_healthy_threshold" {
  type        = number
  default     = 2
}

variable "health_check_unhealthy_threshold" {
  type        = number
  default     = 2
}

variable "health_check_matcher" {
  type        = string
  default     = "200-399"
}

variable "app_subdomain" {
  type        = string
  description = "Subdomain for the app (e.g., bonus-b)"
}

variable "domain_name" {
  type        = string
  description = "Root domain (e.g., keyescloudsolutions.com)"
}

variable "certificate_validation_method" {
  type        = string
  description = "ACM validation method (DNS or EMAIL)"
  default     = "DNS"
}

# Route53 automation (recommended)
variable "create_route53_records" {
  type        = bool
  description = "If true, module creates Route53 DNS validation records for ACM"
  default     = true
}

variable "route53_zone_id" {
  type        = string
  description = "Route53 hosted zone ID (required if create_route53_records=true)"
  default     = ""
}

# If you manage DNS outside Route53, pass these in and set create_route53_records=false
variable "validation_record_fqdns" {
  type        = list(string)
  description = "ACM validation record FQDNs (required if create_route53_records=false)"
  default     = []
}

variable "ssl_policy" {
  type        = string
  description = "ALB SSL policy"
  default     = "ELBSecurityPolicy-TLS13-1-2-2021-06"
}

variable "enable_waf" {
  type        = bool
  description = "Enable WAFv2 managed rules"
  default     = true
}

variable "sns_topic_arn" {
  type        = string
  description = "SNS topic ARN for CloudWatch alarm notifications"
}

variable "alb_5xx_evaluation_periods" {
  type        = number
  default     = 1
}

variable "alb_5xx_threshold" {
  type        = number
  default     = 5
}

variable "alb_5xx_period_seconds" {
  type        = number
  default     = 60
}
