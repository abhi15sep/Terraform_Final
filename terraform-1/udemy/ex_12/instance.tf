# Defining our EC2 instance and ssh key pair to ssh to the instance.

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = var.PUBLIC_SSH_KEY
}

resource "aws_instance" "public-vm-1a" {
  ami                    = "ami-061eb2b23f9f8839c"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.deployer.id
  subnet_id              = aws_subnet.public-1.id
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]
  tags = {
    Name = "public-vm-1a"
  }
}
