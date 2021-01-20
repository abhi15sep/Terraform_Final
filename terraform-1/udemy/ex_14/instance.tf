# Defining our EC2 instance

resource "aws_instance" "ubuntu-vm" {
  ami                 = "ami-061eb2b23f9f8839c"
  instance_type       = "t2.micro"
  key_name            = aws_key_pair.deployer-key.id
  availability_zone   = "ap-southeast-1a"
  tags                = {
    Name              = "ubuntu-vm"
  }
}


# Associating our EBS volume to our EC2 instance

resource "aws_volume_attachment" "ubuntu-vm-ebs-1-attachment" {
  device_name         = "/dev/xvdh"
  instance_id         = aws_instance.ubuntu-vm.id
  volume_id           = aws_ebs_volume.ubuntu-vm-ebs-1.id
  force_detach        = true   # Since the ebs volume didnt' detach on terraform destroy, force_detach can lead to data loss
}
