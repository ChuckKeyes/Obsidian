############################################
# Bonus B (CEK) - ALB (Public) -> Target Group (Private EC2) + TLS + WAF + Monitoring
############################################

locals {
  cek_fqdn = "${var.app_subdomain}.${var.domain_name}"
}

############################################
# Security Group: ALB
############################################

resource "aws_security_group" "cek_alb_sg01" {
  name        = "${var.project_name}-alb-sg01"
  description = "ALB security group"
  vpc_id      = var.vpc_id

  # Inbound: Public web
  ingress {
    description = "HTTP from Internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS from Internet"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound: to private targets (app port)
  egress {
    description = "To private targets on app port"
    from_port   = var.target_port
    to_port     = var.target_port
    protocol    = "tcp"
    cidr_blocks = var.vpc_cidr_blocks
  }

  tags = merge(var.tags, {
    Name = "${var.project_name}-alb-sg01"
  })
}

# Allow ALB -> EC2 on app port
resource "aws_security_group_rule" "cek_ec2_ingress_from_alb01" {
  type                     = "ingress"
  security_group_id        = var.ec2_security_group_id
  from_port                = var.target_port
  to_port                  = var.target_port
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.cek_alb_sg01.id
}

############################################
# Application Load Balancer
############################################

resource "aws_lb" "cek_alb01" {
  name               = "${var.project_name}-alb01"
  load_balancer_type = "application"
  internal           = false

  security_groups = [aws_security_group.cek_alb_sg01.id]
  subnets         = var.public_subnet_ids

  tags = merge(var.tags, {
    Name = "${var.project_name}-alb01"
  })
}

############################################
# Target Group + Attachment
############################################

resource "aws_lb_target_group" "cek_tg01" {
  name     = "${var.project_name}-tg01"
  port     = var.target_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    enabled             = true
    interval            = var.health_check_interval
    path                = var.health_check_path
    port                = "traffic-port"
    protocol            = "HTTP"
    healthy_threshold   = var.health_check_healthy_threshold
    unhealthy_threshold = var.health_check_unhealthy_threshold
    timeout             = var.health_check_timeout
    matcher             = var.health_check_matcher
  }

  tags = merge(var.tags, {
    Name = "${var.project_name}-tg01"
  })
}

resource "aws_lb_target_group_attachment" "cek_tg_attach01" {
  target_group_arn = aws_lb_target_group.cek_tg01.arn
  target_id        = var.private_instance_id
  port             = var.target_port
}

############################################
# ACM Certificate (TLS)
############################################

resource "aws_acm_certificate" "cek_acm_cert01" {
  domain_name       = local.cek_fqdn
  validation_method = var.certificate_validation_method

  tags = merge(var.tags, {
    Name = "${var.project_name}-acm-cert01"
  })
}

# Optional: Create Route53 validation records (recommended)
resource "aws_route53_record" "cek_acm_validation" {
  count = var.create_route53_records ? length(aws_acm_certificate.cek_acm_cert01.domain_validation_options) : 0

  zone_id = var.route53_zone_id
  name    = aws_acm_certificate.cek_acm_cert01.domain_validation_options[count.index].resource_record_name
  type    = aws_acm_certificate.cek_acm_cert01.domain_validation_options[count.index].resource_record_type
  records = [aws_acm_certificate.cek_acm_cert01.domain_validation_options[count.index].resource_record_value]
  ttl     = 60
}

resource "aws_acm_certificate_validation" "cek_acm_validation01" {
  certificate_arn = aws_acm_certificate.cek_acm_cert01.arn

  validation_record_fqdns = var.create_route53_records
    ? [for r in aws_route53_record.cek_acm_validation : r.fqdn]
    : var.validation_record_fqdns
}

############################################
# ALB Listeners: HTTP -> HTTPS redirect, HTTPS -> TG
############################################

resource "aws_lb_listener" "cek_http_listener01" {
  load_balancer_arn = aws_lb.cek_alb01.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "redirect"
    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_listener" "cek_https_listener01" {
  load_balancer_arn = aws_lb.cek_alb01.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = var.ssl_policy
  certificate_arn   = aws_acm_certificate_validation.cek_acm_validation01.certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.cek_tg01.arn
  }

  depends_on = [aws_acm_certificate_validation.cek_acm_validation01]
}

############################################
# WAFv2 Web ACL (Basic managed rules)
############################################

resource "aws_wafv2_web_acl" "cek_waf01" {
  count = var.enable_waf ? 1 : 0

  name  = "${var.project_name}-waf01"
  scope = "REGIONAL"

  default_action { allow {} }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "${var.project_name}-waf01"
    sampled_requests_enabled   = true
  }

  rule {
    name     = "AWSManagedRulesCommonRuleSet"
    priority = 1

    override_action { none {} }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesCommonRuleSet"
        vendor_name = "AWS"
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "${var.project_name}-waf-common"
      sampled_requests_enabled   = true
    }
  }

  tags = merge(var.tags, { Name = "${var.project_name}-waf01" })
}

resource "aws_wafv2_web_acl_association" "cek_waf_assoc01" {
  count = var.enable_waf ? 1 : 0

  resource_arn = aws_lb.cek_alb01.arn
  web_acl_arn  = aws_wafv2_web_acl.cek_waf01[0].arn
}

############################################
# CloudWatch Alarm: ALB 5xx -> SNS
############################################

resource "aws_cloudwatch_metric_alarm" "cek_alb_5xx_alarm01" {
  alarm_name          = "${var.project_name}-alb-5xx-alarm01"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.alb_5xx_evaluation_periods
  threshold           = var.alb_5xx_threshold
  period              = var.alb_5xx_period_seconds
  statistic           = "Sum"

  namespace   = "AWS/ApplicationELB"
  metric_name = "HTTPCode_ELB_5XX_Count"

  dimensions = {
    LoadBalancer = aws_lb.cek_alb01.arn_suffix
  }

  alarm_actions = [var.sns_topic_arn]

  tags = merge(var.tags, {
    Name = "${var.project_name}-alb-5xx-alarm01"
  })
}

############################################
# CloudWatch Dashboard
############################################

resource "aws_cloudwatch_dashboard" "cek_dashboard01" {
  dashboard_name = "${var.project_name}-dashboard01"

  dashboard_body = jsonencode({
    widgets = [
      {
        type   = "metric"
        x      = 0
        y      = 0
        width  = 12
        height = 6
        properties = {
          metrics = [
            ["AWS/ApplicationELB", "RequestCount", "LoadBalancer", aws_lb.cek_alb01.arn_suffix],
            [".", "HTTPCode_ELB_5XX_Count", ".", aws_lb.cek_alb01.arn_suffix]
          ]
          period = 300
          stat   = "Sum"
          region = var.aws_region
          title  = "CEK ALB: Requests + 5XX"
        }
      },
      {
        type   = "metric"
        x      = 12
        y      = 0
        width  = 12
        height = 6
        properties = {
          metrics = [
            ["AWS/ApplicationELB", "TargetResponseTime", "LoadBalancer", aws_lb.cek_alb01.arn_suffix]
          ]
          period = 300
          stat   = "Average"
          region = var.aws_region
          title  = "CEK ALB: Target Response Time"
        }
      }
    ]
  })
}
