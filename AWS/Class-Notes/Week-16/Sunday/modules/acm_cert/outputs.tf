output "certificate_arn" {
  value = try(aws_acm_certificate.cert[0].arn, null)
}

output "validation_status" {
  value = try(aws_acm_certificate_validation.cert[0].id, null)
}
