data "aws_route53_zone" "kcs_public_zone" {
  name         = "keyescloudsolutions.com"
  private_zone = false
}

resource "aws_route53_record" "kcs_www" {
  zone_id = data.aws_route53_zone.kcs_public_zone.zone_id
  name    = "www.keyescloudsolutions.com"
  type    = "A"
  ttl     = 60

  records = [aws_instance.kcs_ec201.public_ip]
}
