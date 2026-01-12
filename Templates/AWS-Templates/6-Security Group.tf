

# Web + SSH SG for instances behind ALB
resource "aws_security_group" "web" {
  name   = "${local.name}-web-sg"
  vpc_id = aws_vpc.this.id
  tags   = merge(var.tags, { Name = "${local.name}-web-sg" })
}

# Ingress HTTP/HTTPS (usually from ALB SG; by default world for quick labs)
resource "aws_vpc_security_group_ingress_rule" "web_http" {
  count            = var.allow_http_world ? 1 : 0
  security_group_id = aws_security_group.web.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
  description       = "HTTP world (lab)"
}

resource "aws_vpc_security_group_ingress_rule" "web_https" {
  count            = var.allow_https_world ? 1 : 0
  security_group_id = aws_security_group.web.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
  description       = "HTTPS world (lab)"
}

resource "aws_vpc_security_group_ingress_rule" "ssh_admin" {
  security_group_id = aws_security_group.web.id
  cidr_ipv4         = var.admin_cidr
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
  description       = "SSH from admin"
}

resource "aws_vpc_security_group_egress_rule" "web_all_egress" {
  security_group_id = aws_security_group.web.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

# App VMs security group (3 Debian nodes)
resource "aws_security_group" "app_sg" {
  name        = "${local.vpc_name}-app-sg"
  description = "Allow SSH + node_exporter from Prometheus"
  vpc_id      = aws_vpc.this.id
}
########################################################################################################
# Prometheus security group
# SG for Prometheus VM

resource "aws_security_group" "prometheus_sg" {
  name        = "${local.vpc_name}-prometheus-sg"
  description = "Allow Prometheus UI + SSH"
  vpc_id      = aws_vpc.this.id

  tags = merge(var.tags, {
    Name = "${local.vpc_name}-prometheus-sg"
  })
}

# SSH from your home
resource "aws_vpc_security_group_ingress_rule" "prometheus_ssh" {
  security_group_id = aws_security_group.prometheus_sg.id
  cidr_ipv4         = var.admin_cidr
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
  description       = "SSH to Prometheus"
}

# Allow SSH into app_sg nodes *from* the Prometheus SG
resource "aws_vpc_security_group_ingress_rule" "app_ssh_from_prometheus" {
  security_group_id           = aws_security_group.app_sg.id
  referenced_security_group_id = aws_security_group.prometheus_sg.id

  from_port   = 22
  to_port     = 22
  ip_protocol = "tcp"
  description = "SSH from Prometheus bastion to app nodes"
}




# Prometheus UI on 9090 from your home
resource "aws_vpc_security_group_ingress_rule" "prometheus_ui" {
  security_group_id = aws_security_group.prometheus_sg.id
  cidr_ipv4         = var.admin_cidr
  from_port         = 9090
  to_port           = 9090
  ip_protocol       = "tcp"
  description       = "Prometheus UI"
}

# Allow all egress
resource "aws_vpc_security_group_egress_rule" "prometheus_all_egress" {
  security_group_id = aws_security_group.prometheus_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}
