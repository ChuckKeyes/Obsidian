# variables.tf
variable "region" {
  type    = string
  default = "us-east-1"
}

# Most recent Debian 11 or 12 AMD64 HVM EBS-backed image (community)
data "aws_ami" "debian" {
  most_recent = true
  owners      = ["136693071363"] # Debian official community account

  filter {
    name   = "name"
    values = [
      "debian-12-amd64-*",
      "debian-11-amd64-*",
      "debian-12-*x86_64-*",
      "debian-11-*x86_64-*",
    ]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }



}

resource "aws_spot_instance_request" "cheap_worker" {
  ami           = data.aws_ami.debian.id  # <-- correct reference (no quotes)
  instance_type = "t3.micro"


 # Put it in a public subnet and give it a public IP
  subnet_id                   = data.aws_subnets.default_public.ids[0]
  associate_public_ip_address = true

  vpc_security_group_ids = [aws_security_group.allow_icmp.id]




  # Optional: simple user data (not required for ping)
  # External user-data file
  user_data = file("${path.module}/user_data.sh")

  tags = {
    Name = "debian-spot-ping-test"
  }





}


# ---------- Spot Instance (give it a public IP + SG) ----------
# resource "aws_spot_instance_request" "cheap_worker" 
#   ami           = data.aws_ami.debian.id
#   instance_type = "t3.micro"

 