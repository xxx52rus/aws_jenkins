resource "aws_vpc" "jenkins" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"

  tags = {
    Name = "Jenkins VPC"
  }
}

resource "aws_internet_gateway" "default" {
  vpc_id = aws_vpc.jenkins.id
}

resource "aws_subnet" "jenkins_public" {

  vpc_id                  = aws_vpc.jenkins.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name = "Jenkins public subnet"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.jenkins.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.default.id
  }

  tags = {
    Name = "Jenkins public subnet route"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.jenkins_public.id
  route_table_id = aws_route_table.public.id
}