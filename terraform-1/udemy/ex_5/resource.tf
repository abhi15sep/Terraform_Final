# Defining resources

resource "aws_key_pair" "deployer" {
  key_name      = "deployer-key"
  public_key    = var.PUBLIC_SSH_KEY
}

resource "aws_instance" "ubuntu-vm-1" {
  ami           = "ami-061eb2b23f9f8839c"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.deployer.id
  tags          = {
    Name        = "ubuntu-vm-1"
  }
}

resource "aws_instance" "ubuntu-vm-2" {
  ami           = "ami-061eb2b23f9f8839c"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.deployer.id
  tags          = {
    Name        = "ubuntu-vm-2"
  }
}
