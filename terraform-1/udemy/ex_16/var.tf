# Declaring our terraform variables and assigning default values to few of them.
# The default valuse can be overridden in other files or terraform.tfvars file.

variable "ACCESS_KEY_ID" {
  type = string
}

variable "SECRET_ACCESS_KEY" {
  type = string
}

variable "AWS_REGION" {
  type    = string
  default = "ap-southeast-1"
}
