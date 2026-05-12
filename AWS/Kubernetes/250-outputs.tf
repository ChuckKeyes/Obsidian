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
