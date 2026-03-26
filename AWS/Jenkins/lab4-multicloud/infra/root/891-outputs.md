
output "alb_dns_name" {
  value = aws_lb.alb.dns_name
}

output "alb_arn" {
  value = aws_lb.alb.arn
}

output "target_group_arn" {
  value = aws_lb_target_group.tg.arn
}

output "tokyo_instance_private_ip" {
  value = aws_instance.tokyo_app.private_ip
}

output "saopaulo_instance_private_ip" {
  value = aws_instance.saopaulo_client.private_ip
}

output "tokyo_instance_public_ip" {
  value = aws_instance.tokyo_app.public_ip
}

output "saopaulo_instance_public_ip" {
  value = aws_instance.saopaulo_client.public_ip
}

output "tokyo_tgw_id" {
  value = module.tokyo_tgw.tgw_id
}

output "saopaulo_tgw_id" {
  value = module.saopaulo_tgw.saopaulo_tgw_id
}

output "tgw_peering_attachment_id" {
  value = aws_ec2_transit_gateway_peering_attachment.tokyo_to_saopaulo.id
}

output "tokyo_private_route_table_ids" {
  value = module.tokyo_core.private_route_table_ids
}

output "saopaulo_private_route_table_ids" {
  value = module.saopaulo_core.private_route_table_ids
}

############################################
# NY Branch (GCP)
############################################

output "ny_network_id" {
  value = module.ny_network.network_id
}

output "ny_network_name" {
  value = module.ny_network.network_name
}

output "ny_subnet_id" {
  value = module.ny_network.subnet_id
}

output "ny_subnet_name" {
  value = module.ny_network.subnet_name
}

output "ny_subnet_cidr" {
  value = module.ny_network.subnet_cidr
}

output "ny_vm_name" {
  value = module.ny_network.ny_vm_name
}

output "ny_vm_internal_ip" {
  value = module.ny_network.ny_vm_internal_ip
}

output "ny_vpc_name" {
  value = module.ny_network.ny_vpc_name
}

############################################
# Iowa Branch (GCP)
############################################

output "iowa_network_id" {
  value = module.iowa_network.network_id
}

output "iowa_network_name" {
  value = module.iowa_network.network_name
}

output "iowa_subnet_id" {
  value = module.iowa_network.subnet_id
}

output "iowa_subnet_name" {
  value = module.iowa_network.subnet_name
}

output "iowa_subnet_cidr" {
  value = module.iowa_network.subnet_cidr
}

output "iowa_vm_name" {
  value = module.iowa_network.iowa_vm_name
}

output "iowa_vm_internal_ip" {
  value = module.iowa_network.iowa_vm_internal_ip
}

output "iowa_vpc_name" {
  value = module.iowa_network.iowa_vpc_name
}