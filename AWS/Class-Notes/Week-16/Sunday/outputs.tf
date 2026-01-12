output "s3_website_url" {
  value = module.s3_site.website_endpoint
}

output "cloudfront_domain_name" {
  value = module.cloudfront.domain_name
}

output "cloudfront_status" {
  value = module.cloudfront.status
}


output "site_dns_name" {
  value = var.enable_route53 ? "${var.subdomain}.${var.hosted_zone_name}" : null
}

output "monitoring_dashboard_name" {
  value = module.monitoring.dashboard_name
}
