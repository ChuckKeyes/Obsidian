#!/bin/bash
set -e

REGION="us-east-1"
MASTER_IP="52.45.220.77"
KEY_PATH="$HOME/.ssh/id_rsa"

echo "Getting laptop public IP..."
MY_IP="$(curl -s https://checkip.amazonaws.com)/32"
echo "MY_IP = $MY_IP"

echo "Setting AWS region..."
export AWS_DEFAULT_REGION="$REGION"

echo "Finding security group for k8s-master..."
SG_ID=$(aws ec2 describe-instances \
  --filters "Name=ip-address,Values=$MASTER_IP" \
  --query "Reservations[0].Instances[0].SecurityGroups[0].GroupId" \
  --output text)

echo "SG_ID = $SG_ID"

echo "Adding SSH port 22..."
aws ec2 authorize-security-group-ingress \
  --group-id "$SG_ID" \
  --protocol tcp \
  --port 22 \
  --cidr "$MY_IP" || true

echo "Adding ICMP ping..."
aws ec2 authorize-security-group-ingress \
  --group-id "$SG_ID" \
  --ip-permissions IpProtocol=icmp,FromPort=-1,ToPort=-1,IpRanges="[{CidrIp=$MY_IP,Description='ICMP from current laptop'}]" || true

echo "Testing ping..."
ping -n 4 "$MASTER_IP"

echo "Testing SSH..."
ssh -i "$KEY_PATH" ubuntu@"$MASTER_IP"