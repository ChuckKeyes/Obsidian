
## 4. Elastic IP — Static public IP for NAT Gateway
resource "aws_eip" "nat" {
  domain = "vpc"
  tags   = { Name = "ck-nat-eip" }
}
