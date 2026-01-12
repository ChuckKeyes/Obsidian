# Allocate an Elastic IP for the NAT Gateway (v5: use domain = "vpc")
resource "aws_eip" "ck_nat_eip" {
  domain = "vpc"

  tags = {
    Name    = "ck-vpc-sun-nat-eip"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}

# NAT Gateway lives in a PUBLIC subnet (use your public_us-east_1a)
resource "aws_nat_gateway" "ck_nat_gw" {
  allocation_id = aws_eip.ck_nat_eip.id
  subnet_id     = aws_subnet.public_us-east_1a.id

  tags = {
    Name    = "ck-vpc-sun-nat-gw"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }

  # If you created the IGW with a separate attachment (AWS provider v5+), depend on it:
  depends_on = [aws_internet_gateway_attachment.ck_igw_attach]
  # If you're using the older style (IGW has vpc_id directly), use this instead:
  # depends_on = [aws_internet_gateway.ck_igw]
}
