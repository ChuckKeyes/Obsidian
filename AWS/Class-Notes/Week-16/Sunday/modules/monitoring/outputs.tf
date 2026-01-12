
output "dashboard_name" {
  value = try(aws_cloudwatch_dashboard.static_site[0].dashboard_name, null)
}


# How to verify it worked

# AWS Console → CloudWatch → Dashboards
# Look for something like:

# kcs-waterfall-keyescloudsolutions-com-dashboard


# Refresh https://waterfall.keyescloudsolutions.com a few times and you’ll see Requests climb.

# Next upgrade (if you want)

# I can add:

# alarms (5xxErrorRate > 1%, Requests drop to 0)

# Route 53 health check widget

# SNS email notifications