variable "enabled" { type = bool }

variable "hosted_zone_name" {
  type        = string
  description = "Public hosted zone name (example: keyescloudsolutions.com)"
}

variable "record_name" {
  type        = string
  description = "Record to create (example: www.keyescloudsolutions.com)"
}

variable "alias_dns_name" {
  type        = string
  description = "DNS name of the AWS target (CloudFront domain or ALB DNS name)"
}

variable "alias_zone_id" {
  type        = string
  description = "Hosted zone ID of the AWS target (CloudFront zone ID or ALB zone ID)"
}

variable "evaluate_target_health" {
  type        = bool
  default     = false
  description = "Usually false for CloudFront; often true/false for ALB depending on preference"
}

variable "create_aaaa" {
  type        = bool
  default     = true
  description = "Create AAAA alias record (IPv6). OK for CloudFront; optional for ALB."
}
