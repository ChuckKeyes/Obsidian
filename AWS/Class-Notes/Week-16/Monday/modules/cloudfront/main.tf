resource "aws_cloudfront_distribution" "site" {
  count   = var.enabled ? 1 : 0
  enabled = true

  origin {
    domain_name = var.origin_website_endpoint
    origin_id   = "s3-website-${var.origin_bucket_name}"

    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "http-only" # REQUIRED for S3 website endpoints
      origin_ssl_protocols   = ["TLSv1.2"]
    }
  }

  default_root_object = "index.html"
  aliases = var.aliases


  default_cache_behavior {
    target_origin_id       = "s3-website-${var.origin_bucket_name}"
    viewer_protocol_policy =  "allow-all"                  #  "redirect-to-https"

    allowed_methods = ["GET", "HEAD", "OPTIONS"]
    cached_methods  = ["GET", "HEAD"]

    min_ttl     = 0
    default_ttl = 300     #  5 minutes
    max_ttl     = 604800    #   7 days

    forwarded_values {
      query_string = false
      cookies { forward = "none" }
    }
  }

  price_class = "PriceClass_100" # US/Canada/Europe (cheaper). Change later if needed.

  restrictions {
    geo_restriction { restriction_type = "none" }
  }
viewer_certificate {
  acm_certificate_arn      = var.acm_certificate_arn
  ssl_support_method       = "sni-only"
  minimum_protocol_version = "TLSv1.2_2021"
}

}
