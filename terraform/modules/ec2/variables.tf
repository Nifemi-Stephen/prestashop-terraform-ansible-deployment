variable "project_name" {
  description = "Prefix used to name AWS resources"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "public_subnet_id" {
  description = "ID of the public subnet"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "Existing AWS EC2 key pair name"
  type        = string
}

variable "ssh_allowed_cidr" {
  description = "Public IP allowed to connect over SSH"
  type        = string
}
