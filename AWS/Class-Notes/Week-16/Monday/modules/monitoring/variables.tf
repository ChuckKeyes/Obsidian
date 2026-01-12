variable "enabled" {
  type    = bool
  default = true
}

variable "site_label" {
  description = "Human label for dashboard naming, e.g. waterfall.keyescloudsolutions.com"
  type        = string
}

variable "cloudfront_distribution_id" {
  description = "CloudFront Distribution ID (not the domain name)"
  type        = string
}

variable "aws_region" {
  description = "Region for CloudWatch dashboard (CloudFront metrics are in us-east-1)"
  type        = string
  default     = "us-east-1"
}
