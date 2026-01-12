

resource "aws_vpc_security_group_ingress_rule" "rdp_admin" {
  security_group_id = aws_security_group.web.id
  cidr_ipv4         = var.admin_cidr
  from_port         = 3389
  to_port           = 3389
  ip_protocol       = "tcp"
  description       = "RDP from admin"
}
