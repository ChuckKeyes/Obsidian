
terraform {
  required_version = ">= 1.6.0"
  required_providers {
    aws = { source = "hashicorp/aws", version = "~> 5.0" }
  }
}

provider "aws" {
  region = "us-east-1" # <— change me
  access_key = "AKIAYDWHS6GX3LDLE6BV"
  secret_key = "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"

default_tags {
  tags = {
        ManagedBy = "Terraform"
        }
  }
}
