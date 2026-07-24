resource "aws_key_pair" "k8s_key" {
  key_name   = "k8-new-pair"
  public_key = file(var.public_key_path)
}