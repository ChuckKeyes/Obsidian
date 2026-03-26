output "jenkins_instance_id" {
  value = aws_instance.jenkins_vm.id
}

output "jenkins_public_ip" {
  value = aws_instance.jenkins_vm.public_ip
}

output "jenkins_public_dns" {
  value = aws_instance.jenkins_vm.public_dns
}

output "jenkins_url" {
  value = "http://${aws_instance.jenkins_vm.public_ip}:8080"
}

output "jenkins_sg_id" {
  value = aws_security_group.jenkins_ec2_sg.id
}

output "ssh_command" {
  value = "ssh -i cek-jenkins.pem ec2-user@${aws_instance.jenkins_vm.public_ip}"
}

output "root_disk_size_gb" {
  description = "Root EBS volume size (GB)"
  value       = aws_instance.jenkins_vm.root_block_device[0].volume_size
}

# output "tmp_disk_command" {
#   value = "ssh -i cek-jenkins.pem ec2-user@${aws_instance.jenkins.public_ip} 'cat /home/ec2-user/tmp_disk.txt'"
# }

output "tmp_size_configured" {
  description = "Configured /tmp size from bootstrap design"
  value       = var.tmp_size
}

output "check_disk_command" {
  description = "SSH command to verify root disk and /tmp size on the instance"
  value       = "ssh -i cek-jenkins.pem ec2-user@${aws_instance.jenkins_vm.public_ip} 'df -h / /tmp'"
}

