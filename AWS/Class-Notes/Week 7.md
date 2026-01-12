## 10-21-2025

Terraform week 2, VPC

### command line: bash --> 102125/
	touch 0-auth.tf
	touch 1-vpc.tf
	code .
	https://github.com/aaron-dm-mcdonald/Class7-notes/tree/main/101825
	paste 0-auth.tf
	curl  https://raw.githubusercontent.com/aaron-dm-mcdonald/Class7-notes/refs/heads/main/101825/check.sh 
	cp ../.gitignore .     copy to current folder
	*New terminal*
	terraform init --> validate --> plan --> apply
	#### {terraform.tfstate}
		
### file management
https://github.com/malgus-waf/class5
		2-subnets.tf ---> change region,, change address(cidr),, change vpc_id 
		3-igw.tf ---> internet gateway,, change vpc_id
		4-nat.tf ---> change name(nat)
		5-route.tf ---> change name(main),, change gateway(igw.id),, change region
		blob:https://app.zoom.us/ffb62664-d10b-4298-b2dc-4572ce1a1c38
		
### terraform
	terraform state list
	terraform destroy ---> yes

### git---> Homework

