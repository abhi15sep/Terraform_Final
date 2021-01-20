# Defining our resources

resource "aws_key_pair" "deployer" {
  key_name        = "deployer-key"
  public_key      = var.PUBLIC_SSH_KEY
}

resource "aws_instance" "ubuntu-vm" {
  ami             = "ami-061eb2b23f9f8839c"
  instance_type   = "t2.micro"
  key_name        = aws_key_pair.deployer.id
  tags            = {
    Name          = "ubuntu-vm"
  }
  provisioner "file" {
    source        = "./upload.txt"
    destination   = "/home/ubuntu/"       # the file was upoaded but it's name was changed to ubuntu. We can mention it's name here. Read about / in provisioner block in terraform.
    connection {
      type        = "ssh"
      user        = var.INSTANCE_USERNAME
      private_key = file(var.PATH_TO_PVT_KEY)
      host        = aws_instance.ubuntu-vm.public_ip
    }
  }
}
