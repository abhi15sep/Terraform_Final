# Outputting public IP addressof our AWS EC2 instance

output "public_ip" {
  value = aws_instance.ubuntu-vm.public_ip
}
