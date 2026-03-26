terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.34"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

data "aws_ami" "amazon_linux_2023" {
  most_recent = true
  owners      = ["137112412989"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023*-x86_64"]
  }
}

# vpc_security_group_ids = [aws_security_group.jenkins_ec2_sg.id]

resource "aws_security_group" "jenkins_ec2_sg" {
  name        = "jenkins-ec2-sg"
  description = "Allow Jenkins only from ALB"
  vpc_id      = var.vpc_id

  ingress {
    description     = "Jenkins from ALB only"
    from_port       = 8080
    to_port         = 8080
    protocol        = "tcp"
    security_groups = [aws_security_group.jenkins_alb_sg.id]
  }

  ingress {
    description = "SSH from your IP only"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.ssh_allowed_cidrs
  }

  egress {
    description = "All outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "jenkins-ec2-sg"
  }
}

resource "aws_instance" "jenkins_vm" {
  ami                         = data.aws_ami.amazon_linux_2023.id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.jenkins_ec2_sg.id]
  key_name                    = var.key_name
  associate_public_ip_address = true

  user_data = file("${path.module}/plugins.sh")

  root_block_device {
    volume_size           = 20
    volume_type           = "gp3"
    delete_on_termination = true
    encrypted             = true
  }

  tags = merge(var.tags, {
    Name = "${var.project_name}-jenkins-vm"
  })
}

resource "aws_lb_target_group_attachment" "jenkins" {
  target_group_arn = aws_lb_target_group.jenkins.arn
  target_id        = aws_instance.jenkins_vm.id
  port             = 8080
}