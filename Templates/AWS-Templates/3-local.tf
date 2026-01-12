# locals.tf
#
# Central place for all naming/local conventions used by the Templates project.

locals {
  # Base name used as a prefix for most resources
  name = var.project_name

  # Core network component names
  vpc_name = "${local.name}-vpc"
  igw_name = "${local.name}-igw"

   # Application Load Balancer
  alb_name = "${local.name}-alb"
  # name = local.alb_name
  tags = merge(var.tags, { Name = local.alb_name })


  # 🔌 Add more locals here as you need them, for example:
  # nat_gw_name     = "${local.name}-nat-gw"
  # public_rt_name  = "${local.name}-public-rt"
  # private_rt_name = "${local.name}-private-rt"
  # web_sg_name     = "${local.name}-web-sg"
  # windows_sg_name = "${local.name}-windows-sg"
}
