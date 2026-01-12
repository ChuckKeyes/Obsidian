# Placeholder: add CloudWatch dashboard/alarms later.
# Keeping module here so your root stays stable as you expand.
resource "aws_cloudwatch_dashboard" "static_site" {
  count          = var.enabled ? 1 : 0
  dashboard_name = "kcs-${replace(var.site_label, ".", "-")}-dashboard"

  dashboard_body = jsonencode({
    widgets = [
      # ---- CloudFront Requests ----
      {
        type   = "metric"
        x      = 0
        y      = 0
        width  = 12
        height = 6
        properties = {
          title  = "CloudFront Requests (Sum)"
          region = var.aws_region
          stat   = "Sum"
          period = 300
          metrics = [
            ["AWS/CloudFront", "Requests", "DistributionId", var.cloudfront_distribution_id, "Region", "Global"]
          ]
        }
      },

      # ---- CloudFront 4xx / 5xx Error Rate ----
      {
        type   = "metric"
        x      = 12
        y      = 0
        width  = 12
        height = 6
        properties = {
          title  = "CloudFront Error Rate (4xx, 5xx)"
          region = var.aws_region
          stat   = "Average"
          period = 300
          metrics = [
            ["AWS/CloudFront", "4xxErrorRate", "DistributionId", var.cloudfront_distribution_id, "Region", "Global"],
            [".", "5xxErrorRate", ".", ".", ".", "."]
          ]
        }
      },

      # ---- CloudFront Cache Hit Rate ----
      {
        type   = "metric"
        x      = 0
        y      = 6
        width  = 12
        height = 6
        properties = {
          title  = "CloudFront Cache Hit Rate (Avg)"
          region = var.aws_region
          stat   = "Average"
          period = 300
          metrics = [
            ["AWS/CloudFront", "CacheHitRate", "DistributionId", var.cloudfront_distribution_id, "Region", "Global"]
          ]
        }
      },

      # ---- CloudFront Bytes Downloaded ----
      {
        type   = "metric"
        x      = 12
        y      = 6
        width  = 12
        height = 6
        properties = {
          title  = "Bytes Downloaded (Sum)"
          region = var.aws_region
          stat   = "Sum"
          period = 300
          metrics = [
            ["AWS/CloudFront", "BytesDownloaded", "DistributionId", var.cloudfront_distribution_id, "Region", "Global"]
          ]
        }
      }
    ]
  })
}
