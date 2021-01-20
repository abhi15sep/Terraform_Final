# Defining our EC2 resource

resource "aws_instance" "ubuntu_vm_1" {
    ami                         = "ami-061eb2b23f9f8839c"
    instance_type               = "t2.micro"
    disable_api_termination     = true                      # by default false
    source_dest_check           = false                     # by default true
    tags                        = {
      Name                      = "ubuntu_vm_1"
    }
}

resource "aws_instance" "ubuntu_vm_2" {
  ami                           = "ami-061eb2b23f9f8839c"
  instance_type                 = "t2.micro"
  tags                          = {
    Name                        = "ubuntu_vm_2"
  }
}
