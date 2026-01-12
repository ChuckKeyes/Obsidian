
# Core
variable "project_name" { 
                      type = string  
                      default = "ck-lab" 
                      }
variable "region"       {
                      type = string  
                      default = "us-east-1" 
                      }
variable "aws_profile"  {
                     type = string  
                     default = "default" 
                     }

# VPC
variable "vpc_cidr"     {
                  type = string  
                  default = "10.10.0.0/16" 
                  }
variable "azs"          {
                  type = list(string) 
                  default = ["us-east-1a", "us-east-1b", "us-east-1c"] 
                  }

# Subnets (/20 by default; change newbits if you want /24)
variable "public_subnet_count"  {
                  type = number 
                  default = 3 
                  }
variable "private_subnet_count" {
                  type = number 
                  default = 3 
                  } # per AZ (so 3 AZs => 3 priv in this example)
variable "subnet_newbits"       {
                  type = number 
                  default = 8 
                  } # /16 -> /24

# NAT/IGW strategy
variable "nat_mode" { # "single" or "per_az"
  type    = string
  default = "single"
}

# Security
variable "admin_cidr" {
          type = string  
          default = "0.0.0.0/0" 
          } # tighten to your /32
variable "allow_http_world"  {
          type = bool 
          default = true 
          }
variable "allow_https_world" {
          type = bool 
          default = true 
          }

# EC2
variable "instance_type" {
          type = string 
          default = "t3.micro" 
          }
variable "key_name"      {
          type = string 
          default = "" 
          } # existing key pair name, optional
variable "user_data_path"{
          type = string 
          default = "user_data.sh" 
          }

 # ALB
#  variable "alb_enable" {
#            type = bool 
#            default = true 
#            }

# Tags
variable "tags" {
  type = map(string)
  default = {
    Owner     = "Chuck Keyes"
    ManagedBy = "terraform"
    Service   = "application1"
  }
}

locals {
  vpc_name = "main-vpc"
  igw_name = "main-igw"
}

###################################################################################
#    Security Group
variable "asg_enable"  {
          type = bool   
          default = false 
          }
variable "asg_min_size"{
          type = number 
          default = 3 
          }
variable "asg_max_size"{
          type = number 
          default = 10 
          }
variable "asg_desired" {
          type = number 
          default = 3 
          }
variable "alb_enable" {
  type    = bool
  default = false
}

variable "alb_target_group_arn" {
  description = "Existing ALB Target Group ARN (required when alb_enable=true)"
  type        = string
  default     = ""
}
