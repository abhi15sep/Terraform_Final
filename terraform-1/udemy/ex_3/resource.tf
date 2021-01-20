# Defining EC2 instance

resource "aws_instance" "ubuntu-vm" {
  ami           = lookup(var.AMI_ID, var.AWS_REGION)
  instance_type = "t2.micro"
  tags          = {
    Name        = "ubuntu-vm"
  }
}
