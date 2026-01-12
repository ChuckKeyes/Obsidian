
## 16. Auto Scaling Group — Creates EC2s across 3 AZs
resource "aws_autoscaling_group" "web" {
  name                = "ck-web-asg"
  min_size            = 2
  max_size            = 6
  desired_capacity    = 3

  vpc_zone_identifier = [
    aws_subnet.public_a.id,
    aws_subnet.public_b.id,
    aws_subnet.public_c.id
  ]

  target_group_arns = [aws_lb_target_group.web.arn]

  launch_template {
    id      = aws_launch_template.web.id
    version = "$Latest"
  }
}
