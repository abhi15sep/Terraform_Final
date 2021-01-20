# Defining our NAT instance

resource "aws_eip" "nat-eip" {
  vpc = true
}

resource "aws_nat_gateway" "nat-gw" {
  allocation_id = aws_eip.nat-eip.id
  subnet_id     = aws_subnet.public-1.id
  depends_on    = ["aws_internet_gateway.igw"]
}

# Route table to send traffic from private subnets to NAT gateway

resource "aws_route_table" "main-private" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gw.id
  }
  tags = {
    Name = "main-private-route-table"
  }
}

# Associating above route table to private subnets

resource "aws_route_table_association" "main-private-route-association-1a" {
  subnet_id      = aws_subnet.private-1.id
  route_table_id = aws_route_table.main-private.id
}

resource "aws_route_table_association" "main-private-route-association-1b" {
  subnet_id      = aws_subnet.private-2.id
  route_table_id = aws_route_table.main-private.id
}

resource "aws_route_table_association" "main-private-route-association-1c" {
  subnet_id      = aws_subnet.private-3.id
  route_table_id = aws_route_table.main-private.id
}
