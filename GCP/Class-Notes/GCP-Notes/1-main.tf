# VPC resource
# This creates the virtual private cloud
resource "aws_vpc" "main" {
  
  # region = ""
  
  cidr_block           = "10.10.0.0/16"
  
  tags = {
    Name = "demo-vpc"
  }

}

output "aws_vpc" {
    description = "ID of the VPC"
    value = "aws_vpc.cidr_block.id
}
