

## 14. Application Load Balancer — Public entry point 3 AZs
resource "aws_lb" "web" {
  name               = "ck-web-alb"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets = [
    aws_subnet.public_a.id,
    aws_subnet.public_b.id,
    aws_subnet.public_c.id
  ]

  tags = { Name = "ck-web-alb" }
}
