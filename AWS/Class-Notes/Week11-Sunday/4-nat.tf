# nat.tf

locals {
  nat_az = var.azs[0]  # e.g., "us-east-1a"
}

resource "aws_eip" "nat_eip" {
  domain = "vpc"
  tags = merge(var.tags, { Name = "${var.project_name}-nat-eip" })
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public[local.nat_az].id  # <— key into your public subnet map

  tags = merge(var.tags, { Name = "${var.project_name}-nat-gw" })
  depends_on = [aws_internet_gateway.this]  # or your IGW attachment resource if you use one
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.this.id
  tags = merge(var.tags, { Name = "${var.project_name}-private-rt" })
}

resource "aws_route" "private_default_route" {
  route_table_id         = aws_route_table.private_rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gw.id
}

resource "aws_route_table_association" "private_assoc" {
  for_each      = aws_subnet.private
  subnet_id     = each.value.id
  route_table_id = aws_route_table.private_rt.id
}
