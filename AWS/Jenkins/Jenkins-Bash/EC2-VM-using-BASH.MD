1. Set variables

REGION="us-west-2"
AMI_ID="ami-03caad32a158f72db"   # Amazon Linux (verify this if needed)
INSTANCE_TYPE="t3.micro"
KEY_NAME="jenkins-key"
SECURITY_GROUP="jenkins-sg"

2. Create key pair

aws ec2 create-key-pair \
  --key-name $KEY_NAME \
  --query 'KeyMaterial' \
  --output text > $KEY_NAME.pem

chmod 400 $KEY_NAME.pem

3. Create security group

SG_ID=$(aws ec2 create-security-group \
  --group-name $SECURITY_GROUP \
  --description "Jenkins SG" \
  --region $REGION \
  --query 'GroupId' \
  --output text)

  4. Open ports (VERY IMPORTANT)

aws ec2 authorize-security-group-ingress \
  --group-id $SG_ID \
  --protocol tcp \
  --port 22 \
  --cidr 0.0.0.0/0

aws ec2 authorize-security-group-ingress \
  --group-id $SG_ID \
  --protocol tcp \
  --port 8080 \
  --cidr 0.0.0.0/0

  5. Launch instance

INSTANCE_ID=$(aws ec2 run-instances \
  --image-id "$AMI_ID" \
  --count 1 \
  --instance-type "$INSTANCE_TYPE" \
  --key-name "$KEY_NAME" \
  --security-group-ids "$SG_ID" \
  --associate-public-ip-address \
  --region "$REGION" \
  --block-device-mappings '[
    {
      "DeviceName": "/dev/xvda",
      "Ebs": {
        "VolumeSize": 20,
        "VolumeType": "gp3",
        "DeleteOnTermination": true
      }
    }
  ]' \
  --query 'Instances[0].InstanceId' \
  --output text)

echo "Instance ID: $INSTANCE_ID"

6. Get public IP

aws ec2 wait instance-running --instance-ids $INSTANCE_ID --region $REGION

PUBLIC_IP=$(aws ec2 describe-instances \
  --instance-ids $INSTANCE_ID \
  --region $REGION \
  --query "Reservations[0].Instances[0].PublicIpAddress" \
  --output text)

echo "Public IP: $PUBLIC_IP"

#############################################################################

✅ STEP 2 — SSH into VM

ssh -i jenkins-key.pem ec2-user@$PUBLIC_IP

sudo mount -t tmpfs -o size=2G tmpfs /tmp
df -h /tmp
echo 'tmpfs /tmp tmpfs defaults,size=2G 0 0' | sudo tee -a /etc/fstab

###################################################################################

✅ STEP 3 — Install Jenkins (Bash inside VM)

sudo dnf update -y

sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/rpm-stable/jenkins.repo

sudo rpm --import https://pkg.jenkins.io/rpm-stable/jenkins.io-2026.key

sudo dnf install -y java-21-amazon-corretto fontconfig jenkins git wget unzip python3 awscli

sudo systemctl daemon-reload
sudo systemctl enable jenkins
sudo systemctl start jenkins

###############################################################################

Verify Jenkins

sudo systemctl status jenkins --no-pager -l
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

##########################################################################

✅ STEP 4 — Open Jenkins in browser

http://<PUBLIC-IP>:8080

###########################################################################

✅ STEP 5 — Install plugins using Bash (ADVANCED 🔥)

After Jenkins is up, you can install plugins via CLI:

cd /tmp

wget http://localhost:8080/jnlpJars/jenkins-cli.jar

java -jar jenkins-cli.jar -s http://localhost:8080 \
  -auth admin:YOUR_PASSWORD \
  install-plugin \
  aws-credentials \
  workflow-aggregator \
  terraform \
  github \
  configuration-as-code \
  google-oauth-plugin

java -jar jenkins-cli.jar -s http://localhost:8080 \
  -auth admin:YOUR_PASSWORD \
  safe-restart

