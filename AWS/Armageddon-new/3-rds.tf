############################################
# RDS (SG + Subnet Group + Instance)
############################################

# Explanation: RDS SG is the Rebel vault—only the app server gets a keycard.
resource "aws_security_group" "kcs_rds_sg01" {
  name        = "${local.name_prefix}-rds-sg01"
  description = "RDS security group"
  vpc_id      = aws_vpc.kcs_vpc01.id

  tags = {
    Name = "${local.name_prefix}-rds-sg01"
  }
}

# Allow MySQL from EC2 SG only
resource "aws_security_group_rule" "rds_mysql_from_ec2" {
  type              = "ingress"
  security_group_id = aws_security_group.kcs_rds_sg01.id

  from_port                = var.db_port
  to_port                  = var.db_port
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.kcs_ec2_sg01.id
}

# (Optional but common) allow RDS egress
resource "aws_security_group_rule" "rds_all_out" {
  type              = "egress"
  security_group_id = aws_security_group.kcs_rds_sg01.id

  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}

# Explanation: RDS hides in private subnets like the Rebel base on Hoth—cold, quiet, and not public.
resource "aws_db_subnet_group" "kcs_rds_subnet_group01" {
  name       = "${local.name_prefix}-rds-subnet-group01"
  subnet_ids = aws_subnet.kcs_private_subnets[*].id

  tags = {
    Name = "${local.name_prefix}-rds-subnet-group01"
  }
}

# Explanation: This is the holocron of state—your relational data lives here, not on the EC2.
resource "aws_db_instance" "kcs_rds01" {
  identifier        = "${local.name_prefix}-rds01"
  engine            = var.db_engine
  instance_class    = var.db_instance_class
  allocated_storage = 20

  db_name   = var.db_name
  username  = var.db_username
  password  = var.db_password

  db_subnet_group_name   = aws_db_subnet_group.kcs_rds_subnet_group01.name
  vpc_security_group_ids = [aws_security_group.kcs_rds_sg01.id]

  publicly_accessible = false
  skip_final_snapshot = true

  tags = {
    Name = "${local.name_prefix}-rds01"
  }
}
