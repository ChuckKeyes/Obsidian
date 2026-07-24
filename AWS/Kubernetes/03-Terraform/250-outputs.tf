output "master_public_ip" {
  value = aws_instance.master.public_ip
}

output "worker1_public_ip" {
  value = aws_instance.worker1.public_ip
}

output "worker2_public_ip" {
  value = aws_instance.worker2.public_ip
}

output "kubernetes_dns" {
  value = "kubernetes.keyescloudsolutions.com"
}

output "ssh_master" {
  value = "ssh -i ~/.ssh/id_rsa ubuntu@${aws_instance.master.public_ip}"
}

output "ssh_worker1" {
  value = "ssh -i ~/.ssh/id_rsa ubuntu@${aws_instance.worker1.public_ip}"
}

output "ssh_worker2" {
  value = "ssh -i ~/.ssh/id_rsa ubuntu@${aws_instance.worker2.public_ip}"
}

output "k8s_master_elastic_ip" {
  value = aws_eip.k8s_master_eip.public_ip
}

output "k8s_worker1_elastic_ip" {
  value = aws_eip.k8s_worker1_eip.public_ip
}

output "k8s_worker2_elastic_ip" {
  value = aws_eip.k8s_worker2_eip.public_ip
}
######################################################################


output "docker_builder_public_ip" {
  value = aws_instance.docker_builder.public_ip
}

output "docker_builder_private_ip" {
  value = aws_instance.docker_builder.private_ip
}

output "docker_builder_instance_id" {
  value = aws_instance.docker_builder.id
}

output "docker_builder_ssh" {
  value = "ssh -i ~/.ssh/id_rsa ubuntu@${aws_instance.docker_builder.public_ip}"
}

# #########################################################################

# output "bread_ecr_url" {
#   value = aws_ecr_repository.bread.repository_url
# }

# output "portfolio_ecr_url" {
#   value = aws_ecr_repository.portfolio.repository_url
# }

# output "keyescloudsolutions_ecr_url" {
#   value = aws_ecr_repository.keyescloudsolutions.repository_url
# }
#################################################################################


# Outputs:

# docker_builder_instance_id = "i-0216e2cb4442cbbaf"
# docker_builder_private_ip = "172.31.23.34"
# docker_builder_public_ip = "100.27.222.227"
# docker_builder_ssh = "ssh -i ~/.ssh/id_rsa ubuntu@100.27.222.227"
# k8s_master_elastic_ip = "52.45.220.77"
# k8s_worker1_elastic_ip = "34.232.176.252"
# k8s_worker2_elastic_ip = "3.216.130.14"
# kubernetes_dns = "kubernetes.keyescloudsolutions.com"
# master_public_ip = "52.45.220.77"
# ssh_master = "ssh -i ~/.ssh/id_rsa ubuntu@52.45.220.77"
# ssh_worker1 = "ssh -i ~/.ssh/id_rsa ubuntu@34.232.176.252"
# ssh_worker2 = "ssh -i ~/.ssh/id_rsa ubuntu@3.216.130.14"
# worker1_public_ip = "34.232.176.252"
# worker2_public_ip = "3.216.130.14"
