
# -------- NAT (single, cost-saving) --------
resource "aws_eip" "nat" {
  domain = "vpc"
  tags   = { Name = "main-nat-eip" }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = values(aws_subnet.public)[0].id # place NAT in first public subnet
  tags          = { Name = "main-nat" }

  depends_on = [aws_internet_gateway.igw]
}

# -------- Private Subnets (6) --------
# Distribute across the same 3 AZs: 2 per AZ
locals {
  private_map = {
    p1 = { cidr = local.private_cidrs[0], az = local.azs[0] }
    p2 = { cidr = local.private_cidrs[1], az = local.azs[1] }
    p3 = { cidr = local.private_cidrs[2], az = local.azs[2] }
    p4 = { cidr = local.private_cidrs[3], az = local.azs[0] }
    p5 = { cidr = local.private_cidrs[4], az = local.azs[1] }
    p6 = { cidr = local.private_cidrs[5], az = local.azs[2] }
  }
}

resource "aws_subnet" "private" {
  for_each = local.private_map

  vpc_id            = aws_vpc.main.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az

  tags = { Name = "private-${each.key}" }
}

# Private route table (shared by all privates; uses single NAT)
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
  tags   = { Name = "private-rt" }
}

resource "aws_route" "private_to_nat" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat.id
}

resource "aws_route_table_association" "private_assoc" {
  for_each       = aws_subnet.private
  subnet_id      = each.value.id
  route_table_id = aws_route_table.private.id
}