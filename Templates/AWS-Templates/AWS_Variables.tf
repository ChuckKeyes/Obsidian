
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
                                default = 4 
                                } # /16 -> /20

# NAT/IGW strategy
variable "nat_mode" {
                    # "single" or "per_az"
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


# ALB
variable "alb_enable" { 

                      type = bool 
                      default = true 
                      }


# ---------- Auto Scaling Toggle ----------
variable "asg_enable" {
  description = "Enable Auto Scaling Group + Launch Template"
  type        = bool
  default     = true
}



# ---------- ASG Capacity ----------
variable "asg_min_size" {
  description = "Minimum number of instances in ASG"
  type        = number
  default     = 3
}

variable "asg_max_size" {
  description = "Maximum number of instances in ASG"
  type        = number
  default     = 10
}

variable "asg_desired" {
  description = "Desired number of instances in ASG"
  type        = number
  default     = 3
}

# ---------- ASG CPU Target / Scaling ----------
variable "asg_cpu_target" {
  description = "Target average CPU utilization (%) for ASG target tracking"
  type        = number
  default     = 50  # change this to 60, 70, etc.
}






# Tags
variable "tags" {
                type = map(string)
      default = {
                Owner     = "Chuck Keyes"
                ManagedBy = "terraform"
                Service   = "application1"
                }
}

variable "vpc_name" {
  description = "Name for the VPC"
  type        = string
  default     = "Templates-VPC"
}

# variable "app1_ami_id" {
#  description = "AMI ID for app1 launch template"
#  type        = string
#  default     = "ami-06ed60ed1369448bd"
# }

variable "app1_ami_id" {
  description = "AMI ID for app1 launch template. Leave empty to use Debian 12 from data.aws_ami.debian."
  type        = string
  default     = ""
}


variable "app1_instance_type" {
  description = "Instance type for app1 launch template"
  type        = string
  default     = "t2.micro"
}

variable "app1_key_name" {
  description = "EC2 key pair name for app1 instances"
  type        = string
  default     = "MyLinuxBox"
}

variable "alb_target_port" {
  description = "Port for ALB target group"
  type        = number
  default     = 80
}

variable "alb_health_path" {
  description = "Health check path for ALB target group"
  type        = string
  default     = "/"
}

variable "alb_health_interval" {
  description = "Health check interval (seconds)"
  type        = number
  default     = 30
}

variable "alb_health_timeout" {
  description = "Health check timeout (seconds)"
  type        = number
  default     = 5
}

variable "alb_healthy_threshold" {
  description = "Number of consecutive successes before considering target healthy"
  type        = number
  default     = 5
}

variable "alb_unhealthy_threshold" {
  description = "Number of consecutive failures before considering target unhealthy"
  type        = number
  default     = 2
}

variable "user_data_path" {
  description = "Path to user data script for ASG instances"
  type        = string
  default     = "user_data3.sh"  # or scripts/user_data.sh, etc.
}

variable "prometheus_user_data_path" {
  description = "Path to user data script for the standalone Prometheus EC2 instance"
  type        = string
  default     = "user_data_prometheus.sh"
}
