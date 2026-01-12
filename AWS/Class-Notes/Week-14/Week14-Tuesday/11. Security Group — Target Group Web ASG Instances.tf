## 11. Target SG — ALB → instances on port 80
resource "aws_security_group" "targets_sg" {
  name   = "ck-targets-sg"
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "ck-targets-sg"
  }
}

# Allow ALB SG to reach instances on port 80
resource "aws_vpc_security_group_ingress_rule" "targets_http_from_alb" {
  security_group_id            = aws_security_group.targets_sg.id
  referenced_security_group_id = aws_security_group.alb_sg.id
  from_port                    = 80
  to_port                      = 80
  ip_protocol                  = "tcp"
  description                  = "HTTP from ALB"
}

# Optional: SSH from admin IP
resource "aws_vpc_security_group_ingress_rule" "targets_ssh_admin" {
  security_group_id = aws_security_group.targets_sg.id
  cidr_ipv4         = "0.0.0.0/0"           # or var.admin_cidr
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
  description       = "SSH from admin"
}

# Allow ping from East (Prometheus VPC CIDR)
resource "aws_vpc_security_group_ingress_rule" "targets_icmp_from_prometheus" {
  security_group_id = aws_security_group.targets_sg.id
  cidr_ipv4         = var.prometheus_vpc_cidr   # e.g. "10.20.0.0/16"
  from_port         = -1
  to_port           = -1
  ip_protocol       = "icmp"
  description       = "ICMP ping from Prometheus VPC (East)"
}

# Allow Prometheus (East) to scrape node_exporter on 9100
resource "aws_vpc_security_group_ingress_rule" "targets_9100_from_prometheus" {
  security_group_id = aws_security_group.targets_sg.id
  cidr_ipv4         = var.prometheus_vpc_cidr
  from_port         = 9100
  to_port           = 9100
  ip_protocol       = "tcp"
  description       = "Node exporter from Prometheus (East)"
}

# All outbound from targets
resource "aws_vpc_security_group_egress_rule" "targets_egress_all" {
  security_group_id = aws_security_group.targets_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
  description       = "All egress"
}
