# Defining our EC2 instance

resource "aws_instance" "ubuntu-vm" {
  ami                     = "ami-061eb2b23f9f8839c"
  instance_type           = "t2.micro"
  key_name                = aws_key_pair.deployer-key.id
  iam_instance_profile    = aws_iam_instance_profile.s3-inder-bucket-1993-role-instance-profile.name
  tags                    = {
    Name                  = "ubuntu-vm"
  }
}
