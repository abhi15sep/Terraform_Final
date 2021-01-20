# Defining variables for our terraform configuration

# The var.access_key and var.secret_key have already been defined using AWS CLI.

variable "region" {
  type        = string
  description = "To hold the AWS region name."
}

#variable "key_name" {
#  type        = string
#  description = "The ssh key pair to get ssh access to resources."
#}

variable "ami" {
  type        = map(string)
  description = "A map of AMIs"
}

variable "instance_type" {
  type        = string
  description = "To hold AWS instance type."
  default     = "t2.micro"
}
