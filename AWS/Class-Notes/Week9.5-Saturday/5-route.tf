# ---------------------------
# ROUTE TABLES
# ---------------------------

# Private RT -> default route via NAT
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.ck_vpc_sun.id
  tags = {
    Name    = "ck-vpc-sun-private-rt"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}

resource "aws_route" "private_default_v4" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.ck_nat_gw.id
}

# Public RT -> default route via IGW
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.ck_vpc_sun.id
  tags = {
    Name    = "ck-vpc-sun-public-rt"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}

resource "aws_route" "public_default_v4" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.ck_igw.id
  depends_on             = [aws_internet_gateway_attachment.ck_igw_attach]
}

# ---------------------------
# ASSOCIATIONS (match your existing subnet resource names)
# ---------------------------

# Private subnets
resource "aws_route_table_association" "private_us-east_1a" {
  subnet_id      = aws_subnet.private_us-east_1a.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_us-east_1b" {
  subnet_id      = aws_subnet.private_us-east_1b.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_us-east_1c" {
  subnet_id      = aws_subnet.private_us-east_1c.id
  route_table_id = aws_route_table.private.id
}

# Public subnets
resource "aws_route_table_association" "public_us-east_1a" {
  subnet_id      = aws_subnet.public_us-east_1a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_us-east_1b" {
  subnet_id      = aws_subnet.public_us-east_1b.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_us-east_1c" {
  subnet_id      = aws_subnet.public_us-east_1c.id
  route_table_id = aws_route_table.public.id
}
