variable "aws_region" {
  description = "AWS deployment region"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Prefix for AWS resource names"
  type        = string
  default     = "prestashop"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "db_instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "db_name" {
  description = "PrestaShop database name"
  type        = string
  default     = "prestashop"
}

variable "db_username" {
  description = "RDS administrator username"
  type        = string
  default     = "prestashopadmin"
}

variable "db_password" {
  description = "RDS administrator password"
  type        = string
  sensitive   = true
}

variable "ssh_allowed_cidr" {
  description = "Your public IP in CIDR notation"
  type        = string
}


variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_a_cidr" {
  description = "CIDR block for private subnet A"
  type        = string
  default     = "10.0.10.0/24"
}

variable "private_subnet_b_cidr" {
  description = "CIDR block for private subnet B"
  type        = string
  default     = "10.0.20.0/24"
}

variable "availability_zone_a" {
  description = "Availability Zone A"
  type        = string
  default     = "us-east-1a"
}

variable "availability_zone_b" {
  description = "Availability Zone B"
  type        = string
  default     = "us-east-1b"
}
