output "private_ec2_id" {
  value = aws_instance.private_ec2.id
}

output "vpce_security_group_id" {
  value = aws_security_group.vpce_sg.id
}

output "s3_gateway_endpoint_id" {
  value = aws_vpc_endpoint.s3_gw.id
}
