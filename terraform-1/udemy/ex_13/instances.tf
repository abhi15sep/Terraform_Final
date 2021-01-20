# Defining our EC2 instances

# Public instances

resource "aws_instance" "public-vm-1a" {
  ami                       = "ami-061eb2b23f9f8839c"
  instance_type             = "t2.micro"
  key_name                  = aws_key_pair.deployer-key.id
  subnet_id                 = aws_subnet.public-subnet-1a.id
  vpc_security_group_ids    = [aws_security_group.allow-ssh-sg.id]
  tags                      = {
    Name                    = "public-vm-1a"
  }
  provisioner "local-exec" {
    command                 = "echo ${aws_instance.public-vm-1a.public_ip} >> public_ip.list"
  }
}

resource "aws_instance" "public-vm-1b" {
  ami                       = "ami-061eb2b23f9f8839c"
  instance_type             = "t2.micro"
  key_name                  = aws_key_pair.deployer-key.id
  subnet_id                 = aws_subnet.public-subnet-1b.id
  vpc_security_group_ids    = [aws_security_group.allow-ssh-sg.id]
  tags                      = {
    Name                    = "public-vm-1b"
  }
  provisioner "local-exec" {
    command                 = "echo ${aws_instance.public-vm-1b.public_ip} >> public_ip.list"
  }
}

# Private instances

resource "aws_instance" "private-vm-1a" {
  ami                       = "ami-061eb2b23f9f8839c"
  instance_type             = "t2.micro"
  key_name                  = aws_key_pair.deployer-key.id
  subnet_id                 = aws_subnet.private-subnet-1a.id
  vpc_security_group_ids    = [aws_security_group.allow-ssh-sg.id]
  tags                      = {
    Name                    = "private-vm-1a"
  }
  provisioner "local-exec" {
    command                 = "echo ${aws_instance.private-vm-1a.private_ip} >> private_ip.list"
  }
}

resource "aws_instance" "private-vm-1b" {
  ami                       = "ami-061eb2b23f9f8839c"
  instance_type             = "t2.micro"
  key_name                  = aws_key_pair.deployer-key.id
  subnet_id                 = aws_subnet.private-subnet-1b.id
  vpc_security_group_ids    = [aws_security_group.allow-ssh-sg.id]
  tags                      = {
    Name                    = "private-vm-1b"
  }
  provisioner "local-exec" {
    command                 = "echo ${aws_instance.private-vm-1b.private_ip} >> private_ip.list"
  }
}
