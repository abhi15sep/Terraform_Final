# Declaring variables (and assigning default values to few of them which can be overridden in terraform.tfvars file)

variable "ACCESS_KEY_ID" {
  type          = string
}

variable "SECRET_ACCESS_KEY" {
  type          = string
}

variable "AWS_REGION" {
  type          = string
  default       = "ap-southeast-1"
}
