Outputs:

app_fqdn = "www.keyescloudsolutions.com"
cloudfront_distribution_id = "EUN22J2U2LTO3"
cloudfront_domain_name = "do920hzo448ns.cloudfront.net"
iowa_vm_internal_ip = "10.30.1.2"
iowa_vm_name = "iowa-test-vm01"
ny_vm_internal_ip = "10.40.1.2"
ny_vm_name = "ny-branch-vm01"
origin_header_value = <sensitive>
saopaulo_app_instance_id = "i-0e7cf8643dc26fdc6"
saopaulo_private_subnets = [
  "subnet-07ec87b1ad01dd857",
  "subnet-0047e65f5f78050c2",
]
saopaulo_vpc_id = "vpc-05758ad32619d5288"

                Internet
                    │
              CloudFront + WAF
                    │
                Tokyo ALB
                    │
               Private EC2
                    │
                   RDS
                    │
         ┌──────────┴──────────┐
         │                     │
     Tokyo TGW           São Paulo VPC
                             │
                        EC2 instance
                             │
                      (future corridor)
         ┌──────────────┴──────────────┐
         │                              │
      GCP Iowa                     GCP NY
   10.30.1.0/24                 10.40.1.0/24

   Tokyo VPC
   │
Tokyo TGW
   │
──────────── TGW PEERING ────────────
   │
São Paulo TGW
   │
São Paulo VPC

Outputs:

app_fqdn = "www.keyescloudsolutions.com"
cloudfront_distribution_id = "EUN22J2U2LTO3"
cloudfront_domain_name = "do920hzo448ns.cloudfront.net"
iowa_network_id = "projects/ck-armageddon/global/networks/iowa-medical-vpc"
iowa_subnet_cidr = "10.30.1.0/24"
iowa_vm_internal_ip = "10.30.1.2"
iowa_vm_name = "iowa-test-vm01"
ny_network_id = "projects/ck-armageddon/global/networks/nihonmachi-ny-vpc"
ny_subnet_cidr = "10.40.1.0/24"
ny_vm_internal_ip = "10.40.1.2"
ny_vm_name = "ny-branch-vm01"
origin_header_value = <sensitive>
saopaulo_app_instance_id = "i-0e7cf8643dc26fdc6"
saopaulo_private_subnets = [
  "subnet-07ec87b1ad01dd857",
  "subnet-0047e65f5f78050c2",
]
saopaulo_vpc_id = "vpc-05758ad32619d5288"

chuck@LAPTOP-1B94MM1R:/d/New Obsidian/Armageddon-Lab1-2-3-4/Lab3-Armageddon-new$ aws ec2 describe-transit-gateway-peering-attachments --region ap-northeast-1
{
    "TransitGatewayPeeringAttachments": [
        {
            "TransitGatewayAttachmentId": "tgw-attach-0d242898036bc3ae0",
            "RequesterTgwInfo": {
                "TransitGatewayId": "tgw-0eaa75951622fe79b",
                "OwnerId": "557690581423",
                "Region": "ap-northeast-1"
            },
            "AccepterTgwInfo": {
                "TransitGatewayId": "tgw-07b32e9d404c2db98",
                "OwnerId": "557690581423",
                "Region": "sa-east-1"
            },
            "Status": {
                "Code": "available",
                "Message": "Available"
            },
            "State": "available",
            "CreationTime": "2026-03-09T22:57:16+00:00",
            "Tags": [
                {
                    "Key": "Project",
                    "Value": "Armageddon-Lab3"
                },
                {
                    "Key": "Owner",
                    "Value": "CK"
                },
                {
                    "Key": "Name",
                    "Value": "lab3-vpc-tokyo-to-saopaulo-peer"
                }
            ]
        }
    ]
}

chuck@LAPTOP-1B94MM1R:/d/New Obsidian/Armageddon-Lab1-2-3-4/Lab3-Armageddon-new$ aws ec2 describe-transit-gateway-peering-attachments --region sa-east-1
{
    "TransitGatewayPeeringAttachments": [
        {
            "TransitGatewayAttachmentId": "tgw-attach-0d242898036bc3ae0",
            "RequesterTgwInfo": {
                "TransitGatewayId": "tgw-0eaa75951622fe79b",
                "OwnerId": "557690581423",
                "Region": "ap-northeast-1"
            },
            "AccepterTgwInfo": {
                "TransitGatewayId": "tgw-07b32e9d404c2db98",
                "OwnerId": "557690581423",
                "Region": "sa-east-1"
            },
            "Status": {
                "Code": "available",
                "Message": "Available"
            },
            "State": "available",
            "CreationTime": "2026-03-09T22:57:27+00:00",
            "Tags": [
                {
                    "Key": "Project",
                    "Value": "Armageddon-Lab3"
                },
                {
                    "Key": "Owner",
                    "Value": "CK"
                },
                {
                    "Key": "Name",
                    "Value": "lab3-vpc-saopaulo-peer-accept"
                }

                aws ec2 search-transit-gateway-routes \
  --transit-gateway-route-table-id <tokyo_tgw_route_table_id> \
  --filters Name=state,Values=active \
  --region ap-northeast-1

  aws ec2 search-transit-gateway-routes \
  --transit-gateway-route-table-id <saopaulo_tgw_route_table_id> \
  --filters Name=state,Values=active \
  --region sa-east-1

  ###################################################################################


TOKYO
  aws ec2 describe-transit-gateway-route-tables \
  --filters Name=transit-gateway-id,Values=tgw-0eaa75951622fe79b \
  --region ap-northeast-1
"TransitGatewayRouteTables": [
        {
            "TransitGatewayRouteTableId": "tgw-rtb-0793828a75706f478",
            "TransitGatewayId": "tgw-0eaa75951622fe79b",
            "State": "available",
            "DefaultAssociationRouteTable": false,
            "DefaultPropagationRouteTable": false,
            "CreationTime": "2026-03-07T22:15:27+00:00",
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "tokyo-tgw-rt"
###########################################################################
SAO PAULO
aws ec2 describe-transit-gateway-route-tables \
  --filters Name=transit-gateway-id,Values=tgw-07b32e9d404c2db98 \
  --region sa-east-1
  
    "TransitGatewayRouteTables": [
        {
        {
            "TransitGatewayRouteTableId": "tgw-rtb-0fcf6103ee2779695",
            "TransitGatewayId": "tgw-07b32e9d404c2db98",
            "State": "available",
            "DefaultAssociationRouteTable": false,
            "DefaultPropagationRouteTable": false,
            "CreationTime": "2026-03-07T22:15:23+00:00",
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "saopaulo-tgw-rt"
                }
                ##################################################################
  aws ec2 search-transit-gateway-routes \
  --transit-gateway-route-table-id tgw-rtb-0793828a75706f478 \
  --filters Name=state,Values=active \
  --region ap-northeast-1

    "Routes": [
        {
            "DestinationCidrBlock": "10.20.0.0/16",
            "TransitGatewayRouteTableAnnouncementId": "",
            "TransitGatewayAttachments": [
                {
                    "ResourceId": "tgw-07b32e9d404c2db98",
                    "TransitGatewayAttachmentId": "tgw-attach-0d242898036bc3ae0",
            "TransitGatewayAttachments": [
                {
                    "ResourceId": "tgw-07b32e9d404c2db98",
                    "TransitGatewayAttachmentId": "tgw-attach-0d242898036bc3ae0",
                {
                    "ResourceId": "tgw-07b32e9d404c2db98",
                    "TransitGatewayAttachmentId": "tgw-attach-0d242898036bc3ae0",
                    "ResourceId": "tgw-07b32e9d404c2db98",
                    "TransitGatewayAttachmentId": "tgw-attach-0d242898036bc3ae0",
                    "ResourceType": "peering"
                }
                    "TransitGatewayAttachmentId": "tgw-attach-0d242898036bc3ae0",
                    "ResourceType": "peering"
                }
            ],
            "Type": "static",
            "State": "active"
                    "ResourceType": "peering"
                }
            ],
            "Type": "static",
            "State": "active"
            ],
            "Type": "static",
            "State": "active"
        }
    ],
    "AdditionalRoutesAvailable": false
}
  #######################################################################

 aws ec2 search-transit-gateway-routes \
  --transit-gateway-route-table-id tgw-rtb-0fcf6103ee2779695 \
  --filters Name=state,Values=active \
  --region sa-east-1     
  
    "Routes": [
        {
            "DestinationCidrBlock": "10.10.0.0/16",
            "TransitGatewayRouteTableAnnouncementId": "",
            "TransitGatewayAttachments": [
                {
                    "ResourceId": "tgw-0eaa75951622fe79b",
                    "TransitGatewayAttachmentId": "tgw-attach-0d242898036bc3ae0",
                    "ResourceType": "peering"
                }
            ],
            "Type": "static",
            "State": "active"
        },
        {
            "DestinationCidrBlock": "10.20.0.0/16",
            "TransitGatewayRouteTableAnnouncementId": "",
            "TransitGatewayAttachments": [
                {
                    "ResourceId": "vpc-05758ad32619d5288",
                    "TransitGatewayAttachmentId": "tgw-attach-0b7519ce00fbe58bc",
                    "ResourceType": "vpc"
                }
            ],
            "Type": "propagated",
            "State": "active"
        }
    ],
    "AdditionalRoutesAvailable": false
}          


Outputs:

app_fqdn = "www.keyescloudsolutions.com"
cloudfront_distribution_id = "EUN22J2U2LTO3"
cloudfront_domain_name = "do920hzo448ns.cloudfront.net"
iowa_network_id = "projects/ck-armageddon/global/networks/iowa-medical-vpc"
iowa_subnet_cidr = "10.30.1.0/24"
iowa_vm_internal_ip = "10.30.1.2"
iowa_vm_name = "iowa-test-vm01"
ny_network_id = "projects/ck-armageddon/global/networks/nihonmachi-ny-vpc"
ny_subnet_cidr = "10.40.1.0/24"
ny_vm_internal_ip = "10.40.1.2"
ny_vm_name = "ny-branch-vm01"
origin_header_value = <sensitive>
saopaulo_app_instance_id = "i-0e7cf8643dc26fdc6"
saopaulo_private_subnets = [
  "subnet-07ec87b1ad01dd857",
  "subnet-0047e65f5f78050c2",
]
saopaulo_vpc_id = "vpc-05758ad32619d5288"

Outputs:

app_fqdn = "www.keyescloudsolutions.com"
cloudfront_distribution_id = "EUN22J2U2LTO3"
cloudfront_domain_name = "do920hzo448ns.cloudfront.net"
gcp_ncc_hub_id = "projects/ck-armageddon/locations/global/hubs/armageddon-ncc-hub"
gcp_ncc_hub_name = "projects/ck-armageddon/locations/global/hubs/armageddon-ncc-hub"
gcp_ncc_iowa_spoke_id = "projects/ck-armageddon/locations/global/spokes/armageddon-ncc-hub-iowa-spoke"
gcp_ncc_ny_spoke_id = "projects/ck-armageddon/locations/global/spokes/armageddon-ncc-hub-ny-spoke"
iowa_network_id = "projects/ck-armageddon/global/networks/iowa-medical-vpc"
iowa_subnet_cidr = "10.30.1.0/24"
iowa_vm_internal_ip = "10.30.1.2"
iowa_vm_name = "iowa-test-vm01"
ny_network_id = "projects/ck-armageddon/global/networks/nihonmachi-ny-vpc"
ny_subnet_cidr = "10.40.1.0/24"
ny_vm_internal_ip = "10.40.1.2"
ny_vm_name = "ny-branch-vm01"
origin_header_value = <sensitive>
saopaulo_app_instance_id = "i-0e7cf8643dc26fdc6"
saopaulo_private_subnets = [
  "subnet-07ec87b1ad01dd857",
  "subnet-0047e65f5f78050c2",
]
saopaulo_vpc_id = "vpc-05758ad32619d5288"


Outputs:

app_fqdn = "www.keyescloudsolutions.com"
cloudfront_distribution_id = "EUN22J2U2LTO3"
cloudfront_domain_name = "do920hzo448ns.cloudfront.net"
gcp_ha_vpn_interface_0_ip = "34.183.4.150"
gcp_ha_vpn_interface_1_ip = "35.220.4.33"
gcp_ncc_hub_id = "projects/ck-armageddon/locations/global/hubs/armageddon-ncc-hub"
gcp_ncc_hub_name = "projects/ck-armageddon/locations/global/hubs/armageddon-ncc-hub"
gcp_ncc_iowa_spoke_id = "projects/ck-armageddon/locations/global/spokes/armageddon-ncc-hub-iowa-spoke"
gcp_ncc_ny_spoke_id = "projects/ck-armageddon/locations/global/spokes/armageddon-ncc-hub-ny-spoke"
iowa_network_id = "projects/ck-armageddon/global/networks/iowa-medical-vpc"
iowa_subnet_cidr = "10.30.1.0/24"
iowa_vm_internal_ip = "10.30.1.2"
iowa_vm_name = "iowa-test-vm01"
ny_network_id = "projects/ck-armageddon/global/networks/nihonmachi-ny-vpc"
ny_subnet_cidr = "10.40.1.0/24"
ny_vm_internal_ip = "10.40.1.2"
ny_vm_name = "ny-branch-vm01"
origin_header_value = <sensitive>
saopaulo_app_instance_id = "i-0e7cf8643dc26fdc6"
saopaulo_private_subnets = [
  "subnet-07ec87b1ad01dd857",
  "subnet-0047e65f5f78050c2",
]
saopaulo_vpc_id = "vpc-05758ad32619d5288"
tokyo_customer_gateway_1_id = "cgw-0a8e637dd8304d640"
tokyo_customer_gateway_2_id = "cgw-03b70159d89d2c710"
tokyo_vpn_connection_1_id = "vpn-03067e15e97109db4"
tokyo_vpn_connection_2_id = "vpn-08ebdc9fe060e5592"

GCP public IPs

interface 0: 34.183.4.150

interface 1: 35.220.4.33

AWS public tunnel IPs

For vpn-03067e15e97109db4:

tunnel 1 outside: 18.180.228.239

tunnel 2 outside: 54.95.47.250

For vpn-08ebdc9fe060e5592:

tunnel 1 outside: 18.180.5.230

tunnel 2 outside: 54.249.50.227

BGP inside pairs

VPN 1:

tunnel 1:

AWS inside: 169.254.254.177

GCP inside: 169.254.254.178

PSK: TkUy5c_rNNzDb3VnI4L9iEA2YomJxB6N

tunnel 2:

AWS inside: 169.254.245.173

GCP inside: 169.254.245.174

PSK: vwFOchTT0txsHBEXw_Y8aaMPkuHrv6kZ

VPN 2:

tunnel 1:

AWS inside: 169.254.176.197

GCP inside: 169.254.176.198

PSK: gbMn.Bq6hbe89c0hD8zhD.jiWgVQdfLQ

tunnel 2:

AWS inside: 169.254.136.253

GCP inside: 169.254.136.254

PSK: SruVZAoMviUGN6UzrdR1Leh21YG9.f56