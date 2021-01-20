# Defining our custom subnets in our custom vpc

# Public subnets

resource "aws_subnet" "public-subnet-1a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ap-southeast-1a"
  tags                    = {
    Name                  = "public-subnet-1a"
  }
}

resource "aws_subnet" "public-subnet-1b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ap-southeast-1b"
  tags                    = {
    Name                  = "public-subnet-1b"
  }
}

# Private subnets

resource "aws_subnet" "private-subnet-1a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = false
  availability_zone       = "ap-southeast-1a"
  tags                    = {
    Name                  = "private-subnet-1a"
  }
}

resource "aws_subnet" "private-subnet-1b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = false
  availability_zone       = "ap-southeast-1b"
  tags                    = {
    Name                  = "private-subnet-1b"
  }
}
