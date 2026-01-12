module "s3_site" {
  source      = "./modules/s3_site"
  bucket_name = var.site_bucket_name
}

data "aws_route53_zone" "main" {
  name         = var.hosted_zone_name
  private_zone = false
}

locals {
  fqdn = "${var.subdomain}.${var.hosted_zone_name}"
}

module "cloudfront" {
  source  = "./modules/cloudfront"
  enabled = var.enable_cloudfront

  origin_website_endpoint = module.s3_site.website_endpoint
  origin_bucket_name      = module.s3_site.bucket_name

  aliases             = [local.fqdn]
  acm_certificate_arn = module.acm.certificate_arn
}


module "route53" {
  source  = "./modules/route53"
  enabled = var.enable_route53 && var.enable_cloudfront

  hosted_zone_name = var.hosted_zone_name
  record_name      = "${var.subdomain}.${var.hosted_zone_name}"

  cf_domain_name   = module.cloudfront.domain_name
  cf_hosted_zone_id = module.cloudfront.hosted_zone_id
}

module "acm" {
  source        = "./modules/acm_cert"
  enabled       = var.enable_acm
  domain_name   = local.fqdn
  hosted_zone_id = data.aws_route53_zone.main.zone_id
}


module "monitoring" {
  source  = "./modules/monitoring"
  enabled = true

  site_label                 = "${var.subdomain}.${var.hosted_zone_name}"
  cloudfront_distribution_id = module.cloudfront.distribution_id
  aws_region                 = "us-east-1"
}

