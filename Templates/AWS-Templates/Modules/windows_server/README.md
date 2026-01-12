# Module: windows_server (AWS)

## Purpose

TODO: Briefly describe what this module does.

Examples:
- grafana: Deploys a Grafana VM that visualizes Prometheus metrics.
- jenkins: CI/CD Jenkins server for building and deploying apps.
- docker: Single VM with Docker engine installed.
- kubernetes: Single-node K3s/Kubernetes cluster.
- fargate: ECS service running on AWS Fargate.
- windows_server: Windows Server VM with RDP.
- security_hardening: Hardened Linux VM with extra security config.
- sagemaker: SageMaker notebook instance.
- bedrock: Demo of Lambda / app calling Bedrock.
- gpu_ai_server: GPU-enabled VM for AI workloads.
- cloudwatch_alarms: Common CloudWatch alarms for EC2/ASG.

## Inputs

See `variables.tf`.

## Outputs

See `outputs.tf`.

## Usage (from root module)

```hcl
module "windows_server" {
  source = "./Templates/AWS-Templates/Modules/windows_server"

  name              = "ck-windows_server"
  vpc_id            = aws_vpc.main.id
  subnet_id         = aws_subnet.public_a.id
  security_group_ids = [aws_security_group.example.id]

  # Add or remove variables based on variables.tf
}
```
