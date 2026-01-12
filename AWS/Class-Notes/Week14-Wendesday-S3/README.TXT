✅ 1. Is this Terraform correct?

Yes, this does three things:

Enables S3 request metrics for the whole bucket

Creates a CloudWatch alarm when 4xx errors spike

Creates a CloudWatch dashboard showing AllRequests + 4xx + 5xx

All of that is perfect for free-tier-style monitoring.

🔧 2. One thing you MUST have: aws_region variable

You reference var.aws_region in the dashboard:

"region" : var.aws_region,


So somewhere (probably in variables.tf) you need:

variable "aws_region" {
  description = "AWS region where resources are deployed / monitored"
  type        = string
  default     = "us-east-1"
}


Or whatever region you’re actually using.

If you already have that, you’re golden.

🔍 3. What each block does (in plain English)
a) S3 request metrics
resource "aws_s3_bucket_metric" "site_requests" {
  bucket = aws_s3_bucket.site.id
  name   = "EntireBucket"
}


This tells AWS:

“Send per-request metrics for this whole bucket to CloudWatch under FilterId = EntireBucket.”

That’s what makes AllRequests / 4xxErrors / 5xxErrors show up.

b) 4xxErrors alarm
resource "aws_cloudwatch_metric_alarm" "s3_4xx_errors" {
  alarm_name          = "s3-${aws_s3_bucket.site.bucket}-4xx-errors"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "4xxErrors"
  namespace           = "AWS/S3"
  period              = 300
  statistic           = "Sum"
  threshold           = 10
  treat_missing_data  = "notBreaching"

  dimensions = {
    BucketName = aws_s3_bucket.site.bucket
    FilterId   = aws_s3_bucket_metric.site_requests.name  # "EntireBucket"
  }
}


This means:

Look at S3 metric 4xxErrors

For this bucket and this FilterId

In 5-minute windows (period = 300)

If Sum(4xxErrors) > 10 in any 5-minute window → ALARM

Right now it doesn’t send email/SNS, it just marks the alarm red in CloudWatch, which is perfect for a lab.

c) Dashboard
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
          "region" : var.aws_region,
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


This builds a widget with three time-series lines:

AllRequests

4xxErrors

5xxErrors

The "." entries are CloudWatch shorthand for “same as previous value in this position,” so the second/third metrics reuse BucketName and FilterId from the first row.

🧪 4. How to see this working

After terraform apply succeeds:

Go to CloudWatch → Dashboards → ck-lab-s3-website

Open the S3 website or CloudFront URL in your browser a bunch of times

Intentionally hit a wrong path, e.g.:

https://your-site/index2.html

https://your-site/images/does-not-exist.png

Wait a couple of minutes:

Dashboard: you’ll see AllRequests going up, and 4xxErrors bump when you hit bad URLs

Alarms: check Alarms → s3-ck-lab-static-site-chuck-001-4xx-errors; if you spam enough 404s, it’ll flip to ALARM

All of that is still in “monitor mode” and should be safe in the free tier for your small lab.

✅ Summary

Your code is correct for free S3 monitoring

Just make sure var.aws_region exists

Next nice step would be:

Add CloudFront metrics to the same dashboard

Or wire the alarm to an SNS topic to email you

If you want, I can bolt on:

CloudFront metrics + one “high 5xx” alarm + SNS email notification

on top of this, all in Terraform.

rewrite your Terraform so you can switch your bucket to any region instantly, including:

Regional variables

CloudFront origin adjustments

Region-specific monitoring

Just say:

“Make my S3 bucket region dynamic.”

nslookup -type=NS keyescloudsolutions.com

