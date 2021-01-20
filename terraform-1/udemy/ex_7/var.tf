# Declaring variables (and assigning default values to few of them which can be overridden in terraform.tfvars file)

variable "ACCESS_KEY_ID" {
  type          = string
}

variable "SECRET_ACCESS_KEY" {
  type          = string
}

variable "PUBIC_SSH_KEY" {
  type          = string
}

variable "AWS_REGION" {
  type          = string
  default       = "ap-southeast-1"
}

variable "INSTANCE_USERNAME" {
  type          = string
  default       = "ubuntu"
}

variable "PATH_TO_PRIVATE_KEY" {
  type          = string
  default       = "./id_rsa"
}
