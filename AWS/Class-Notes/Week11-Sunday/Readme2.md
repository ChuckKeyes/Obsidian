use modules for the code, and separate workloads for the runtime. In practice:

Terraform modules = how you organize and reuse code (network, SGs, EC2 templates, IAM, ALB, etc.).

Separate VMs / managed services / containers = how you run each thing (Prometheus, Grafana, Windows jump host, DB).

#### What I recommend for your lab templates
#### 1) Prefer managed services when possible

Database: use RDS (PostgreSQL/MySQL) instead of a DIY DB VM.

Monitoring: use Amazon Managed Prometheus (AMP) + Amazon Managed Grafana (AMG) if you want zero-maintenance.
If you want to learn the stack, run Prometheus+Grafana on EC2.

#### 2) If running on EC2, keep roles separated

Prometheus: its own small Linux VM (e.g., t3.small), SSD gp3, security group only from exporters.

Grafana: separate small Linux VM (t3.small), inbound 3000 from your admin IP / VPC.

Windows: separate Windows Server VM for RDP/jump-box and Windows-specific tools.

App/ASG: your web nodes stay in their own ASG; they should not host monitoring or DB.

#### 3) Networking & security

One VPC, three tiers:

Public subnets: ALB, NAT, (optional) bastion/jump-box.

Private app subnets: ASG instances, Prometheus, Grafana.

Private DB subnets: RDS only (no route to IGW).

Security Groups (examples):

sg_alb: 80/443 from world → ALB.

sg_web: 80 from sg_alb; 9100 (node_exporter) from sg_prometheus.

sg_prometheus: 9090 from your admin CIDR; egress to targets (web, Windows exporter).

sg_grafana: 3000 from your admin CIDR; 9090 to Prometheus if needed for data source.

sg_rds: 5432/3306 from only sg_web (and maybe from a bastion).

### 4) Repo structure (modules + thin envs)
aws-templates/
├─ modules/
│  ├─ vpc/
│  ├─ security/
│  ├─ ec2-linux/          # param: name, AMI, user_data, sg_ids, subnet_ids
│  ├─ ec2-windows/
│  ├─ asg-web/
│  ├─ alb/
│  ├─ rds/                # if you go managed DB
│  ├─ prometheus/         # EC2 + user_data + SG + EBS + SSM
│  └─ grafana/            # EC2 + user_data + SG + EBS + SSM
└─ envs/
   ├─ dev/
   │  ├─ main.tf          # calls modules
   │  └─ terraform.tfvars
   └─ prod/
      ├─ main.tf
      └─ terraform.tfvars

### 5) Example: call modules in envs/dev/main.tf
module "vpc" {
  source      = "../../modules/vpc"
  project_name = var.project_name
  vpc_cidr     = var.vpc_cidr
  azs          = var.azs
}

module "alb" {
  source        = "../../modules/alb"
  alb_enable    = var.alb_enable
  public_subnet_ids = module.vpc.public_subnet_ids
  sg_id         = module.security.sg_alb_id
}

module "asg_web" {
  source              = "../../modules/asg-web"
  asg_enable          = var.asg_enable
  azs                 = var.azs
  subnet_ids          = module.vpc.public_subnet_ids
  target_group_arn    = module.alb.tg_arn
  web_sg_id           = module.security.sg_web_id
  user_data_path      = var.user_data_path
}

module "rds" {
  source              = "../../modules/rds"
  create              = var.db_enable
  engine              = "postgres"
  subnets             = module.vpc.private_db_subnet_ids
  sg_ids              = [module.security.sg_rds_id]
}

module "prometheus" {
  source        = "../../modules/prometheus"
  create        = var.prometheus_enable
  subnet_id     = module.vpc.private_app_subnet_ids[0]
  sg_ids        = [module.security.sg_prometheus_id]
}

module "grafana" {
  source        = "../../modules/grafana"
  create        = var.grafana_enable
  subnet_id     = module.vpc.private_app_subnet_ids[0]
  sg_ids        = [module.security.sg_grafana_id]
}

### 6) Minimal user_data starters

#### Prometheus (Amazon Linux 2023):

#!/bin/bash
set -e
dnf install -y wget tar
useradd --no-create-home --shell /sbin/nologin prometheus || true
cd /opt
VER="2.55.0"
wget -q https://github.com/prometheus/prometheus/releases/download/v${VER}/prometheus-${VER}.linux-amd64.tar.gz
tar xzf prometheus-${VER}.linux-amd64.tar.gz
ln -sfn prometheus-${VER}.linux-amd64 prometheus
mkdir -p /etc/prometheus /var/lib/prometheus
cp prometheus/prometheus.yml /etc/prometheus/
cat >/etc/systemd/system/prometheus.service <<'EOF'
[Unit]
Description=Prometheus
After=network-online.target
[Service]
User=prometheus
ExecStart=/opt/prometheus/prometheus --config.file=/etc/prometheus/prometheus.yml --storage.tsdb.path=/var/lib/prometheus
Restart=always
[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload && systemctl enable --now prometheus


#### Grafana (Amazon Linux 2023):

#!/bin/bash
set -e
cat >/etc/yum.repos.d/grafana.repo <<'EOF'
[grafana]
name=Grafana
baseurl=https://packages.grafana.com/oss/rpm
repo_gpgcheck=1
enabled=1
gpgcheck=1
gpgkey=https://packages.grafana.com/gpg.key
EOF
dnf install -y grafana
systemctl enable --now grafana-server


Windows jump host: enable SSM Agent (use AWS-provided AMIs), put it in a public subnet or keep private + SSM Session Manager (no public IP).

### 7) When to combine things on one VM

Only for small lab demos or to cut cost.

Still keep DB separate (or managed RDS).

Keep Windows separate (patching, RDP, and Windows exporter).

#### TL;DR

Use modules to structure your Terraform and make each component pluggable.

Run services separately (Prometheus, Grafana, Windows, DB), or use managed (RDS, AMP, AMG) to skip maintenance.

Keep clean SG boundaries and subnet tiers.

Start with one VM each for Prometheus & Grafana; move to managed later if you want “no servers”.

promo code AWSRetake2025-2026


https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-quotas.html

https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group

https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_policy

https://github.com/DMayrant

https://www.udemy.com/course/mastering-terraform-beginner-to-expert/?couponCode=MT251110G2

terraform plan -out=plan && terraform show -json plan > plan.tfgraph

http://webgraphviz.com/