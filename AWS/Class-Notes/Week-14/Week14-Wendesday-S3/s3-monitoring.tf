####################################################
# Enable S3 request metrics for the entire bucket
# (Shows AllRequests, 4xxErrors, 5xxErrors, BytesDownloaded, etc.)
####################################################
resource "aws_s3_bucket_metric" "site_requests" {
  bucket = aws_s3_bucket.site.id
  name   = "EntireBucket"

  # Empty filter => whole bucket
  # (You could filter by prefix later if needed)
}


####################################################
# CloudWatch alarm for S3 4xx errors on this bucket
####################################################
resource "aws_cloudwatch_metric_alarm" "s3_4xx_errors" {
  alarm_name          = "s3-${aws_s3_bucket.site.bucket}-4xx-errors"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "4xxErrors"
  namespace           = "AWS/S3"
  period              = 300              # 5 minutes
  statistic           = "Sum"
  threshold           = 10               # >10 errors in 5 minutes
  treat_missing_data  = "notBreaching"

  dimensions = {
    BucketName = aws_s3_bucket.site.bucket
    FilterId   = aws_s3_bucket_metric.site_requests.name  # "EntireBucket"
  }

  alarm_description = "Alarm when S3 bucket has more than 10 4xx errors in 5 minutes"
}

####################################################
# CloudWatch dashboard for S3 static site
####################################################
resource "aws_cloudwatch_dashboard" "s3_site" {
  dashboard_name = "ck-lab-s3-website"

  dashboard_body = jsonencode({
    widgets = [
      {
        "type" : "metric",
        "x" : 0,
        "y" : 0,
        "width" : 12,
        "height" : 6,
        "properties" : {
          "title" : "S3 Requests & Errors - ${aws_s3_bucket.site.bucket}",
          "view" : "timeSeries",
          "stacked" : false,
          "region" : "us-east-1",
          "metrics" : [
            [ "AWS/S3", "AllRequests",  "BucketName", aws_s3_bucket.site.bucket, "FilterId", aws_s3_bucket_metric.site_requests.name ],
            [ ".",     "4xxErrors",    ".",          ".",                        ".",       "." ],
            [ ".",     "5xxErrors",    ".",          ".",                        ".",       "." ]
          ],
          "period" : 300,
          "stat" : "Sum"
        }
      }
    ]
  })
}
