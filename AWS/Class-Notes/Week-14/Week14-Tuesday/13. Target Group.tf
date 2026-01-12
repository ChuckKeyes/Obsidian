
### 13.  Target Group — ALB sends traffic here, health checks instances
resource "aws_lb_target_group" "web" {
  name        = "ck-web-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.main.id
  target_type = "instance"

  health_check {
    path     = "/"
    protocol = "HTTP"
    matcher  = "200"
  }

  tags = { Name = "ck-web-tg" }
}