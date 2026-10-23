terraform {
  backend "s3" {
    bucket       = "prod-ready-app-tfstate"
    key          = "prestashop-deployment/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}
