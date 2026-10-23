variable "project_name" {
  description = "Prefix used to name AWS resources"
  type        = string
}

variable "private_subnet_ids" {
  description = "Private subnet IDs for RDS"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID for the RDS security group"
  type        = string
}

variable "ec2_security_group_id" {
  description = "EC2 security group allowed to access the database"
  type        = string
}

variable "db_instance_class" {
  description = "RDS instance class"
  type        = string
}

variable "db_name" {
  description = "Initial database name"
  type        = string
}

variable "db_username" {
  description = "Database administrator username"
  type        = string
}

variable "db_password" {
  description = "Database administrator password"
  type        = string
  sensitive   = true
}
