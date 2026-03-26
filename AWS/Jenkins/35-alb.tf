resource "aws_lb" "jenkins" {
  name               = "jenkins-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.jenkins_alb_sg.id]
  subnets            = var.public_subnet_ids

  tags = {
    Name = "jenkins-alb"
  }
}