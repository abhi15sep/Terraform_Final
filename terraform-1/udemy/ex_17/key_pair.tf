# Defining our AWS ssh key pair

resource "aws_key_pair" "deployer-key" {
  key_name   = "deployer-key"
  public_key = var.PUBLIC_SSH_KEY
}
