resource "aws_acm_certificate" "jenkins" {
  domain_name       = "${var.jenkins_subdomain}.${var.route53_zone_name}"
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "jenkins-acm-cert"
  }
}