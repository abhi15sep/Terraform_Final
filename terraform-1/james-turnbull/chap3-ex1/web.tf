# This file contains definitions for cloud provider and resources that will be used in our infrastructure.

# Defining provider block

provider "aws" {
  region = var.region
}

# Defining AWS VPC

module "vpc_basic" {
  source        = "github.com/inderpal2406/terraform_vpc_module.git?ref=v0.0.1"
  name          = "web"
  cidr          = "10.0.0.0/16"
  public_subnet = "10.0.1.0/24"
}

# Defining AWS EC2 instances

resource "aws_instance" "web" {
  ami                         = var.ami[var.region]
  instance_type               = var.instance_type
  key_name                    = "${aws_key_pair.mykeypair.key_name}"
  subnet_id                   = module.vpc_basic.public_subnet_id
  associate_public_ip_address = true
  user_data                   = file("files/web_bootstrap.sh")
  vpc_security_group_ids      = ["${aws_security_group.web_host_sg.id}"]
  tags = {
    Name = "web-${format("%03d", count.index + 1)}"
  }
  count = 2
}

# Defining AWS ELB

resource "aws_elb" "web" {
  name            = "web-elb"
  subnets         = ["${module.vpc_basic.public_subnet_id}"]
  security_groups = ["${aws_security_group.web_inbound_sg.id}"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  # The instances are registered automatically
  instances = aws_instance.web[*].id
}

# Defining first AWS security group

resource "aws_security_group" "web_inbound_sg" {
  name        = "web_inbound"
  description = "Allow http from anywhere in the world."
  vpc_id      = module.vpc_basic.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8
    to_port     = 8
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Defining second AWS security group

resource "aws_security_group" "web_host_sg" {
  name        = "web_host"
  description = "Allow SSH and HTTP access to web hosts"
  vpc_id      = module.vpc_basic.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP access from the VPC
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [module.vpc_basic.cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8
    to_port     = 8
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "mykeypair" {
  key_name  = "mykeypair"
  public_key = "${file("files/id_rsa.pub")}"
}
