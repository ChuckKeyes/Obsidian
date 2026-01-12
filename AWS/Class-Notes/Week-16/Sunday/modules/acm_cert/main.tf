resource "aws_acm_certificate" "cert" {
  count             = var.enabled ? 1 : 0
  domain_name       = var.domain_name
  validation_method = "DNS"
}

locals {
  dvo = var.enabled ? tolist(aws_acm_certificate.cert[0].domain_validation_options)[0] : null
}

resource "aws_route53_record" "cert_validation" {
  count   = var.enabled ? 1 : 0
  zone_id = var.hosted_zone_id

  name    = local.dvo.resource_record_name
  type    = local.dvo.resource_record_type
  records = [local.dvo.resource_record_value]
  ttl     = 300
}

resource "aws_acm_certificate_validation" "cert" {
  count                   = var.enabled ? 1 : 0
  certificate_arn         = aws_acm_certificate.cert[0].arn
  validation_record_fqdns = [aws_route53_record.cert_validation[0].fqdn]
}



# resource "aws_acm_certificate" "cert" {
#   count             = var.enabled ? 1 : 0
#   domain_name       = var.domain_name
#   validation_method = "DNS"
# }

# # Create the DNS validation record automatically in Route 53
# resource "aws_route53_record" "cert_validation" {
#   count   = var.enabled ? 1 : 0
#   zone_id = var.hosted_zone_id

#   name    = aws_acm_certificate.cert[0].domain_validation_options[0].resource_record_name
#   type    = aws_acm_certificate.cert[0].domain_validation_options[0].resource_record_type
#   records = [aws_acm_certificate.cert[0].domain_validation_options[0].resource_record_value]
#   ttl     = 300
# }

# resource "aws_acm_certificate_validation" "cert" {
#   count                  = var.enabled ? 1 : 0
#   certificate_arn        = aws_acm_certificate.cert[0].arn
#   validation_record_fqdns = [aws_route53_record.cert_validation[0].fqdn]
# }
