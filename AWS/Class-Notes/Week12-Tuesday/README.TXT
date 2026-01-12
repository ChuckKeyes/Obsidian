class 7 (11/25/25) - Tuesday

week 12 (Terraform pt 7): S3, remote state, and SNS

 

goal = host the state file within an S3 bucket, and receive SNS notifications for scaling events

 

Deliverables = screenshots of remote state and SNS email notification

Make a S3 bucket

state file  https://developer.hashicorp.com/terraform/language/state

How to store state remotely  https://developer.hashicorp.com/terraform/language/backend/s3

terraform {
  backend "s3" {
    bucket = "mybucket"
    key    = "path/to/my/key"
    region = "us-east-1"
  }
}

##############################################################################

Go to your repo in a browser:
https://github.com/ChuckKeyes/Obsidian

Click Settings (top bar).

In the left sidebar, under General, scroll all the way down to “Danger Zone”.

Find “Change repository visibility”.

Click “Change visibility” → “Make public”.

GitHub will ask you to:

Confirm by typing the repo name

Click the confirmation button.

After that:

Your existing user_data:

git clone https://github.com/ChuckKeyes/Obsidian.git /opt/obsidian || true
cp /opt/obsidian/Photos/*.jpg $${WEBROOT}/images/ || true


will start working with no auth needed.

│ Error: ELBv2 Target Group (ck-web-tg) already exists
│
│   with aws_lb_target_group.web,
│   on 13. Target Group.tf line 3, in resource "aws_lb_target_group" "web":
│    3: resource "aws_lb_target_group" "web" {
│
╵
╷
│ Error: ELBv2 Load Balancer (ck-web-alb) already exists
│
│   with aws_lb.web,
│   on 14. Load Balancer.tf line 4, in resource "aws_lb" "web":
│    4: resource "aws_lb" "web" {