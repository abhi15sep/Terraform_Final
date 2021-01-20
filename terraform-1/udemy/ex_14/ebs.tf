# Defining our EBS volume

resource "aws_ebs_volume" "ubuntu-vm-ebs-1" {
  availability_zone         = "ap-southeast-1a"
  size                      = "10"
  type                      = "gp2"
  tags                      = {
    Name                    = "ubuntu-vm-ebs-1"
  }
}
