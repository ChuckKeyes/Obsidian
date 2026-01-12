
## 6. Public Route Table — Points to IGW for public subnets
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  tags   = { Name = "ck-public-rt" }
}

resource "aws_route" "public_default" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}
