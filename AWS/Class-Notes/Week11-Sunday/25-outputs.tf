############################################
# outputs.tf — minimal, only declared resources
############################################

# Basics
output "project_name" { value = var.project_name }
output "region"       { value = var.region }
output "vpc_id"       { value = aws_vpc.this.id }
output "vpc_cidr"     { value = var.vpc_cidr }

# Subnets (ordered by var.azs)
output "public_subnet_ids" {
  value = compact([for az in var.azs : try(aws_subnet.public[az].id, null)])
}

output "private_subnet_ids" {
  value = compact([for az in var.azs : try(aws_subnet.private[az].id, null)])
}

# Internet / NAT (single NAT mode)
output "internet_gateway_id" {
  value = try(aws_internet_gateway.this.id, null)
}

output "nat_gateway_id" {
  value = try(aws_nat_gateway.nat_gw.id, null)
}

output "nat_eip" {
  value = try(aws_eip.nat_eip.public_ip, null)
}

# Route tables (public + single private RT)
output "public_route_table_id" {
  value = try(aws_route_table.public.id, null)
}

output "private_route_table_id" {
  value = try(aws_route_table.private_rt.id, null)
}

# Security Group
output "web_security_group_id" {
  value = try(aws_security_group.web.id, null)
}

# EC2 instance (optional)
output "web_instance_id" {
  value = try(aws_instance.web.id, null)
}
output "web_instance_public_ip" {
  value = try(aws_instance.web.public_ip, null)
}

# ALB (optional)
output "alb_arn"       { value = try(aws_lb.this[0].arn, null) }
output "alb_dns_name"  { value = try(aws_lb.this[0].dns_name, null) }
output "alb_zone_id"   { value = try(aws_lb.this[0].zone_id, null) }
output "alb_tg_arn"    { value = try(aws_lb_target_group.web[0].arn, null) }
