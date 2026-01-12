
## 1. VPC — Main network boundary for all AWS resources
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "ck-lab-vpc"
  }
}

