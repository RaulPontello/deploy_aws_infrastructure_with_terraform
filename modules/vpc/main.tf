resource "aws_vpc" "custom_vpc" {
  count                = var.create_vpc ? 1 : 0
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags                 = {Name = "${var.suffix}-vpc"}
}

data "aws_vpc" "default_vpc" {
  count   = var.create_vpc ? 0 : 1
  default = true
}

resource "aws_subnet" "customn_vpc_subnet_1" {
  count                   = var.create_vpc ? 1 : 0
  vpc_id                  = aws_vpc.custom_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags                    = {Name = "${var.suffix}-customn-vpc-subnet-1"}
}

resource "aws_subnet" "customn_vpc_subnet_2" {
  count                   = var.create_vpc ? 1 : 0
  vpc_id                  = aws_vpc.custom_vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true
  tags                    = {Name = "${var.suffix}-customn-vpc-subnet-2"}
}

resource "aws_db_subnet_group" "this" {
  name       = "${var.suffix}-vpc-subnet-group"
  subnet_ids = var.create_vpc ? ["${aws_subnet.customn_vpc_subnet_1.id}", "${aws_subnet.customn_vpc_subnet_2.id}"] : data.aws_vpc.default_vpc.id
}

resource "aws_internet_gateway" "this" {
  count  = var.create_vpc ? 1 : 0
  vpc_id = aws_vpc.custom_vpc.id
  tags   = {Name = "${var.suffix}-vpc-internet-gateway"}
}

resource "aws_route_table" "this" {
  count  = var.create_vpc ? 1 : 0
  vpc_id = aws_vpc.custom_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }
  tags   = {Name = "${var.suffix}-vpc-route-table"}
}

resource "aws_route_table_association" "route_table_association_1" {
  count          = var.create_vpc ? 1 : 0
  subnet_id      = aws_subnet.vpc_subnet_1.id
  route_table_id = aws_route_table.this.id
}

resource "aws_route_table_association" "route_table_association_2" {
  count          = var.create_vpc ? 1 : 0
  subnet_id      = aws_subnet.vpc_subnet_2.id
  route_table_id = aws_route_table.this.id
}