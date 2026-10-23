
output "vpc_id" {
  description = "ID of the created VPC"
  value       = module.vpc.vpc_id
}

output "public_subnet_id" {
  description = "ID of the public subnet"
  value       = module.vpc.public_subnet_id
}

output "private_subnet_ids" {
  description = "IDs of the private RDS subnets"
  value       = module.vpc.private_subnet_ids
}


output "ec2_instance_id" {
  description = "ID of the PrestaShop EC2 instance"
  value       = module.ec2.instance_id
}

output "ec2_public_ip" {
  description = "Public IP of the PrestaShop EC2 instance"
  value       = module.ec2.public_ip
}

output "ec2_public_dns" {
  description = "Public DNS name of the PrestaShop EC2 instance"
  value       = module.ec2.public_dns
}

output "rds_endpoint" {
  description = "Endpoint of the MariaDB database"
  value       = module.rds.db_endpoint
}

output "rds_port" {
  description = "Port of the MariaDB database"
  value       = module.rds.db_port
}

output "rds_database_name" {
  description = "Name of the PrestaShop database"
  value       = module.rds.db_name
}
