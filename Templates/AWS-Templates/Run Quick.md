

# init
terraform init

# optional: create env file
cat > env.auto.tfvars <<EOF
project_name   = "ck-ob-template"
region         = "us-east-1"
admin_cidr     = "0.0.0.0/0" # set your /32 for SSH in real use
alb_enable     = true
nat_mode       = "single"
key_name       = ""          # or your existing keypair
EOF

# plan & apply
terraform plan
terraform apply -auto-approve
