provider "aws" {
  region     = "eu-west-1"
  access_key = "AKIAUOTYXBHFGKGGI7OV"
  secret_key = "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"
}

resource "aws_instance" "myec2" {
   ami = "ami-0c3e74fa87d2a4227"
   instance_type = "t2.micro"
}
