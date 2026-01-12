variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "aws_profile" {
  type    = string
  default = "dev"
}

variable "site_bucket_name" {
  description = "Globally-unique S3 bucket name for static site origin"
  type        = string
  default     = "kcs-yoga-site-001-chuck"
}

variable "enable_cloudfront" {
  type    = bool
  default = true
}

variable "enable_route53" {
  type    = bool
  default = true
}


variable "hosted_zone_name" {
  description = "Route 53 hosted zone name (no trailing dot), e.g. keyescloudsolutions.com"
  type        = string
  default     = "keyescloudsolutions.com"
}

variable "test_subdomain"   {
          type = string 
          default = "waterfall" 
          }

variable "subdomain" {
  description = "Subdomain label (left side), e.g. waterfall"
  type        = string
  default     = "waterfall"
}

variable "enable_acm" {
  description = "Enable ACM certificate + DNS validation (must be in us-east-1 for CloudFront)"
  type        = bool
  default     = true
}


variable "enable_monitoring" {
  type    = bool
  default = true
}


# variable "subdomain" {
#   description = "Record name inside hosted zone, e.g. yoga"
#   type        = string
#   default     = "yoga"
# }
