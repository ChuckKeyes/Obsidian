variable "enabled" { type = bool }

variable "hosted_zone_name" { type = string } # e.g. keyescloudsolutions.com
variable "record_name"      { type = string } # e.g. waterfall.keyescloudsolutions.com

variable "cf_domain_name"    { type = string } # dds3z2zv8zp52.cloudfront.net
variable "cf_hosted_zone_id" { type = string } # from CloudFront output
