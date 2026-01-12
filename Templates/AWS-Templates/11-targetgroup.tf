resource "aws_lb_target_group" "web" {
  count       = var.alb_enable ? 1 : 0
  name        = "${local.name}-tg"
  port        = var.alb_target_port
  protocol    = "HTTP"
  vpc_id      = aws_vpc.this.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = var.alb_health_interval
    path                = var.alb_health_path
    protocol            = "HTTP"
    healthy_threshold   = var.alb_healthy_threshold
    unhealthy_threshold = var.alb_unhealthy_threshold
    timeout             = var.alb_health_timeout
    matcher             = "200"
  }

  tags = merge(
    var.tags,
    { Name = "${local.name}-tg" }
  )
}
