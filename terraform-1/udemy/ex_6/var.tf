# Declaring variables and assigning few of them

variable "ACCESS_KEY_ID" {
  type      = string
}

variable "SECRET_ACCESS_KEY" {
  type      = string
}

variable "PUBLIC_SSH_KEY" {
  type      = string
}

variable "AWS_REGION" {
  type      = string
  default   = "ap-southeast-1"
}

variable "PATH_TO_PVT_KEY" {
  type      = string
  default   = "./id_rsa"
}

variable "INSTANCE_USERNAME" {
  type      = string
  default   = "ubuntu"
}
