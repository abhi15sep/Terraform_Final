# Defining our resources

resource "aws_instance" "ubuntu-vm" {
  ami             = "ami-061eb2b23f9f8839c"
  instance_type   = "t2.micro"
  tags            = {
    Name          = "ubuntu-vm"
  }
  provisioner "local-exec" {
    command       = "echo ${aws_instance.ubuntu-vm.private_ip} >> private_ip.txt"
  }
}

output "public_ip" {
  value           = aws_instance.ubuntu-vm.public_ip
}
