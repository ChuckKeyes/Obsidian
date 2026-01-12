terraform {
  required_version = ">= 1.7.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.60"
    }
  }

  # backend "s3" {
  #   bucket = "keyescloudsolutions"          # S3 bucket must already exist
  #   key    = "templates/terraform.tfstate"  # any path you like
  #   region = "us-east-1"
  # }
}

provider "aws" {
  region  = "us-east-1"
  profile = "prod"
}

# https://developer.hashicorp.com/terraform/language/backend/s3

# provider "aws" {
#   alias  = "ohio"
#   region = "us-east-2"
# }
