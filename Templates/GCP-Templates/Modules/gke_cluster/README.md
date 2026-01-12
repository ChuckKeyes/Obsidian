# Module: gke_cluster (gcp)

## Purpose

Short description of what this module does and when to use it.
Example: "Deploys a Prometheus VM for monitoring ASG instances in the ck-lab."

## Inputs

See `variables.tf`.

## Outputs

See `outputs.tf`.

## Usage (from root module)

```hcl
module "gke_cluster" {
  source = "Templates/GCP-Templates/Modules/gke_cluster"

  # Example arguments (update for real use)
  name              = "example-gke_cluster"
  vpc_id            = aws_vpc.main.id
  subnet_id         = aws_subnet.public_a.id
  security_group_ids = [aws_security_group.example.id]

  # Plus any other variables from variables.tf...
}
```
