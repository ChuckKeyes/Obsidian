# Module: prometheus_vm (aws)

## Purpose

Short description of what this module does and when to use it.
Example: "Deploys a Prometheus VM for monitoring ASG instances in the ck-lab."

## Inputs

See `variables.tf`.

## Outputs

See `outputs.tf`.

## Usage (from root module)

```hcl
module "prometheus_vm" {
  source = "Templates/AWS-Templates/Modules/prometheus_vm"

  # Example arguments (update for real use)
  name              = "example-prometheus_vm"
  vpc_id            = aws_vpc.main.id
  subnet_id         = aws_subnet.public_a.id
  security_group_ids = [aws_security_group.example.id]

  # Plus any other variables from variables.tf...
}
```
