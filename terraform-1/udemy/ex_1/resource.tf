# We are defining a single EC2 instance in this file.
# AMI can be selected from `https://cloud-images.ubuntu.com/locator/ec2/`
# This is an Ubuntu VM in ap-southeast-1 (Singapore) region which is hvm based with ebs-ssd storage and t2.micro machine.

resource "aws_instance" "ubuntu-vm" {
  ami           = "ami-061eb2b23f9f8839c"
  instance_type = "t2.micro"
}
