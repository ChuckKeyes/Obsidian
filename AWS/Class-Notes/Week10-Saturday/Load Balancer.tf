

# Only build ALB if enabled
resource "aws_lb" "this" {
  count              = var.alb_enable ? 1 : 0
  name               = local.alb_name
  load_balancer_type = "application"
  subnets            = [for s in aws_subnet.public : s.id]
  security_groups    = [aws_security_group.web.id] # allow 80/443 from world in lab mode
  idle_timeout       = 60
  tags               = merge(var.tags, { Name = local.alb_name })
}

resource "aws_lb_target_group" "web" {
  count    = var.alb_enable ? 1 : 0
  name     = "${local.name}-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.this.id

  health_check {
    path                = "/"
    matcher             = "200-399"
    interval            = 15
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
  }

  tags = merge(var.tags, { Name = "${local.name}-tg" })
}

resource "aws_lb_listener" "http" {
  count             = var.alb_enable ? 1 : 0
  load_balancer_arn = aws_lb.this[0].arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web[0].arn
  }
}

resource "aws_lb_target_group_attachment" "web" {
  count            = var.alb_enable ? 1 : 0
  target_group_arn = aws_lb_target_group.web[0].arn
  target_id        = aws_instance.web.id
  port             = 80
}
