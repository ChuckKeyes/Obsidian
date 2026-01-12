
## 3. Private Subnets — For back-end / DB / private services
resource "aws_subnet" "private_a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.100.11.0/24"
  availability_zone = "us-east-1a"
  tags = { Name = "ck-private-a" }
}

resource "aws_subnet" "private_b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.100.12.0/24"
  availability_zone = "us-east-1b"
  tags = { Name = "ck-private-b" }
}

resource "aws_subnet" "private_c" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.100.13.0/24"
  availability_zone = "us-east-1c"
  tags = { Name = "ck-private-c" }
}
