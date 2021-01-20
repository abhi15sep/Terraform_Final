# Define output public IP address of our EC2 instance_type

output "public_ip" {
  value = aws_instance.ubuntu-vm.public_ip
}
