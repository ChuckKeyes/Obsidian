variable "enabled" {
  type    = bool
  default = true
}

variable "origin_website_endpoint" {
  description = "S3 website endpoint (NO protocol), e.g. bucket.s3-website-us-east-1.amazonaws.com"
  type        = string
}

variable "origin_bucket_name" {
  description = "Bucket name (used only to build origin_id)"
  type        = string
}

variable "aliases" {
  type    = list(string)
  default = []
}

variable "acm_certificate_arn" {
  type    = string
  default = null
}
