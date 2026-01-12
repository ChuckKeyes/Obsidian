#############################################
# outputs.tf — Snippets ALB + ASG lab
#############################################

# --- Network basics ---

output "vpc_id" {
  description = "ID of the main VPC for the lab."
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "IDs of the 3 public subnets used by the ALB and ASG."
  value = [
    aws_subnet.public_a.id,
    aws_subnet.public_b.id,
    aws_subnet.public_c.id,
  ]
}

output "private_subnet_ids" {
  description = "IDs of the 3 private subnets reserved for back-end / DB tiers."
  value = [
    aws_subnet.private_a.id,
    aws_subnet.private_b.id,
    aws_subnet.private_c.id,
  ]
}

# --- Security groups ---

output "alb_security_group_id" {
  description = "Security group ID for the public Application Load Balancer."
  value       = aws_security_group.alb_sg.id
}

output "targets_security_group_id" {
  description = "Security group ID for EC2 instances in the web ASG target group."
  value       = aws_security_group.targets_sg.id
}

# --- Load Balancer + Target Group ---

output "alb_arn" {
  description = "ARN of the Application Load Balancer."
  value       = aws_lb.web.arn
}

output "alb_dns_name" {
  description = "Public DNS name of the ALB. Use this to test the website."
  value       = aws_lb.web.dns_name
}

output "alb_url_http" {
  description = "Convenience HTTP URL for hitting the ALB in a browser."
  value       = "http://${aws_lb.web.dns_name}"
}

output "target_group_arn" {
  description = "Target group ARN for the web ASG instances."
  value       = aws_lb_target_group.web.arn
}

output "target_group_name" {
  description = "Name of the ALB target group."
  value       = aws_lb_target_group.web.name
}

# --- Launch Template + Auto Scaling Group ---

output "launch_template_id" {
  description = "ID of the EC2 launch template used by the web ASG."
  value       = aws_launch_template.web.id
}

output "launch_template_latest_version" {
  description = "Latest version number of the launch template."
  value       = aws_launch_template.web.latest_version
}

output "autoscaling_group_name" {
  description = "Name of the web Auto Scaling Group."
  value       = aws_autoscaling_group.web.name
}

output "autoscaling_group_arn" {
  description = "ARN of the web Auto Scaling Group."
  value       = aws_autoscaling_group.web.arn
}

# --- CPU-based scaling policy ---

output "cpu_scaling_policy_arn" {
  description = "ARN of the CPU-based target tracking scaling policy (50% CPU)."
  value       = aws_autoscaling_policy.cpu_scale.arn
}
