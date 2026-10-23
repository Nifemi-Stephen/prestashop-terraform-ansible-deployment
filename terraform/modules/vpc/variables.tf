variable "project_name" {
  description = "Prefix used to name AWS resources"
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
  description = "Availability Zone for the public subnet and private subnet A"
  type        = string
  default     = "us-east-1a"
}

variable "availability_zone_b" {
  description = "Availability Zone for private subnet B"
  type        = string
  default     = "us-east-1b"
}
