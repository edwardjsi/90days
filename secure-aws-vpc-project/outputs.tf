# outputs.tf

output "ec2_public_ip" {
  description = "Public IP of the web instance"
  value       = aws_instance.web.public_ip
}

output "security_group_id" {
  value = aws_security_group.web_sg.id
}

output "nacl_id" {
  value = aws_network_acl.secure_nacl.id
}