# Defining AWS provider

provider "aws" {
  region      = "ap-southeast-1"
  access_key  = var.ACCESS_KEY_ID
  secret_key  = var.SECRET_ACCESS_KEY
}
