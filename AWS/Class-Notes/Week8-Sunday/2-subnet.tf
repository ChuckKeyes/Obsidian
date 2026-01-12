# ---------- PUBLIC SUBNETS ----------
resource "aws_subnet" "public_us-east_1a" {
  vpc_id                  = aws_vpc.ck_vpc_sun.id
  cidr_block              = "10.100.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-us-east-1a"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}

resource "aws_subnet" "public_us-east_1b" {
  vpc_id                  = aws_vpc.ck_vpc_sun.id
  cidr_block              = "10.100.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-us-east-1b"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}

resource "aws_subnet" "public_us-east_1c" {
  vpc_id                  = aws_vpc.ck_vpc_sun.id
  cidr_block              = "10.100.3.0/24"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-us-east-1c"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}

# ---------- PRIVATE SUBNETS ----------
resource "aws_subnet" "private_us-east_1a" {
  vpc_id            = aws_vpc.ck_vpc_sun.id
  cidr_block        = "10.100.11.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name    = "private-us-east-1a"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}

resource "aws_subnet" "private_us-east_1b" {
  vpc_id            = aws_vpc.ck_vpc_sun.id
  cidr_block        = "10.100.12.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name    = "private-us-east-1b"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}

resource "aws_subnet" "private_us-east_1c" {
  vpc_id            = aws_vpc.ck_vpc_sun.id
  cidr_block        = "10.100.13.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name    = "private-us-east-1c"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}
