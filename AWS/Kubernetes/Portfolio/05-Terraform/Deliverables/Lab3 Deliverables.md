1. What Lab3 is proving
Compliance truth

PHI storage stays in Tokyo

Compute can move to São Paulo

Global access can exist

The database does not move

Engineering truth

TGW creates the corridor between regions

CloudFront gives one public URL

São Paulo is stateless/app tier

Tokyo is authoritative/data tier

That is the story you want to tell when demoing.

2. Proof checklist

You want evidence for five layers:

A. Front door works

Prove CloudFront and the public site work.

curl -I https://do920hzo448ns.cloudfront.net
curl -I https://www.keyescloudsolutions.com
chuck@LAPTOP-1B94MM1R:/d/New Obsidian/Armageddon-Lab1-2-3-4/Lab3-Armageddon-new$ curl -I https://do920hzo448ns.cloudfront.net
HTTP/1.1 502 Bad Gateway
Content-Type: text/html
Content-Length: 937
Connection: keep-alive
date: Sun, 08 Mar 2026 01:42:39 GMT
X-Cache: Error from cloudfront
Via: 1.1 8014e01f72bc82652e0c2c05ce8e9698.cloudfront.net (CloudFront)
X-Amz-Cf-Pop: MIA50-P7
X-Amz-Cf-Id: If0iKFhdGY3J3SZ6ETAwxNcSKm3JAoauvnZOOnx_ApgQwYtjra6Y3Q==

chuck@LAPTOP-1B94MM1R:/d/New Obsidian/Armageddon-Lab1-2-3-4/Lab3-Armageddon-new$ curl -I https://www.keyescloudsolutions.com
HTTP/1.1 200 OK
Content-Type: text/html
Content-Length: 27531
Connection: keep-alive
Date: Sun, 08 Mar 2026 01:42:44 GMT
Accept-Ranges: bytes
Server: nginx/1.28.2
Last-Modified: Sun, 08 Mar 2026 01:22:52 GMT
ETag: "69accf6c-6b8b"
X-Cache: Miss from cloudfront
Via: 1.1 f75f68cffaecc760fd07dc38cff86aba.cloudfront.net (CloudFront)
X-Amz-Cf-Pop: MIA50-P7
X-Amz-Cf-Id: 8Toec5f98wqXLY2Hq5dVPjSss_VepVAUqBORQLY1r6M5rA7WtsZtqg==

#####################################################################

curl -I https://do920hzo448ns.cloudfront.net/images1.jpeg
chuck@LAPTOP-1B94MM1R:/d/New Obsidian/Armageddon-Lab1-2-3-4/Lab3-Armageddon-new$ curl -I https://do920hzo448ns.cloudfront.net/images1.jpeg
HTTP/1.1 502 Bad Gateway
Content-Type: text/html
Content-Length: 937
Connection: keep-alive
date: Sun, 08 Mar 2026 01:43:32 GMT
X-Cache: Error from cloudfront     
Via: 1.1 b6ac40881e078a2c141e388cfcd9923a.cloudfront.net (CloudFront)
X-Amz-Cf-Pop: MIA50-P7
X-Amz-Cf-Id: PJQdTHNI_7feTfKlJhVL3V9TS6u6PC2gPei3etIAtM-6hWwQBrDlOQ==

#####################################################################
B. São Paulo web/app host works

Prove nginx and app content are serving from São Paulo.

From São Paulo EC2:
curl -I http://localhost/
curl -I http://localhost/images1.jpeg
sudo systemctl status nginx --no-pager
ls -la /usr/share/nginx/html/index.html
chuck@LAPTOP-1B94MM1R:/d/New Obsidian/Armageddon-Lab1-2-3-4/Lab3-Armageddon-new$ curl -I http://localhost/
curl: (7) Failed to connect to localhost port 80 after 2203 ms: Could not connect to server
chuck@LAPTOP-1B94MM1R:/d/New Obsidian/Armageddon-Lab1-2-3-4/Lab3-Armageddon-new$ curl -I http://localhost/images1.jpeg
curl: (7) Failed to connect to localhost port 80 after 2212 ms: Could not connect to server
chuck@LAPTOP-1B94MM1R:/d/New Obsidian/Armageddon-Lab1-2-3-4/Lab3-Armageddon-new$ sudo systemctl status nginx --no-pager
bash: sudo: command not found
chuck@LAPTOP-1B94MM1R:/d/New Obsidian/Armageddon-Lab1-2-3-4/Lab3-Armageddon-new$ ls -la /usr/share/nginx/html/index.html
ls: cannot access '/usr/share/nginx/html/index.html': No such file or directory

#################################################################################

C. TGW corridor works

Prove São Paulo can reach Tokyo through the TGW.

From São Paulo EC2:
nc -vz <tokyo-rds-endpoint> 3306

chuck@LAPTOP-1B94MM1R:/d/New Obsidian/Armageddon-Lab1-2-3-4/Lab3-Armageddon-new$ aws ec2 describe-instances \
>   --region ap-northeast-1 \
>   --query "Reservations[].Instances[].PrivateIpAddress" \
>   --output text
10.10.20.139
tokyo-private-ip.
####################################################################################
instance name
chuck@LAPTOP-1B94MM1R:/d/New Obsidian/Armageddon-Lab1-2-3-4/Lab3-Armageddon-new$ aws ec2 describe-instances \
>   --region ap-northeast-1 \
>   --query "Reservations[].Instances[].{Name:Tags[?Key=='Name']|[0].Value,PrivateIP:PrivateIpAddress}" \
>   --output table
--------------------------
|    DescribeInstances   |
+-------+----------------+
| Name  |   PrivateIP    |
+-------+----------------+
|  None |  10.10.20.139  |
+-------+----------------+
#############################################################################
Get Tokyo RDS endpoint
chuck@LAPTOP-1B94MM1R:/d/New Obsidian/Armageddon-Lab1-2-3-4/Lab3-Armageddon-new$ aws rds describe-db-instances \
>   --region ap-northeast-1 \
>   --query "DBInstances[].Endpoint.Address" \
>   --output text
lab3-vpc-db.ch24q2ss4jm0.ap-northeast-1.rds.amazonaws.com
########################################################################
Verify connection from São Paulo EC2
#########################################################################

(
echo "TOKYO EC2 PRIVATE IP:"
aws ec2 describe-instances \
  --region ap-northeast-1 \
  --query "Reservations[].Instances[].PrivateIpAddress" \
  --output text

echo ""
echo "TOKYO RDS ENDPOINT:"
aws rds describe-db-instances \
  --region ap-northeast-1 \
  --query "DBInstances[].Endpoint.Address" \
  --output text

echo ""
echo "TOKYO TRANSIT GATEWAY ID:"
aws ec2 describe-transit-gateways \
  --region ap-northeast-1 \
  --query "TransitGateways[].TransitGatewayId" \
  --output text

echo ""
echo "TOKYO VPC CIDR:"
aws ec2 describe-vpcs \
  --region ap-northeast-1 \
  --query "Vpcs[].CidrBlock" \
  --output text
)
TOKYO EC2 PRIVATE IP:
10.10.20.139


TOKYO RDS ENDPOINT:
lab3-vpc-db.ch24q2ss4jm0.ap-northeast-1.rds.amazonaws.com


TOKYO TRANSIT GATEWAY ID:
tgw-0eaa75951622fe79b


TOKYO VPC CIDR:
10.10.0.0/16    172.31.0.0/16
