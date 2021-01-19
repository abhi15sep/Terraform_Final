# Create a key-pair

resource "aws_key_pair" "ssh-key" {
  key_name   = "ssh-key"
  public_key = "INSERT-PUBLIC-KEY"
}