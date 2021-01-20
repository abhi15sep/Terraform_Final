# Defining our aws key-pair resource to ssh into our EC2 instances through custom ssh keys

resource "aws_key_pair" "deployer-key" {
  key_name   = "deployer-key"
  public_key = var.PUBLIC_SSH_KEY
}
