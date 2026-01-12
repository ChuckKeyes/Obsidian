2) Quick RDS connectivity test from EC2 (MySQL 3306)

SSH only works if you enabled port 22 from your IP and you have a keypair on the instance.
If you do have SSH access, run this on the EC2 host:

Install mysql client (Amazon Linux 2 / AL2023)
sudo dnf -y install mariadb105 || sudo yum -y install mariadb

Test network path (no credentials needed)
nc -vz kcs-keyescloudsolutions-rds01.cs3cu6i6843p.us-east-1.rds.amazonaws.com 3306


You want: succeeded.

If you want to actually connect (needs username/password)
mysql -h kcs-keyescloudsolutions-rds01.cs3cu6i6843p.us-east-1.rds.amazonaws.com -P 3306 -u admin -p

3) Confirm Secrets + SSM are populated (your “recovery map”)
SSM parameters
aws ssm get-parameter --name /lab/db/endpoint --region us-east-1
aws ssm get-parameter --name /lab/db/port --region us-east-1
aws ssm get-parameter --name /lab/db/name --region us-east-1

Secret exists (you already proved it earlier)
aws secretsmanager describe-secret --secret-id "kcs-keyescloudsolutions/rds/mysql" --region us-east-1

4) SNS: don’t forget the email confirmation

Your topic exists:

arn:aws:sns:us-east-1:557690581423:kcs-keyescloudsolutions-db-incidents

If you haven’t already, go confirm the subscription email AWS sent to chuck37080@gmail.com.

To test SNS after confirming:

aws sns publish \
  --topic-arn "arn:aws:sns:us-east-1:557690581423:kcs-keyescloudsolutions-db-incidents" \
  --message "KCS test alert: SNS is working." \
  --region us-east-1

5) Quick “sanity dashboard” checklist (what to verify in AWS)

VPC: vpc-05ba5de2fc7b9c9a0

EC2 is in a public subnet and has a public IP: 34.207.74.170

RDS is in private subnets and publicly_accessible = false

RDS SG allows 3306 from the EC2 SG only

Log group exists: /aws/ec2/kcs-keyescloudsolutions-rds-app

SSH | TCP | 22 | 73.107.137.224/32
