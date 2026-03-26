#############################


Repeat for the other 3 tunnels using:

169.254.245.174/30 peer 169.254.245.173

169.254.176.198/30 peer 169.254.176.197

169.254.136.254/30 peer 169.254.136.253


| Tunnel | PSK                                |
| ------ | ---------------------------------- |
| 1      | `TkUy5c_rNNzDb3VnI4L9iEA2YomJxB6N` |
| 2      | `vwFOchTT0txsHBEXw_Y8aaMPkuHrv6kZ` |
| 3      | `gbMn.Bq6hbe89c0hD8zhD.jiWgVQdfLQ` |
| 4      | `SruVZAoMviUGN6UzrdR1Leh21YG9.f56` |


chuck@LAPTOP-1B94MM1R:/d/New Obsidian/Armageddon-Lab1-2-3-4/Lab3-Armageddon-new$ ls *.tf -l
-rw-r--r-- 1 chuck 197121  550 Mar  9 23:42 800-provider.tf
-rw-r--r-- 1 chuck 197121 6799 Mar 10 19:03 805-main.tf
-rw-r--r-- 1 chuck 197121 1396 Mar 10 16:17 890-outputs.tf
-rw-r--r-- 1 chuck 197121 1707 Mar  9 21:21 892-outputs.tf
-rw-r--r-- 1 chuck 197121 3158 Mar  9 21:18 895-variables.tf
chuck@LAPTOP-1B94MM1R:/d/New Obsidian/Armageddon-Lab1-2-3-4/Lab3-Armageddon-new$ cd modules
total 52
drwxr-xr-x 1 chuck 197121 0 Mar  9 23:08  aws_tokyo_tgw_vpn/
drwxr-xr-x 1 chuck 197121 0 Mar  7 12:11 'cross-region routes'/
drwxr-xr-x 1 chuck 197121 0 Mar  6 10:22  edge_public/
drwxr-xr-x 1 chuck 197121 0 Mar 10 17:37  gcp_ha_vpn_to_aws/
drwxr-xr-x 1 chuck 197121 0 Mar  8 19:51  gcp_iowa_network/
drwxr-xr-x 1 chuck 197121 0 Mar  9 20:27  gcp_ncc/
drwxr-xr-x 1 chuck 197121 0 Mar  8 19:58  gcp_ny_branch_network/
drwxr-xr-x 1 chuck 197121 0 Mar  9 21:36  gcp_transit_vpc/
drwxr-xr-x 1 chuck 197121 0 Mar  9 22:54  peering_resources/
drwxr-xr-x 1 chuck 197121 0 Mar  6 14:56  saopaulo_core/
drwxr-xr-x 1 chuck 197121 0 Mar  6 15:56  saopaulo_tgw/
drwxr-xr-x 1 chuck 197121 0 Mar  3 10:25  Temp-folder/
drwxr-xr-x 1 chuck 197121 0 Mar  7 17:52  tokyo_core/
drwxr-xr-x 1 chuck 197121 0 Mar  6 10:59  tokyo_tgw/


# Pro Tip (For Your Portfolio)

This report can easily become a **portfolio project for Keyes Cloud Solutions**.

You could publish:

- diagrams
    
- architecture explanation
    
- Terraform modules
    
- screenshots
    

on:

**portfolio.keyescloudsolutions.com**

---

If you want, I can also show you the **best screenshot list (exact screenshots professors expect)** so you don't miss any deliverables.

Plan: 0 to add, 0 to change, 150 to destroy.

Changes to Outputs:
  - app_fqdn                    = "www.keyescloudsolutions.com" -> null
  - cloudfront_distribution_id  = "EUN22J2U2LTO3" -> null
  - cloudfront_domain_name      = "do920hzo448ns.cloudfront.net" -> null
  - gcp_ha_vpn_interface_0_ip   = "34.183.4.150" -> null
  - gcp_ha_vpn_interface_1_ip   = "35.220.4.33" -> null
  - gcp_ncc_hub_id              = "projects/ck-armageddon/locations/global/hubs/armageddon-ncc-hub" -> null
  - gcp_ncc_hub_name            = "projects/ck-armageddon/locations/global/hubs/armageddon-ncc-hub" -> null
  - gcp_ncc_iowa_spoke_id       = "projects/ck-armageddon/locations/global/spokes/armageddon-ncc-hub-iowa-spoke" -> null
  - gcp_ncc_ny_spoke_id         = "projects/ck-armageddon/locations/global/spokes/armageddon-ncc-hub-ny-spoke" -> null
  - iowa_network_id             = "projects/ck-armageddon/global/networks/iowa-medical-vpc" -> null
  - iowa_subnet_cidr            = "10.30.1.0/24" -> null
  - iowa_vm_internal_ip         = "10.30.1.2" -> null
  - iowa_vm_name                = "iowa-test-vm01" -> null
  - ny_network_id               = "projects/ck-armageddon/global/networks/nihonmachi-ny-vpc" -> null
  - ny_subnet_cidr              = "10.40.1.0/24" -> null
  - ny_vm_internal_ip           = "10.40.1.2" -> null
  - ny_vm_name                  = "ny-branch-vm01" -> null
  - origin_header_value         = (sensitive value) -> null
  - saopaulo_app_instance_id    = "i-0e7cf8643dc26fdc6" -> null
  - saopaulo_private_subnets    = [
      - "subnet-07ec87b1ad01dd857",
      - "subnet-0047e65f5f78050c2",
    ] -> null
  - saopaulo_vpc_id             = "vpc-05758ad32619d5288" -> null
  - tokyo_customer_gateway_1_id = "cgw-0a8e637dd8304d640" -> null
  - tokyo_customer_gateway_2_id = "cgw-03b70159d89d2c710" -> null
  - tokyo_vpn_connection_1_id   = "vpn-03067e15e97109db4" -> null
  - tokyo_vpn_connection_2_id   = "vpn-08ebdc9fe060e5592" -> null

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.


lab4-multicloud/
├── Jenkinsfile
├── README.md
├── .gitignore
├── docs/
│   ├── deliverables/
│   ├── reports/
│   └── diagrams/
├── site/
│   ├── index.html
│   ├── green/
│   └── scripts/
├── infra/
│   ├── root/
│   │   ├── 800-provider.tf
│   │   ├── 805-main.tf
│   │   ├── 890-outputs.tf
│   │   ├── 895-variables.tf
│   │   └── terraform.tfvars.example
│   ├── modules/
│   │   ├── aws_tokyo_tgw_vpn/
│   │   ├── edge_public/
│   │   ├── gcp_ha_vpn_to_aws/
│   │   ├── gcp_iowa_network/
│   │   ├── gcp_ncc/
│   │   ├── gcp_ny_branch_network/
│   │   ├── gcp_transit_vpc/
│   │   ├── peering_resources/
│   │   ├── saopaulo_core/
│   │   ├── saopaulo_tgw/
│   │   ├── tokyo_core/
│   │   └── tokyo_tgw/
│   └── env/
│       ├── dev.tfvars
│       └── prod.tfvars.example
└── scripts/
    ├── verify/
    ├── deploy_site_to_s3_and_invalidate.sh
    └── lab3_verify.sh