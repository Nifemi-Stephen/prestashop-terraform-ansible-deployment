
output "instance_id" {
  description = "ID of the PrestaShop EC2 instance"
  value       = aws_instance.prestashop.id
}

output "public_ip" {
  description = "Public IP address of the PrestaShop EC2 instance"
  value       = aws_instance.prestashop.public_ip
}

output "public_dns" {
  description = "Public DNS name of the EC2 instance"
  value       = aws_instance.prestashop.public_dns
}

output "security_group_id" {
  description = "EC2 security group ID for the RDS module"
  value       = aws_security_group.ec2.id
}
