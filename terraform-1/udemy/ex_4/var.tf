# Declaring variables

variable "ACCESS_KEY_ID" {
  type  = string
}

variable "SECRET_ACCESS_KEY" {
  type  = string
}

variable "AWS_REGION" {
  type  = string
  default = "ap-southeast-1"
}

variable "PUBLIC_SSH_KEY" {
  type  = string
}
