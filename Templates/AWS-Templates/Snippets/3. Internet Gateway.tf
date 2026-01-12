
## 3. Internet Gateway — Required for outbound/public Internet
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = { Name = "ck-igw" }
}
