####################################################
# CloudFront distribution in front of S3 website
####################################################
resource "aws_cloudfront_distribution" "site" {
  enabled         = true
  is_ipv6_enabled = true

  # This makes "index.html" the default when hitting the root
  default_root_object = "index.html"

  # S3 *website* endpoint as origin
  origin {
    domain_name = aws_s3_bucket_website_configuration.site.website_endpoint
    origin_id   = "s3-website-origin"

    # Because it's a *website* endpoint, we use custom_origin_config
    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "http-only"   # CloudFront → S3 over HTTP is ok here
      origin_ssl_protocols   = ["TLSv1.2"]
    }
  }

  default_cache_behavior {
    target_origin_id       = "s3-website-origin"
    viewer_protocol_policy = "redirect-to-https"

    allowed_methods = ["GET", "HEAD"]
    cached_methods  = ["GET", "HEAD"]

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    compress = true
  }

  price_class = "PriceClass_100" # cheapest regions; you can change later

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true  # uses *.cloudfront.net cert
  }

  tags = {
    Name = "ck-lab-static-site-cloudfront"
  }
}

####################################################
# Output the CloudFront URL
####################################################
output "cloudfront_domain_name" {
  description = "CloudFront domain name for the static website"
  value       = aws_cloudfront_distribution.site.domain_name
}
