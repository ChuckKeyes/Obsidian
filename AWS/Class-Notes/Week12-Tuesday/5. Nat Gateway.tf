
## 5. NAT Gateway — Private instances need outbound Internet
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_a.id
  depends_on    = [aws_internet_gateway.igw]
  tags = { Name = "ck-nat-gw" }
}
