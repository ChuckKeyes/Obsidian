resource "aws_acm_certificate_validation" "jenkins" {
  certificate_arn         = aws_acm_certificate.jenkins.arn
  validation_record_fqdns = [for r in aws_route53_record.jenkins_cert_validation : r.fqdn]
}