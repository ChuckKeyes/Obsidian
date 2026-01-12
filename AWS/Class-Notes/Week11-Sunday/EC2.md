

# Public instance (for quick SSH and ALB target)
resource "aws_instance" "web" {
  ami                         = data.aws_ami.debian.id
  instance_type               = var.instance_type
  subnet_id                   = values(aws_subnet.public)[0].id
  vpc_security_group_ids      = [aws_security_group.web.id]
  associate_public_ip_address = true
  key_name                    = var.key_name != "" ? var.key_name : null
  user_data                   = file(var.user_data_path)

  tags = merge(var.tags, { Name = "${local.name}-web-1" })
}

# Debian AMI (x86_64, HVM, EBS)
data "aws_ami" "debian" {
  most_recent = true
  owners      = ["136693071363"] # Debian

  filter { name = "name"                  values = ["debian-12-amd64-*","debian-11-amd64-*","debian-12-*x86_64-*","debian-11-*x86_64-*"] }
  filter { name = "architecture"          values = ["x86_64"] }
  filter { name = "virtualization-type"   values = ["hvm"] }
  filter { name = "root-device-type"      values = ["ebs"] }
}
