data "aws_caller_identity" "self" {}
data "aws_region" "current" {}

locals {
  prefix = var.project_name

  # Safer than guessing with '*' — build the ARN for THIS secret name.
  secret_arn = "arn:aws:secretsmanager:${data.aws_region.current.region}:${data.aws_caller_identity.self.account_id}:secret:${var.db_secret_name}*"
}

############################################
# SG for Interface Endpoints
############################################
resource "aws_security_group" "vpce_sg" {
  name        = "${local.prefix}-vpce-sg01"
  description = "SG for VPC Interface Endpoints"
  vpc_id      = var.vpc_id

  tags = { Name = "${local.prefix}-vpce-sg01" }
}

# Allow EC2 -> endpoints on 443
resource "aws_security_group_rule" "vpce_https_from_ec2" {
  type              = "ingress"
  security_group_id = aws_security_group.vpce_sg.id

  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  source_security_group_id = var.ec2_security_group_id
}

resource "aws_security_group_rule" "vpce_all_out" {
  type              = "egress"
  security_group_id = aws_security_group.vpce_sg.id
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

############################################
# VPC Endpoint - S3 (Gateway)
############################################
resource "aws_vpc_endpoint" "s3_gw" {
  vpc_id            = var.vpc_id
  service_name      = "com.amazonaws.${data.aws_region.current.region}.s3"
  vpc_endpoint_type = "Gateway"

  route_table_ids = [var.private_route_table_id]

  tags = { Name = "${local.prefix}-vpce-s3-gw01" }
}

############################################
# VPC Endpoints - Interface (SSM, Logs, Secrets, KMS)
############################################
resource "aws_vpc_endpoint" "ssm" {
  vpc_id              = var.vpc_id
  service_name        = "com.amazonaws.${data.aws_region.current.region}.ssm"
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true

  subnet_ids         = var.private_subnet_ids
  security_group_ids = [aws_security_group.vpce_sg.id]

  tags = { Name = "${local.prefix}-vpce-ssm01" }
}

resource "aws_vpc_endpoint" "ec2messages" {
  vpc_id              = var.vpc_id
  service_name        = "com.amazonaws.${data.aws_region.current.region}.ec2messages"
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true

  subnet_ids         = var.private_subnet_ids
  security_group_ids = [aws_security_group.vpce_sg.id]

  tags = { Name = "${local.prefix}-vpce-ec2messages01" }
}

resource "aws_vpc_endpoint" "ssmmessages" {
  vpc_id              = var.vpc_id
  service_name        = "com.amazonaws.${data.aws_region.current.region}.ssmmessages"
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true

  subnet_ids         = var.private_subnet_ids
  security_group_ids = [aws_security_group.vpce_sg.id]

  tags = { Name = "${local.prefix}-vpce-ssmmessages01" }
}

resource "aws_vpc_endpoint" "logs" {
  vpc_id              = var.vpc_id
  service_name        = "com.amazonaws.${data.aws_region.current.region}.logs"
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true

  subnet_ids         = var.private_subnet_ids
  security_group_ids = [aws_security_group.vpce_sg.id]

  tags = { Name = "${local.prefix}-vpce-logs01" }
}

resource "aws_vpc_endpoint" "secrets" {
  vpc_id              = var.vpc_id
  service_name        = "com.amazonaws.${data.aws_region.current.region}.secretsmanager"
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true

  subnet_ids         = var.private_subnet_ids
  security_group_ids = [aws_security_group.vpce_sg.id]

  tags = { Name = "${local.prefix}-vpce-secrets01" }
}

resource "aws_vpc_endpoint" "kms" {
  vpc_id              = var.vpc_id
  service_name        = "com.amazonaws.${data.aws_region.current.region}.kms"
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true

  subnet_ids         = var.private_subnet_ids
  security_group_ids = [aws_security_group.vpce_sg.id]

  tags = { Name = "${local.prefix}-vpce-kms01" }
}

############################################
# Private EC2 (no public IP)
############################################
resource "aws_instance" "private_ec2" {
  ami                   = var.ec2_ami_id
  instance_type          = var.ec2_instance_type
  subnet_id              = var.private_subnet_ids[0]
  vpc_security_group_ids = [var.ec2_security_group_id]
  iam_instance_profile   = var.ec2_instance_profile_name

  tags = { Name = "${local.prefix}-ec201-private" }
}

############################################
# Least-Privilege IAM policies
############################################
resource "aws_iam_policy" "lp_ssm_read" {
  name        = "${local.prefix}-lp-ssm-read01"
  description = "LP read for SSM parameters under path"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Sid    = "ReadParamsByPath"
      Effect = "Allow"
      Action = ["ssm:GetParameter","ssm:GetParameters","ssm:GetParametersByPath"]
      Resource = [
        "arn:aws:ssm:${data.aws_region.current.region}:${data.aws_caller_identity.self.account_id}:parameter${trim(var.ssm_param_path_prefix, "/")}*"
      ]
    }]
  })
}

resource "aws_iam_policy" "lp_secrets_read" {
  name        = "${local.prefix}-lp-secrets-read01"
  description = "LP read for the DB secret only"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Sid      = "ReadOnlySecret"
      Effect   = "Allow"
      Action   = ["secretsmanager:GetSecretValue","secretsmanager:DescribeSecret"]
      Resource = local.secret_arn
    }]
  })
}

resource "aws_iam_policy" "lp_cwlogs_write" {
  name        = "${local.prefix}-lp-cwlogs01"
  description = "LP write to the app log group only"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Sid    = "WriteLogs"
      Effect = "Allow"
      Action = ["logs:CreateLogStream","logs:PutLogEvents","logs:DescribeLogStreams"]
      Resource = ["${var.cloudwatch_log_group_arn}:*"]
    }]
  })
}

resource "aws_iam_role_policy_attachment" "attach_lp_ssm" {
  role       = var.ec2_role_name
  policy_arn = aws_iam_policy.lp_ssm_read.arn
}

resource "aws_iam_role_policy_attachment" "attach_lp_secrets" {
  role       = var.ec2_role_name
  policy_arn = aws_iam_policy.lp_secrets_read.arn
}

resource "aws_iam_role_policy_attachment" "attach_lp_cwlogs" {
  role       = var.ec2_role_name
  policy_arn = aws_iam_policy.lp_cwlogs_write.arn
}
