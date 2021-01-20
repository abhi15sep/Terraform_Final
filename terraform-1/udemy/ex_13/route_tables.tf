# Defining our route tables for public and private subnets and their associations with respective public/private subnets

# Public route table

resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main-igw.id
  }
  tags = {
    Name = "public-route-table"
  }
}

# Private route table

resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gw.id
  }
  tags = {
    Name = "private-route-table"
  }
}


# Route table associations

# Associating public route table with public subnets

resource "aws_route_table_association" "route_association-public-subnet-1a" {
  subnet_id      = aws_subnet.public-subnet-1a.id
  route_table_id = aws_route_table.public-route-table.id
}

resource "aws_route_table_association" "route_association-public-subnet-1b" {
  subnet_id      = aws_subnet.public-subnet-1b.id
  route_table_id = aws_route_table.public-route-table.id
}

# Associatingprivate route table with private subnets

resource "aws_route_table_association" "route_association-private-subnet-1a" {
  subnet_id      = aws_subnet.private-subnet-1a.id
  route_table_id = aws_route_table.private-route-table.id
}

resource "aws_route_table_association" "route_association-private-subnet-1b" {
  subnet_id      = aws_subnet.private-subnet-1b.id
  route_table_id = aws_route_table.private-route-table.id
}
