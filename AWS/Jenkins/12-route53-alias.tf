resource "aws_route53_record" "jenkins" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = "${var.jenkins_subdomain}.${var.route53_zone_name}"
  type    = "A"

  alias {
    name                   = aws_lb.jenkins.dns_name
    zone_id                = aws_lb.jenkins.zone_id
    evaluate_target_health = true
  }
}