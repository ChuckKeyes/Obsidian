# SG: allow TLS from within the VPC (change cidr to 0.0.0.0/0 if internet-facing ALB/instance)
resource "aws_security_group" "allow_tls" {
  name        = "ck-allow-tls"
  description = "Allow TLS inbound; all outbound"
  vpc_id      = aws_vpc.ck_vpc_sun.id

  tags = {
    Name    = "ck-allow-tls"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}

# Ingress 443 from the VPC CIDR (use 0.0.0.0/0 for public-facing)
resource "aws_vpc_security_group_ingress_rule" "tls_ipv4_from_vpc" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = aws_vpc.ck_vpc_sun.cidr_block
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
}

# OPTIONAL: only if your VPC has IPv6
# resource "aws_vpc_security_group_ingress_rule" "tls_ipv6_from_vpc" {
#   security_group_id = aws_security_group.allow_tls.id
#   cidr_ipv6         = aws_vpc.ck_vpc_sun.ipv6_cidr_block
#   from_port         = 443
#   to_port           = 443
#   ip_protocol       = "tcp"
# }

# Egress: all traffic
resource "aws_vpc_security_group_egress_rule" "all_egress_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"   # all  ports
}


# ---------- SECURITY GROUP: Allow TLS + SSH ----------
resource "aws_security_group" "ck_allow_tls_ssh" {
  name        = "ck-allow-tls-ssh"
  description = "Allow inbound TLS/SSH; allow all outbound"
  vpc_id      = aws_vpc.ck_vpc_sun.id

  tags = {
    Name    = "ck-allow-tls-ssh"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}

# ---------- SECURITY GROUP: Allow HTTP + HTTPS + SSH ----------
resource "aws_security_group" "ck_allow_web_ssh" {
  name        = "ck-allow-web-ssh"
  description = "Allow inbound HTTP/HTTPS/SSH; allow all outbound"
  vpc_id      = aws_vpc.ck_vpc_sun.id

  tags = {
    Name    = "ck-allow-web-ssh"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}

# ---------- SECURITY GROUP: Allow Ping (ICMP) ----------
resource "aws_security_group" "ck_allow_ping" {
  name        = "ck-allow-ping"
  description = "Allow inbound ICMP (ping); no special egress"
  vpc_id      = aws_vpc.ck_vpc_sun.id

  tags = {
    Name    = "ck-allow-ping"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}

# Ingress: ICMP (all types/codes) from anywhere IPv4
resource "aws_vpc_security_group_ingress_rule" "icmp_ipv4_all" {
  security_group_id = aws_security_group.ck_allow_ping.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "icmp"
  from_port         = -1   # all ICMP types
  to_port           = -1   # all ICMP codes
  description       = "Allow ping (ICMP) from anywhere (IPv4)"
}
