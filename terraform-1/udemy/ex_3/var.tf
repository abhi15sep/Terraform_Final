# Declaring variables

variable "ACCESS_KEY_ID" {
  type    = string
}

variable "SECRET_ACCESS_KEY" {
  type    = string
}

variable "AWS_REGION" {
  type    = string
  default = "ap-southeast-1"
}

variable "AMI_ID" {
  type    = map(string)
  default = {
    ap-southeast-1  = "ami-061eb2b23f9f8839c"
    ap-east-1       = "ami-e3651f92"
    us-east-1       = "ami-0af70d1854ea36f96"
    us-west-1       = "ami-0ddeb4d4a8fea8be7"
  }
}
