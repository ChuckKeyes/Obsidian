data "aws_route53_zone" "main" {
  name         = "keyescloudsolutions.com."
  private_zone = false
}

resource "aws_route53_record" "kubernetes" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = "kubernetes.keyescloudsolutions.com"
  type    = "A"
  ttl     = 300
  records = [aws_eip.k8s_master_eip.public_ip]
}

resource "aws_route53_record" "bread" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = "bread.keyescloudsolutions.com"
  type    = "A"
  ttl     = 300
  records = [aws_eip.k8s_master_eip.public_ip]
}

resource "aws_route53_record" "portfolio" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = "portfolio.keyescloudsolutions.com"
  type    = "A"
  ttl     = 300
  records = [aws_eip.k8s_master_eip.public_ip]
}

resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = "www.keyescloudsolutions.com"
  type    = "A"
  ttl     = 300
  records = [aws_eip.k8s_master_eip.public_ip]
}
