output "public_ip" {
  value       = aws_instance.prometheus.public_ip
  description = "Public IP of the Prometheus VM"
}

output "private_ip" {
  value       = aws_instance.prometheus.private_ip
  description = "Private IP of the Prometheus VM"
}
################################## SG ID from the module

# in modules/prometheus_vm/outputs.tf
output "security_group_id" {
  description = "Security group ID for Prometheus VM"
  value = aws_security_group.prometheus_sg.id
}
