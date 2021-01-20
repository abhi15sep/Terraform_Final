# Defining our resources

resource "aws_instance" "ubuntu-vm" {
  ami             = "ami-061eb2b23f9f8839c"
  instance_type   = "t2.micro"
  tags            = {
    Name          = "ubuntu-vm"
  }
}

output "public_ip" {
  value           = aws_instance.ubuntu-vm.public_ip
}

output "public_dns" {
  value           = aws_instance.ubuntu-vm.public_dns
}

output "private_ip" {
  value           = aws_instance.ubuntu-vm.private_ip
}

output "private_dns" {
  value           = aws_instance.ubuntu-vm.private_dns
}

output "availability_zone" {
  value           = aws_instance.ubuntu-vm.availability_zone
}

output "amazon_resource_name" {
  value           = aws_instance.ubuntu-vm.arn
}

output "instance_id" {
  value           = aws_instance.ubuntu-vm.id
}
