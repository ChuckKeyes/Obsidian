############################################
# 9-Load Balancer.tf
############################################

# Locals for names (keep under 32 chars for ALB/TG)
locals {
  alb_name = "${var.project_name}-alb"
  tg_name  = "${var.project_name}-tg"
}

# Only build ALB if enabled
resource "aws_lb" "this" {
  count              = var.alb_enable ? 1 : 0
  name               = local.alb_name
  load_balancer_type = "application"

  # aws_subnet.public is a map keyed by AZ; iterate deterministically by var.azs
  subnets         = [for az in var.azs : aws_subnet.public[az].id]
  security_groups = [aws_security_group.web.id]
  idle_timeout    = 60

  tags = merge(var.tags, { Name = local.alb_name })
}

resource "aws_lb_target_group" "web" {
  count    = var.alb_enable ? 1 : 0
  name     = local.tg_name
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

  tags = merge(var.tags, { Name = local.tg_name })
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

# If you're attaching a single EC2 instance (not ASG), keep this.
# If you attach via ASG's target_group_arns, REMOVE this block.
resource "aws_lb_target_group_attachment" "web" {
  count            = var.alb_enable ? 1 : 0
  target_group_arn = aws_lb_target_group.web[0].arn
  target_id        = aws_instance.web.id
  port             = 80
}
