resource "aws_subnet" "public"{
    vpc_id = "ck_subnet" {
    cidr_block = "10.0.1.0/16"
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = true

    tags = {
        Nmae = " public-subnet-us-east-1a"
    }
    }
}
