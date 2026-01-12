Command to start a SSh 
ssh -i mykey.pem ec2-user@<public-ip>


  Generate key locally:
   ssh-keygen -t rsa -b 4096 -f ~/.ssh/mykey

   Results...................
   ~/.ssh/mykey        ← private key
~/.ssh/mykey.pub    ← public key


Terraform code:
resource "aws_key_pair" "imported_key" {
  key_name   = "MyLinuxBox"
  public_key = file("~/.ssh/mykey.pub")
}
This uploads the public key to AWS; Terraform never sees your private key.

Terraform will produce:
MyLinuxBox-key.pem

Right now the private key is written to:
${path.module}/MyLinuxBox-key.pem

Add this to your .gitignore immediately:
*.pem
*.key
*.p12
MyLinuxBox-key.pem

Move the private key to a safe location after creation
After Terraform generates it, move it manually:
C:\Users\chuck\.ssh\MyLinuxBox-key.pem

Git Bash / WSL:
mv MyLinuxBox-key.pem ~/.ssh/
chmod 400 ~/.ssh/MyLinuxBox-key.pem

MUST update the EC2 instances to use your new key name
key_name = aws_key_pair.MyLinuxBox.key_name

Example in your launch template:
resource "aws_launch_template" "web_lt" {
  ...
  key_name = aws_key_pair.MyLinuxBox.key_name
  ...
}

Example in EC2:
resource "aws_instance" "prometheus" {
  ...
  key_name = aws_key_pair.MyLinuxBox.key_name
}


✅ 5. Summary — YES YOU CAN USE IT

✔ Terraform will generate the key
✔ It will upload the public part to AWS
✔ It will store the private key locally
✔ You must protect the .pem file
✔ Add .pem to .gitignore
✔ Move the key to ~/.ssh after it is created
✔ Update your EC2 instances to use that key

🚀 If you'd like, I can:

Add this key-pair code into your Templates project as keypair.tf

Update all EC2 and ASG launch templates to use it

Add .gitignore so your private key never gets pushed

Add SSH instructions for Prometheus and private VMs
