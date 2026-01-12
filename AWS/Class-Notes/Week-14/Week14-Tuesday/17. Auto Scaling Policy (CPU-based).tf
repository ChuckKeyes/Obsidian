
## 17. Auto Scaling Policy — Scale out/in at 50% CPU
resource "aws_autoscaling_policy" "cpu_scale" {
  name                   = "ck-web-asg-cpu"
  autoscaling_group_name = aws_autoscaling_group.web.name
  policy_type            = "TargetTrackingScaling"

  target_tracking_configuration {
    target_value = 50.0  # Target 50% average CPU

    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
  }
}

