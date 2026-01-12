
## 10. ALB Security Group — ALB open to world on 80/443
resource "aws_security_group" "alb_sg" {
  name   = "ck-alb-sg"
  vpc_id = aws_vpc.main.id
  tags   = { Name = "ck-alb-sg" }
}

resource "aws_vpc_security_group_ingress_rule" "alb_http" {
  security_group_id = aws_security_group.alb_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
  description       = "HTTP from Internet"
}

resource "aws_vpc_security_group_egress_rule" "alb_egress_all" {
  security_group_id = aws_security_group.alb_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
  description       = "All egress"
}

### https://docs.aws.amazon.com/vpc/latest/userguide/vpc-security-groups.html


#  ![[Security group example.png]]
