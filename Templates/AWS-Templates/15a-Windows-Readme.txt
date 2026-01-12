Nice, I see your 15-Windows.tf in this Templates project and it’s already halfway there. It:

Pulls the latest Windows Server 2022 AMI

Has a windows_enable toggle

Sets the tag:

tags = merge(var.tags, {
  Name = "${local.vpc_name}-win-1"
})


✅ So your Windows VM will already show up in the console as ck-lab-vpc-win-1 (or similar, depending on local.vpc_name).

Now we just need to make sure it’s actually RDP-accessible.

1️⃣ Security Group that allows RDP (3389) from your IP

Add this to 15-Windows.tf (or to your sg.tf if you prefer to keep SGs together):

resource "aws_security_group" "windows_rdp" {
  name        = "${local.vpc_name}-windows-rdp-sg"
  description = "Allow RDP from admin workstation"
  vpc_id      = aws_vpc.this.id

  ingress {
    description = "RDP from admin workstation"
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = [var.admin_cidr] # e.g. "x.x.x.x/32"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.tags, {
    Name = "${local.vpc_name}-windows-rdp-sg"
  })
}


You already asked earlier for admin_cidr in AWS_Variables.tf, so this should plug right in.

2️⃣ Make the Windows instance public + attach the SG

Now update your Windows instance resource in 15-Windows.tf to look like this (or adjust your existing block to match):

resource "aws_instance" "windows" {
  count = var.windows_enable ? 1 : 0

  ami           = data.aws_ami.windows.id
  instance_type = var.windows_type

  # Put it in a PUBLIC subnet in your VPC
  subnet_id = aws_subnet.public[var.azs[0]].id

  # Required so you can RDP directly from the internet
  associate_public_ip_address = true

  # Attach the RDP security group
  vpc_security_group_ids = [aws_security_group.windows_rdp.id]

  # NOTE: To decrypt the Windows Administrator password, an EC2 key pair is required.
  key_name = var.key_name != "" ? var.key_name : null

  root_block_device {
    volume_size = var.windows_volume_size
    volume_type = "gp3"
    encrypted   = true
  }

  tags = merge(var.tags, {
    Name = "${local.vpc_name}-win-1"
    OS   = "Windows"
    Role = "rdp-jumpbox"
  })
}


That gives you:

✅ Name/tag for the Windows VM (…-win-1)

✅ Public IP so you can RDP to it

✅ SG allowing 3389 only from admin_cidr

✅ Key pair support so you can decrypt the Administrator password

3️⃣ How you’ll actually log in

Once you terraform apply with windows_enable = true:

Go to EC2 → Instances.

Select the Windows instance (…-win-1).

Click Connect → RDP client → Get password.

Upload your .pem file (matching var.key_name).

Copy the decrypted Administrator password.

From your Windows laptop, open Remote Desktop Connection and use:

Computer: the public IP of the instance

User: Administrator

Password: the decrypted one