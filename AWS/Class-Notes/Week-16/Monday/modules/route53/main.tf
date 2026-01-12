data "aws_route53_zone" "main" {
  name         = var.hosted_zone_name
  private_zone = false
}

resource "aws_route53_record" "a_alias" {
  count   = var.enabled ? 1 : 0
  zone_id = data.aws_route53_zone.main.zone_id
  name    = var.record_name
  type    = "A"

  alias {
    name                   = var.cf_domain_name
    zone_id                = var.cf_hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "aaaa_alias" {
  count   = var.enabled ? 1 : 0
  zone_id = data.aws_route53_zone.main.zone_id
  name    = var.record_name
  type    = "AAAA"

  alias {
    name                   = var.cf_domain_name
    zone_id                = var.cf_hosted_zone_id
    evaluate_target_health = false
  }
}
