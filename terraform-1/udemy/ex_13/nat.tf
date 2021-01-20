# Defining our NAT gateway to enable communication of EC2 instances in our private subnet with internet

# Defining EIP for our NAT instance

resource "aws_eip" "nat-eip" {
  vpc = true
  tags = {
    Name = "nat-eip"
  }
}

# Defining our NAT gateway

resource "aws_nat_gateway" "nat-gw" {
  subnet_id     = aws_subnet.public-subnet-1a.id
  allocation_id = aws_eip.nat-eip.id
  depends_on    = ["aws_internet_gateway.main-igw"]
  tags = {
    Name = "nat-gw"
  }
}
