# Internet Gateway (v5+ style: create + attach)
resource "aws_internet_gateway" "ck_igw" {
  tags = {
    Name    = "ck_vpc_sun-igw"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}

resource "aws_internet_gateway_attachment" "ck_igw_attach" {
  vpc_id              = aws_vpc.ck_vpc_sun.id
  internet_gateway_id = aws_internet_gateway.ck_igw.id
}
