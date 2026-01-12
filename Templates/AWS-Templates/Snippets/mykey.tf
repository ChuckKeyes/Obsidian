resource "tls_private_key" "mykey" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = "MyLinuxBox"
  public_key = tls_private_key.mykey.public_key_openssh
}

# OPTIONAL — save the private key to a file (local)
resource "local_file" "private_key" {
  content              = tls_private_key.mykey.private_key_pem
  filename             = "${path.module}/mykey.pem"
  file_permission      = "0400"
}
