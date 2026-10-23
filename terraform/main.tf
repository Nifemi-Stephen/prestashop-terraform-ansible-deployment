module "vpc" {
  source = "./modules/vpc"

  project_name          = var.project_name
  vpc_cidr              = var.vpc_cidr
  public_subnet_cidr    = var.public_subnet_cidr
  private_subnet_a_cidr = var.private_subnet_a_cidr
  private_subnet_b_cidr = var.private_subnet_b_cidr
  availability_zone_a   = var.availability_zone_a
  availability_zone_b   = var.availability_zone_b
}

module "ec2" {
  source = "./modules/ec2"

  project_name     = var.project_name
  vpc_id           = module.vpc.vpc_id
  public_subnet_id = module.vpc.public_subnet_id
  instance_type    = var.instance_type
  key_name         = "portfolio_pass"
  ssh_allowed_cidr = var.ssh_allowed_cidr
}

module "rds" {
  source = "./modules/rds"

  project_name          = var.project_name
  vpc_id                = module.vpc.vpc_id
  private_subnet_ids    = module.vpc.private_subnet_ids
  ec2_security_group_id = module.ec2.security_group_id
  db_instance_class     = var.db_instance_class
  db_name               = var.db_name
  db_username           = var.db_username
  db_password           = var.db_password
}
