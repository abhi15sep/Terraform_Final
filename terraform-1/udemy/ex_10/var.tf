# Declaring variables (and assigning default values to few of them which can be overridden in terraform.tfvars file)

variable "AWS_REGION" {
  type          = string
  default       = "ap-southeast-1"
}
