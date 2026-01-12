

output "vpc_id"           { value = aws_vpc.this.id }
output "public_subnet_ids" { value = [for s in aws_subnet.public  : s.id] }
output "private_subnet_ids"{ value = [for s in aws_subnet.private : s.id] }

output "instance_public_ip"  { value = aws_instance.web.public_ip }
output "instance_public_dns" { value = aws_instance.web.public_dns }

output "alb_dns_name" {
  value       = try(aws_lb.this[0].dns_name, null)
  description = "DNS name of the ALB (if enabled)."
}

output "windows_public_ip" {
  value       = try(aws_instance.windows[0].public_ip, null)
  description = "Public IP of the Windows EC2 (if enabled)"
}

output "asg_name" {
  value       = try(aws_autoscaling_group.web_asg[0].name, null)
  description = "Name of the Auto Scaling Group (if enabled)"
}
