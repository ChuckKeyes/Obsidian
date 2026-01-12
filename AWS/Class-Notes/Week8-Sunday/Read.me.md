
## Terraform 
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table

curl -O --ssl-no-revoke [https://raw.githubusercontent.com/aaron-dm-mcdonald/aws-image-resizer/refs/heads/main/.gitignore](https://raw.githubusercontent.com/aaron-dm-mcdonald/aws-image-resizer/refs/heads/main/.gitignore "https://raw.githubusercontent.com/aaron-dm-mcdonald/aws-image-resizer/refs/heads/main/.gitignore")

resource "aws_vpc" "ck_vpc_sun"{
cidr_block = "10.100.0.0/16"
instance_tenancy = "default"
enable_dns_hostnames = true
 enable_dns_support = true
 tags = {
 Name = "ck_vpc_sun"
        }
    }
cidr  10.100.0.0/16
## Public subnets:
10.100.0.1/24
10.100.0.2/24
10.100.0.3/24
## Private Subnets
10.100.11.0/24
10.100.12.0/24
10.100.13.0/24

# ---------- PUBLIC SUBNETS ----------

resource "aws_subnet" "public_us-east_1a" {
  vpc_id                  = aws_vpc.ck_vpc_sun.id
  cidr_block              = "10.100.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-us-east-1a"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}

  

resource "aws_subnet" "public_us-east_1b" {
  vpc_id                  = aws_vpc.ck_vpc_sun.id
  cidr_block              = "10.100.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-us-east-1b"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}

resource "aws_subnet" "public_us-east_1c" {
  vpc_id                  = aws_vpc.ck_vpc_sun.id
  cidr_block              = "10.100.3.0/24"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-us-east-1c"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}

# ---------- PRIVATE SUBNETS ----------

resource "aws_subnet" "private_us-east_1a" {
  vpc_id            = aws_vpc.ck_vpc_sun.id
  cidr_block        = "10.100.11.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name    = "private-us-east-1a"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}

  

resource "aws_subnet" "private_us-east_1b" {
  vpc_id            = aws_vpc.ck_vpc_sun.id
  cidr_block        = "10.100.12.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name    = "private-us-east-1b"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}

resource "aws_subnet" "private_us-east_1c" {
  vpc_id            = aws_vpc.ck_vpc_sun.id
  cidr_block        = "10.100.13.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name    = "private-us-east-1c"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}
##########################################################################
# Internet Gateway (v5+ style: create + attach)

resource "aws_internet_gateway" "ck_igw" {
  tags = {
    Name    = "ck_vpc_sun-igw"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}

resource "aws_internet_gateway_attachment" "ck_igw_attach" {
  vpc_id              = aws_vpc.ck_vpc_sun.id
  internet_gateway_id = aws_internet_gateway.ck_igw.id
}


# Allocate an Elastic IP for the NAT Gateway (v5: use domain = "vpc")

resource "aws_eip" "ck_nat_eip" {
  domain = "vpc"
  tags = {
    Name    = "ck-vpc-sun-nat-eip"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}
# NAT Gateway lives in a PUBLIC subnet (use your public_us-east_1a)

resource "aws_nat_gateway" "ck_nat_gw" {
  allocation_id = aws_eip.ck_nat_eip.id
  subnet_id     = aws_subnet.public_us-east_1a.id
  tags = {
    Name    = "ck-vpc-sun-nat-gw"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
  
  # If you created the IGW with a separate attachment (AWS provider v5+), depend on it:
  depends_on = [aws_internet_gateway_attachment.ck_igw_attach]
  # If you're using the older style (IGW has vpc_id directly), use this instead:
  # depends_on = [aws_internet_gateway.ck_igw]
}

# ---------------------------

# ROUTE TABLES

# ---------------------------

# Private RT -> default route via NAT

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.ck_vpc_sun.id
  tags = {
    Name    = "ck-vpc-sun-private-rt"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}

resource "aws_route" "private_default_v4" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.ck_nat_gw.id
}

 # Public RT -> default route via IGW
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.ck_vpc_sun.id
  tags = {
    Name    = "ck-vpc-sun-public-rt"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}

resource "aws_route" "public_default_v4" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.ck_igw.id
  depends_on             = [aws_internet_gateway_attachment.ck_igw_attach]
}
# ---------------------------

# ASSOCIATIONS (match your existing subnet resource names)

# ---------------------------

# Private subnets

resource "aws_route_table_association" "private_us-east_1a" {
  subnet_id      = aws_subnet.private_us-east_1a.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_us-east_1b" {
  subnet_id      = aws_subnet.private_us-east_1b.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_us-east_1c" {
  subnet_id      = aws_subnet.private_us-east_1c.id
  route_table_id = aws_route_table.private.id
}

## Public subnets

resource "aws_route_table_association" "public_us-east_1a" {
  subnet_id      = aws_subnet.public_us-east_1a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_us-east_1b" {
  subnet_id      = aws_subnet.public_us-east_1b.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_us-east_1c" {
  subnet_id      = aws_subnet.public_us-east_1c.id
  route_table_id = aws_route_table.public.id
}