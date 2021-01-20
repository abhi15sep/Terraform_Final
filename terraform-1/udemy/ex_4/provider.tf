# Defining AWS Provider

provider "aws" {
  region      = var.AWS_REGION
  access_key  = var.ACCESS_KEY_ID
  secret_key  = var.SECRET_ACCESS_KEY
}
