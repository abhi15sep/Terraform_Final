# Defining our resources

resource "aws_key_pair" "deployer" {
  key_name        = "deployer-key"
  public_key      = var.PUBIC_SSH_KEY
}

resource "aws_instance" "ubuntu-vm" {
  ami             = "ami-061eb2b23f9f8839c"
  instance_type   = "t2.micro"
  key_name        = aws_key_pair.deployer.id
  tags            = {
    Name          = "ubuntu-vm"
  }
  provisioner "file" {
    source        = "./install_docker.sh"
    destination   = "/home/ubuntu/install_docker.sh"
  }
  provisioner "remote-exec" {
    inline        = [
      "chmod +x /home/ubuntu/install_docker.sh",
      "/home/ubuntu/install_docker.sh",
    ]
  }
  connection {
    type        = "ssh"
    user        = var.INSTANCE_USERNAME
    private_key = file(var.PATH_TO_PRIVATE_KEY)
    host        = aws_instance.ubuntu-vm.public_ip
  }
}
