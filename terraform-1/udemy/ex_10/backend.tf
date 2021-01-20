# Defining S3 backend to store terraform state.

terraform {
  backend "s3" {
    bucket    = "inder-terraform-state"
    key       = "udemy/ex_10"
    region    = "ap-southeast-1"
  }
}
