
# ✅ **MANUAL TERMINATION ORDER (SAFE ORDER FOR AWS)**

This destroys **everything** Terraform created for the Week12-Tuesday lab:

---

## 1️⃣ **Auto Scaling Group**

AWS Console → EC2 → Auto Scaling Groups

- Select **your ASG** (probably named like `ck-web-asg` or similar)
    
- Actions → **Delete**
    
- When asked → **Delete all instances**
    

Wait until **all EC2 instances are terminated** (0 running).

---

## 2️⃣ **Launch Template (optional)**

AWS Console → EC2 → Launch Templates

- Select your template (`ck-web-lt-*`)
    
- Actions → **Delete**
    

(_You can leave it, but cleaning is better._)

---

## 3️⃣ **Load Balancer**

AWS Console → EC2 → Load Balancers

- Select the ALB (Application Load Balancer)
    
- Actions → **Delete**
    

---

## 4️⃣ **Target Group**

AWS Console → EC2 → Target Groups

- Select target group (`ck-web-tg`)
    
- Actions → **Delete**
    

---

## 5️⃣ **Security Groups**

AWS Console → EC2 → Security Groups  
Delete the following (in this order):

1. **Web ASG Security Group** (targets SG)
    
2. **ALB Security Group**
    
3. **Prometheus SG** (if created)
    
4. Any other SGs created by the lab
    

> If AWS says “in use”, wait for instances/LB to disappear and retry.

---

## 6️⃣ **EC2 Instances (if any left)**

AWS Console → EC2 → Instances  
Terminate any leftover:

- Web instances
    
- Prometheus VM
    
- Jenkins / Docker / whatever else was running
    

---

## 7️⃣ **Networking Cleanup**

### 7a. Subnets

AWS Console → VPC → Subnets  
Delete:

- public_a
    
- public_b
    
- public_c
    
- private_a
    
- private_b
    
- private_c
    

(_Delete public first usually works fine._)

### 7b. Route Tables

AWS Console → VPC → Route tables  
Delete route tables created by Terraform  
(look for tags or names you recognize)

### 7c. Internet Gateway

AWS Console → VPC → Internet Gateways

- Detach from VPC
    
- Delete
    

### 7d. NAT Gateway (if used)

AWS Console → VPC → NAT Gateways

- Delete
    

(_Not needed if lab didn’t create one_)

### 7e. VPC

AWS Console → VPC → Your VPC  
Delete VPC  
(only works after all subnets/RT/IGW/Security Groups are gone)

---

## 8️⃣ **IAM Resources**

AWS Console → IAM

- **Roles**
    
    - Delete: `ck-web-asg-role`
        
- **Policies**
    
    - Delete: `ck-web-s3-read-images`
        
    - Delete inline policies you created
        
- **Instance Profiles**
    
    - Delete: `ck-web-asg-instance-profile`
        

---

## 9️⃣ **S3 State File (optional)**

AWS Console → S3 → `keyescloudsolutions` → `templates/` folder

- Delete `terraform.tfstate`
    
- Delete `terraform.tfstate.backup`
    
- Delete entire `templates/` folder if you want
    

_(Only do this if you’re abandoning this state file permanently.)_

---

## 🔟 **Fix IAM User for future Terraform use**

You should:

1. Remove _any_ Deny rules attached to `ChuckSr`
    
2. Give `ChuckSr` at least:
    
    - `AmazonS3FullAccess`  
        or
        
    - a custom inline policy for your Terraform state bucket
        

---

# 🚀 After everything is manually deleted

Clean your local folder:

`rm -rf .terraform`

Comment out or delete the backend block **in backend.tf**:

`# backend "s3" { #   bucket = "keyescloudsolutions" #   key    = "templates/terraform.tfstate" #   region = "us-east-1" # }`

Reinitialize Terraform:

`terraform init`

Now you’re ready to start _fresh_ with a clean environment and no broken S3 backend.

---

If you want, I can also:

- Generate a **clean backend.tf** that works with your new IAM permissions
    
- Help reorganize your S3 bucket for multiple labs
    
- Replace S3 backend with a **local backend** (zero problems) for class demos.