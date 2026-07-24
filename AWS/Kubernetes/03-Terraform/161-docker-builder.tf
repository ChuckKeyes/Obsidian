resource "aws_instance" "docker_builder" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t3.micro"
  key_name               = aws_key_pair.k8s_key.key_name
  vpc_security_group_ids = [aws_security_group.k8s_sg.id]
  user_data              = file("docker-builder.sh")

  iam_instance_profile = aws_iam_instance_profile.docker_builder_profile.name

  root_block_device {
    volume_size = 25
    volume_type = "gp3"
  }

  tags = {
    Name = "docker-builder"
    Role = "docker"
  }
}