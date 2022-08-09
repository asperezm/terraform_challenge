variable "aws_user_access_key" {}
variable "aws_user_secret_key" {}
variable "project_name" {}

provider "aws" {
  region = "us-east-1"
  access_key = var.aws_user_access_key
  secret_key = var.aws_user_secret_key
}
resource "aws_vpc" "vpc" {
  cidr_block           = "10.99.0.0/18"
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true
  enable_classiclink   = false

  tags = {
    Name = "vpc"
  }
}

resource "aws_subnet" "public_1" {
  availability_zone       = "us-east-1a"
  vpc_id                  = aws_vpc.vpc.id
  map_public_ip_on_launch = true
  cidr_block              = "10.99.0.0/24"

  tags = {
    Name = "public_1"
  }
}

resource "aws_subnet" "public_2" {
  availability_zone       = "us-east-1b"
  vpc_id                  = aws_vpc.vpc.id
  map_public_ip_on_launch = true
  cidr_block              = "10.99.1.0/24"

  tags = {
    Name = "public_2"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "internet-gateway"
  }
}

resource "aws_route_table" "route-public" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "public-route-table"
  }
}

resource "aws_route_table_association" "public_1" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.route-public.id
}

resource "aws_route_table_association" "public_2" {
  subnet_id      = aws_subnet.public_2.id
  route_table_id = aws_route_table.route-public.id
}