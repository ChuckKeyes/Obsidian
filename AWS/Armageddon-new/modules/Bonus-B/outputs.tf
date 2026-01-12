output "cek_fqdn" {
  value       = local.cek_fqdn
  description = "FQDN the certificate is issued for"
}

output "cek_alb_dns_name" {
  value       = aws_lb.cek_alb01.dns_name
  description = "Public ALB DNS name"
}

output "cek_alb_arn" {
  value       = aws_lb.cek_alb01.arn
  description = "ALB ARN"
}

output "cek_alb_sg_id" {
  value       = aws_security_group.cek_alb_sg01.id
  description = "ALB security group ID"
}

output "cek_target_group_arn" {
  value       = aws_lb_target_group.cek_tg01.arn
  description = "Target group ARN"
}

output "cek_acm_cert_arn" {
  value       = aws_acm_certificate.cek_acm_cert01.arn
  description = "ACM certificate ARN (requested)"
}

output "cek_acm_validated_cert_arn" {
  value       = aws_acm_certificate_validation.cek_acm_validation01.certificate_arn
  description = "ACM certificate ARN (validated)"
}

output "cek_waf_web_acl_arn" {
  value       = var.enable_waf ? aws_wafv2_web_acl.cek_waf01[0].arn : null
  description = "WAF Web ACL ARN (if enabled)"
}

output "cek_dashboard_name" {
  value       = aws_cloudwatch_dashboard.cek_dashboard01.dashboard_name
  description = "CloudWatch dashboard name"
}
