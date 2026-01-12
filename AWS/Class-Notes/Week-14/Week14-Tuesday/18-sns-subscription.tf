#############################################
# SNS topic for ASG notifications
#############################################

resource "aws_sns_topic" "asg_alerts" {
  name = "ck-asg-alerts"
}

#   lifecycle {
#     prevent_destroy = true
#   }
# }

resource "aws_sns_topic_subscription" "asg_email" {
  topic_arn = aws_sns_topic.asg_alerts.arn
  protocol  = "email"
  endpoint  = var.notify_email
}
