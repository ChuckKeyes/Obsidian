
# Launch Template
resource "aws_launch_template" "web_lt" {
  count = var.asg_enable ? 1 : 0
  name_prefix   = "${local.name}-lt-"
  image_id      = data.aws_ami.debian.id
  instance_type = var.instance_type
  key_name      = var.key_name != "" ? var.key_name : null
  user_data = filebase64("${path.module}/${var.user_data_path}")


  vpc_security_group_ids = [aws_security_group.web.id]

  tag_specifications {
    resource_type = "instance"
    tags = merge(var.tags, { Name = "${local.name}-asg-instance" })
  }
}

# Auto Scaling Group
resource "aws_autoscaling_group" "web_asg" {
  count                = var.asg_enable ? 1 : 0
  name                 = "${local.name}-asg"
  min_size             = var.asg_min_size
  max_size             = var.asg_max_size
  desired_capacity     = var.asg_desired
  health_check_type    = "EC2"
  vpc_zone_identifier  = [for s in aws_subnet.public : s.id]
  target_group_arns    = var.alb_enable ? [aws_lb_target_group.web[0].arn] : []

  launch_template {
    id      = aws_launch_template.web_lt[0].id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "${local.name}-asg"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [aws_lb.this]
}

resource "aws_autoscaling_policy" "cpu_target" {
  count = var.asg_enable ? 1 : 0

  name                   = "${local.name}-asg-cpu-target"
  policy_type            = "TargetTrackingScaling"
  autoscaling_group_name = aws_autoscaling_group.web_asg[0].name

  target_tracking_configuration {
    target_value = var.asg_cpu_target  # <-- % CPU you set in variables.tf

    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    # customized_metric_specification {
      # not used here; you can remove this block if provider complains
    # }

    # scale_in_cooldown  = var.asg_scale_in_cooldown
    # scale_out_cooldown = var.asg_scale_out_cooldown
  }
}

