# PrestaShop Deployment on AWS with Terraform and Ansible

## Overview

This project automates the deployment of **PrestaShop**, an open-source e-commerce platform, on AWS. Terraform provisions the infrastructure, Ansible configures the EC2 host and deploys the application with Docker Compose, and Amazon RDS provides the managed MariaDB database.


## Objectives

- Provision AWS infrastructure using reusable Terraform modules.
- Deploy PrestaShop in a Docker container on an EC2 instance.
- Use Amazon RDS MariaDB as the application database.
- Automate host configuration and application deployment with Ansible.
- Validate the deployment and document the process.

## Architecture

```text
User
 |
 | HTTP
 v
Public EC2 instance
  - Ubuntu
  - Docker Engine / Docker Compose
  - PrestaShop container
          |
          | MariaDB TCP 3306
          v
Private Amazon RDS MariaDB
```

Terraform provisions a VPC with a public subnet for EC2 and private subnets for RDS, along with routing, security groups, the EC2 instance, and RDS resources. The RDS security group allows database traffic from the EC2 security group rather than from the public internet.

## Technology Stack

- **AWS:** VPC, subnets, route tables, Internet Gateway, EC2, Amazon RDS
- **Infrastructure as Code:** Terraform
- **Configuration management:** Ansible
- **Containers:** Docker and Docker Compose
- **Application:** PrestaShop
- **Database:** MariaDB

## Repository Structure

```text
prestashop-terraform-ansible-deployment/
├── terraform/
│   ├── backend.tf
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── terraform.tfvars
│   └── modules/
│       ├── vpc/
│       ├── ec2/
│       └── rds/
├── ansible/
│   ├── inventory.ini
│   ├── prestashop.yml
│   └── templates/
│       └── docker-compose.yml.j2
├── screenshots/
└── .gitignore
```

### Configure Terraform Variables

Copy the example file and update it with your environment-specific values:

```bash
cp terraform/terraform.tfvars.example terraform/terraform.tfvars

File names may differ if the project has been updated; use the actual repository contents as the source of truth.

## Deployment Workflow

1. Configure AWS credentials and the required Terraform variables.
2. Initialize Terraform and validate the configuration.
3. Review the execution plan and provision the infrastructure.
4. Configure the Ansible inventory with the EC2 host and required connection details.
5. Run the Ansible playbook to install/configure Docker and deploy PrestaShop using Docker Compose.
6. Open the EC2 public address in a browser and complete the PrestaShop setup.
7. Verify the storefront and Back Office, and confirm that the container is running.

### Terraform commands

Run these commands from the project root, assuming the Terraform configuration is in `terraform/`:

```bash
terraform -chdir=terraform init
terraform -chdir=terraform validate
terraform -chdir=terraform plan
terraform -chdir=terraform apply
```

Review the plan before applying. Supply required variables through the approved local configuration or command-line prompts. Do not commit real credentials or secret variable files.

### Ansible commands

Check connectivity and syntax before deployment:

```bash
ansible -i ansible/inventory.ini prestashop --list-hosts
ansible-playbook -i ansible/inventory.ini --syntax-check ansible/prestashop.yml
ansible -i ansible/inventory.ini prestashop -m ping --ask-vault-pass
ansible-playbook -i ansible/inventory.ini ansible/prestashop.yml --ask-vault-pass
```

Use `--ask-vault-pass` only if the playbook or its variables are encrypted with Ansible Vault. Ensure the inventory group name matches the group referenced by the playbook.

## Validation

The deployment was tested with the following checks:

- Ansible inventory and connectivity checks completed successfully.
- The PrestaShop Docker container was running.
- The PrestaShop storefront and Back Office loaded successfully.
- The installer directory was removed after installation.
- The application continued working after the container was restarted.

Add screenshots in the `screenshots/` directory showing the EC2 instance, running PrestaShop storefront/Back Office, and relevant successful validation output.

## Security Considerations

- The RDS database was deployed in private subnets and was not publicly accessible.
- The RDS security group allowed MariaDB traffic only from the EC2 security group.
- SSH access was restricted to an approved source IP in the deployed configuration.
- Credentials and private keys must be kept out of source control. Use Ansible Vault or another secret-management method for sensitive values.
- This test deployment used HTTP and did not configure HTTPS. Add TLS and harden administrative access before any production use.
- The database connection was configured to permit non-TLS transport to meet the project requirement. For production, use encrypted database connections where possible.

## Cleanup

After validation, review the destroy plan and remove the project resources:

```bash
terraform -chdir=terraform plan -destroy
terraform -chdir=terraform destroy
```

The RDS resource in the tested configuration was set to skip a final snapshot. Therefore, destroying it without first creating a manual snapshot permanently deletes the database contents. Create a snapshot first if the data must be retained.

The S3 bucket used for Terraform remote state is separate from the application infrastructure. Do not delete the bucket or state object when cleaning up this project unless you intentionally want to remove the remote state as well.

## Deliverables

- Terraform configuration and VPC, EC2, and RDS modules.
- Ansible playbook and Docker Compose template.
- Screenshots demonstrating the provisioned VM and running application.
- This README and the accompanying submission documentation.

## Author

**Nifemi-Stephen**

Repository: https://github.com/Nifemi-Stephen/prestashop-terraform-ansible-deployment
