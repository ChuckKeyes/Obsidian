
This **will NOT work**:

```
my_ip = "curl ifconfig.me/32"
```

because `terraform.tfvars` is just a data file. It doesn't execute commands.

---

## Option 1 (Recommended) — Set the variable before running Terraform

In Bash:

```
export TF_VAR_my_ip="$(curl -s ifconfig.me)/32"terraform apply
```

Then in `variables.tf`:

```
variable "my_ip" {  description = "My public IP"  type        = string}
```

And use it:

```
resource "aws_security_group_rule" "ssh" {  type              = "ingress"  from_port         = 22  to_port           = 22  protocol          = "tcp"  cidr_blocks = [var.my_ip]}
```

---

## Option 2 — Use a Terraform data source

Terraform can run a program and capture its output.

Create `getip.sh`:

```
#!/bin/bashecho "{\"ip\":\"$(curl -s ifconfig.me)/32\"}"
```

Make it executable:

```
chmod +x getip.sh
```

Then:

```
data "external" "myip" {  program = ["bash", "${path.module}/getip.sh"]}locals {  my_ip = data.external.myip.result.ip}
```

Use:

```
cidr_blocks = [local.my_ip]
```

---

## Option 3 — Hard-code it in `terraform.tfvars`

```
my_ip = "185.216.73.141/32"
```

This is simple, but if your ISP changes your IP address, you have to update the file manually.

---

### For your AWS + Kubernetes labs

Since you often rebuild EC2 instances and security groups, I would use:

```
export TF_VAR_my_ip="$(curl -s ifconfig.me)/32"terraform apply
```

That way your SSH security group rule is always:

```
cidr_blocks = [var.my_ip]
```

and you never have to edit `terraform.tfvars` again.