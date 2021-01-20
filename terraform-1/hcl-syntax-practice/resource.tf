variable "AWS_REGION" {
  type = string
  default = "us-east-1"
}

variable "AMIS" {
  type = map
  default = {
    us-east-1 = "ami-us-east-1"
    us-west-1 = "ami-us-west-1"
  }
}

provider "aws" {

}

resource "aws_instance" "nginx_server" {
  ami = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
}
