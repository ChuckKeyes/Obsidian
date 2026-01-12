resource "aws_vpc" "ck_vpc_sun"{
    cidr_block = "10.100.0.0/16"
    instance_tenancy = "default"
    enable_dns_hostnames = true
    enable_dns_support = true

    tags = {
      Name = "ck_vpc_sun"

        }
    }
    
    
resource "aws_instance" "ck-ec2" {
  ami = "ami-09968b16214ef62ce" # us-east-1
  instance_type ="t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  subnet_id =aws_subnet.public_us-east_1a.id
  associate_public_ip_address = true
  

  # user_data = file("user_data2.sh")


    tags = {
           Name =  "ck-ec2"
           }
    }
