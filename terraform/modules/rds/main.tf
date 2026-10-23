resource "aws_security_group" "rds" {
  name        = "${var.project_name}-rds-sg"
  description = "Allow MariaDB access only from the PrestaShop EC2 instance"
  vpc_id      = var.vpc_id

  ingress {
    description     = "MariaDB from PrestaShop EC2"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [var.ec2_security_group_id]
  }

  tags = {
    Name = "${var.project_name}-rds-sg"
  }
}

resource "aws_db_subnet_group" "main" {
  name       = "${var.project_name}-db-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "${var.project_name}-db-subnet-group"
  }
}

resource "aws_db_parameter_group" "main" {
  name   = "${var.project_name}-mariadb-params"
  family = "mariadb11.8"

  parameter {
    name         = "require_secure_transport"
    value        = "OFF"
    apply_method = "immediate"
  }

  tags = {
    Name = "${var.project_name}-mariadb-params"
  }
}

resource "aws_db_instance" "main" {
  identifier                 = "${var.project_name}-db"
  engine                     = "mariadb"
  instance_class             = var.db_instance_class
  parameter_group_name = aws_db_parameter_group.main.name
  allocated_storage          = 20
  storage_type               = "gp3"
  storage_encrypted          = true
  db_name                    = var.db_name
  username                   = var.db_username
  password                   = var.db_password
  port                       = 3306
  db_subnet_group_name       = aws_db_subnet_group.main.name
  vpc_security_group_ids     = [aws_security_group.rds.id]
  publicly_accessible        = false
  multi_az                   = false
  backup_retention_period    = 0
  auto_minor_version_upgrade = true
  deletion_protection        = false
  skip_final_snapshot        = true

  tags = {
    Name = "${var.project_name}-db"
  }
}
