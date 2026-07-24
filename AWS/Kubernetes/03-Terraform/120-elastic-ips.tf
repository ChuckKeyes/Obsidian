resource "aws_eip" "k8s_master_eip" {
  instance = aws_instance.master.id
  domain   = "vpc"

  tags = {
    Name = "k8s-master-elastic-ip"
  }
}

resource "aws_eip" "k8s_worker1_eip" {
  instance = aws_instance.worker1.id
  domain   = "vpc"

  tags = {
    Name = "k8s-worker1-elastic-ip"
  }
}

resource "aws_eip" "k8s_worker2_eip" {
  instance = aws_instance.worker2.id
  domain   = "vpc"

  tags = {
    Name = "k8s-worker2-elastic-ip"
  }
}