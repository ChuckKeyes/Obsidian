resource "aws_iam_role" "docker_builder_role" {
  name = "docker-builder-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "docker_builder_ecr" {
  role       = aws_iam_role.docker_builder_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPowerUser"
}

resource "aws_iam_instance_profile" "docker_builder_profile" {
  name = "docker-builder-profile"
  role = aws_iam_role.docker_builder_role.name
}