output "domain_name" {
  value = try(aws_cloudfront_distribution.site[0].domain_name, null)
}

output "hosted_zone_id" {
  value = try(aws_cloudfront_distribution.site[0].hosted_zone_id, null)
}

output "status" {
  value = try(aws_cloudfront_distribution.site[0].status, null)
}

output "distribution_id" {
  value = try(aws_cloudfront_distribution.site[0].id, null)
}