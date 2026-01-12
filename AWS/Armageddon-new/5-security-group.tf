# HTTP 80 from anywhere
resource "aws_security_group_rule" "ec2_http_in" {
  type              = "ingress"
  security_group_id = aws_security_group.kcs_ec2_sg01.id
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

# SSH 22 from your IP only (recommended)
resource "aws_security_group_rule" "ec2_ssh_in" {
  count             = var.my_ip_cidr != "" ? 1 : 0
  type              = "ingress"
  security_group_id = aws_security_group.kcs_ec2_sg01.id
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       =  ["0.0.0.0/0"] 

}
