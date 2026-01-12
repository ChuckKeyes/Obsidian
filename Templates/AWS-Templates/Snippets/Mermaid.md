
flowchart TB
  %% High-level AWS ALB + ASG architecture

  subgraph VPC["VPC: ck-lab-vpc (10.0.0.0/16)"]
    direction TB

    subgraph PublicSubnets["Public Subnets (3 AZs)"]
      direction LR
      pubA["Public Subnet A<br/>10.0.1.0/24<br/>us-east-1a"]
      pubB["Public Subnet B<br/>10.0.2.0/24<br/>us-east-1b"]
      pubC["Public Subnet C<br/>10.0.3.0/24<br/>us-east-1c"]
    end

    subgraph PrivateSubnets["Private Subnets (3 AZs)"]
      direction LR
      privA["Private Subnet A<br/>10.0.11.0/24"]
      privB["Private Subnet B<br/>10.0.12.0/24"]
      privC["Private Subnet C<br/>10.0.13.0/24"]
    end

    subgraph RTs["Route Tables"]
      direction LR
      RTpub["Public Route Table<br/>0.0.0.0/0 → IGW"]
      RTpriv["Private Route Table<br/>0.0.0.0/0 → NAT GW"]
    end

    subgraph ALBLayer["Load Balancer Layer"]
      ALB["Application Load Balancer<br/>ALB SG<br/>HTTP :80"]
    end

    subgraph ASGLayer["Auto Scaling Group (Web Tier)"]
      direction LR
      ASG["Auto Scaling Group<br/>+ Launch Template<br/>Targets SG"]
      EC2A["EC2 Instance<br/>AZ A"]
      EC2B["EC2 Instance<br/>AZ B"]
      EC2C["EC2 Instance<br/>AZ C"]
    end

    subgraph NATBlock["NAT / IGW"]
      IGW["Internet Gateway"]
      NAT["NAT Gateway<br/>Elastic IP"]
    end
  end

  %% External client
  User["Internet Clients"] -->|"HTTP 80"| ALB

  %% ALB to ASG instances
  ALB -->|"Forward to Target Group"| EC2A
  ALB --> EC2B
  ALB --> EC2C

  %% Placement
  pubA --- ALB
  pubB --- ALB
  pubC --- ALB

  ASG --- EC2A
  ASG --- EC2B
  ASG --- EC2C

  pubA --- IGW
  pubA --- NAT

  privA --- RTpriv
  privB --- RTpriv
  privC --- RTpriv

  RTpriv --> NAT
  RTpub  --> IGW

  %% Notes
  classDef infra fill:#eef,stroke:#555,stroke-width:1px;
  class VPC,PublicSubnets,PrivateSubnets,RTs,ALBLayer,ASGLayer,NATBlock infra;
