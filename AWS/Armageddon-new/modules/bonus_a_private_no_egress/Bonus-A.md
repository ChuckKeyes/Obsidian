1) Looks up account + region at runtime

data.aws_caller_identity gets your AWS account ID.

data.aws_region gets the current region name.

These are used to build ARNs that work in any account/region without hardcoding.

2) Sets naming + guesses the Secrets Manager ARN

local.chewbacca_prefix = var.project_name is the tag/name prefix used everywhere.

local.chewbacca_secret_arn_guess = ...mysql* builds an ARN pattern for the DB secret so IAM can be scoped (but it’s a “guess” using * until you lock it to the real ARN).

3) Launches a NEW EC2 instance in a private subnet (no public IP)

aws_instance ..._private_bonus places EC2 in chewbacca_private_subnets[0].

Because it’s private, it’s meant to be managed via SSM Session Manager (no SSH from the internet).

It attaches an instance profile so the instance can call AWS APIs (SSM, Secrets, Logs).

4) Creates a security group specifically for VPC Interface Endpoints

aws_security_group chewbacca_vpce_sg01 is the SG attached to the endpoint ENIs.

You’re expected to allow inbound 443 to these endpoints from your EC2 SG (or VPC CIDR), because interface endpoints accept HTTPS traffic on 443.

5) Adds VPC Endpoints so private EC2 can reach AWS services WITHOUT internet/NAT

This is the big point of the bonus: private, no-public-egress architecture.

Gateway endpoint

S3 Gateway Endpoint: adds routes in the private route table so instances can reach S3 privately.

Interface endpoints (ENIs in your subnets, private DNS enabled)

These put private IP endpoints inside your VPC for:

ssm (core SSM service)

ec2messages (required for SSM control channel)

ssmmessages (required for Session Manager interactive sessions)

logs (ship logs to CloudWatch Logs privately)

secretsmanager (retrieve secrets privately)

kms (optional: decrypt/encrypt via KMS privately)

With private_dns_enabled = true, your instance uses normal AWS service hostnames, but DNS resolves them to the VPC endpoint IPs.

6) Creates least-privilege IAM policies for the EC2 role

Instead of broad AWS-managed policies, it defines tight permissions:

SSM Parameter Store read (only /lab/db/*)

Allows GetParameter* actions only on:
parameter/lab/db/*

Secrets Manager read (only your DB secret)

Allows GetSecretValue + DescribeSecret

Scoped to the guessed secret ARN pattern (.../rds/mysql*)

CloudWatch Logs write (only your app log group)

Allows creating streams and putting log events

Scoped to your log group ARN

7) Attaches those scoped policies to the EC2 role

Three attachments add the policies to chewbacca_ec2_role01

Result: the private EC2 instance can:

read DB endpoint/port/name from SSM

read DB creds from Secrets Manager

write logs to the specific CloudWatch log group

and connect to those services via VPC endpoints (no internet required)

What this bonus accomplishes overall

It upgrades your lab from “works with public access + NAT” to a more secure enterprise pattern:

EC2 has no public IP

no inbound SSH needed (use SSM)

AWS service access stays inside the VPC via endpoints

IAM is least privilege rather than broad policies