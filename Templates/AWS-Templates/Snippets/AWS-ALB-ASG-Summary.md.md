
# AWS ALB + Auto Scaling Group – Environment Summary

## 1. High-Level Overview

This environment models a highly available web application running on Amazon Web Services (AWS). It uses:

- A dedicated Virtual Private Cloud (VPC)
- Multiple public and private subnets across three Availability Zones
- An Internet Gateway (IGW) and NAT Gateway
- An Application Load Balancer (ALB)
- An Auto Scaling Group (ASG) of web servers
- Security groups for fine-grained network control
- Optional CPU-based auto scaling

The goal is to show a realistic, multi-AZ architecture that a recruiter or hiring manager can recognize as “production-style,” while still being simple enough to use as a lab or demo.

---

## 2. Network Layer

### Virtual Private Cloud (VPC)
All resources live inside a single VPC with a /16 CIDR block. The VPC acts as the network boundary and enables DNS resolution and hostnames for instances.

### Public Subnets (3)
Three public subnets are created, one in each Availability Zone (e.g., us-east-1a, 1b, 1c). These subnets:

- Are reachable from the internet through the Internet Gateway
- Host the Application Load Balancer
- Host the web instances for this lab (for simplicity)

### Private Subnets (3)
Three private subnets mirror the public subnets across the same Availability Zones. They are designed for:

- Back-end application tiers
- Databases or internal services
- Any resource that should not have a public IP

In this lab, they demonstrate proper private routing through a NAT Gateway, even if no back-end EC2s are deployed yet.

### Internet Gateway (IGW)
An Internet Gateway is attached to the VPC to allow:

- Inbound traffic to public-facing endpoints (the ALB)
- Outbound internet access from public subnets

### NAT Gateway + Elastic IP
A NAT Gateway with an associated Elastic IP address is deployed into a public subnet. Private subnet instances route outbound traffic through this NAT so they can access OS updates and external services without being directly exposed to the public internet.

---

## 3. Routing Layer

### Public Route Table
The public route table is associated with all public subnets. It contains a default route (0.0.0.0/0) pointing to the Internet Gateway. This allows:

- Public subnets to reach the internet
- External clients to reach resources that have public IPs or are fronted by the ALB

### Private Route Table
The private route table is associated with all private subnets. It contains a default route (0.0.0.0/0) pointing to the NAT Gateway. This allows:

- Private instances to reach the internet for updates and APIs
- No direct inbound connections from the public internet

Each subnet has exactly one route table association: public → public RT, private → private RT.

---

## 4. Security Layer

### Load Balancer Security Group
The ALB security group:

- Allows inbound HTTP (and optionally HTTPS) from the internet
- Allows all outbound traffic so the ALB can connect to its targets
- Acts as the “source” for web traffic to the instances

This isolates internet-facing traffic at the ALB layer.

### Target / Instance Security Group
The target security group is attached to the EC2 instances in the Auto Scaling Group. It:

- Accepts HTTP traffic only from the ALB security group
- Optionally allows SSH only from a specific admin CIDR (for troubleshooting)
- Allows outbound traffic to anywhere

This prevents direct internet access to the instances and enforces that all web traffic flows through the ALB.

---

## 5. Compute & Application Layer

### Launch Template
The launch template defines how EC2 instances in the Auto Scaling Group are created. It includes:

- AMI (operating system)
- Instance type (e.g., t3.micro for lab workloads)
- Attached security groups
- User data script to:
  - Install a web server (Apache)
  - Start the service
  - Write a simple HTML page that identifies the instance

This ensures that every instance is configured consistently and is “ready to serve” as soon as it boots.

### Application Load Balancer (ALB)
The ALB is deployed into all three public subnets for high availability. It:

- Listens on HTTP port 80
- Uses the ALB security group for public access
- Forwards traffic to a target group of EC2 instances
- Performs health checks to route traffic only to healthy instances

### Target Group
The target group represents the web server fleet. It:

- Listens on port 80 on each EC2 instance
- Uses HTTP health checks against the root path ("/")
- Integrates with the Auto Scaling Group so that instances are automatically registered and deregistered

### Auto Scaling Group (ASG)
The ASG maintains a fleet of identical EC2 instances across the three public subnets. It:

- Uses the launch template to create instances
- Spreads instances across Availability Zones
- Registers instances with the target group
- Automatically replaces failed instances

This provides both high availability and self-healing behavior.

---

## 6. Scaling & Resilience

### Auto Scaling Policy (CPU-based)
A CPU-based target tracking policy is attached to the ASG. It:

- Monitors average CPU utilization across all instances
- Scales out when CPU is consistently above the target (e.g., 50%)
- Scales in when CPU is consistently below the target

This keeps capacity aligned with demand and makes the environment closer to a production-like pattern.

---

## 7. Typical Traffic Flow

1. A client on the internet sends an HTTP request to the ALB’s DNS name.  
2. The ALB security group allows the request on port 80.  
3. The ALB listener forwards the request to the target group.  
4. The target group selects a healthy EC2 instance in the Auto Scaling Group.  
5. The instance’s security group allows HTTP from the ALB security group.  
6. The web server on the instance returns a response (HTML page) back through the ALB to the client.  
7. When load increases, the Auto Scaling policy creates more instances; when load drops, it terminates extra instances safely.

---

## 8. Use Cases and Extensions

This lab can be extended to demonstrate:

- Moving the ASG instances into private subnets (more realistic production design)
- Adding a database tier in private subnets
- Adding monitoring (Prometheus, Grafana) in the same VPC
- Using HTTPS on the ALB with ACM certificates
- Using multiple target groups and path-based routing

For now, it serves as a clear, recruiter-friendly example of an AWS ALB + ASG architecture implemented with Terraform.
