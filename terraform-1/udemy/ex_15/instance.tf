# Defining our EC2 instance

resource "aws_instance" "ubuntu-vm" {
  ami               = "ami-061eb2b23f9f8839c"
  instance_type     = "t2.micro"
  key_name          = aws_key_pair.deployer-key.id
  availability_zone = "ap-southeast-1a"
  tags = {
    Name = "ubuntu-vm"
  }
  user_data = "#!/bin/bash\nwget http://swupdate.openvpn.org/as/openvpn-as-2.1.2-Ubuntu14.amd_64.deb\ndpkg -i openvpn-as-2.1.2-Ubuntu14.amd_64.deb"
}
