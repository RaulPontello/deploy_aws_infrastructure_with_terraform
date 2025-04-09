# Custom VPC creation (only created if create_custom_vpc is true)

resource "aws_vpc" "custom_vpc" {
  count                = var.create_custom_vpc ? 1 : 0
  cidr_block           = "10.0.0.0/24"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "${var.prefix}-custom-vpc"
  }
}

# Create public and private subnets

resource "aws_subnet" "public_subnets" {
  count                   = var.create_custom_vpc ? length(var.availability_zones) : 0
  vpc_id                  = aws_vpc.custom_vpc[0].id
  cidr_block              = cidrsubnet(aws_vpc.custom_vpc[0].cidr_block, 4, count.index)
  availability_zone       = var.availability_zones[count.index]
  tags = {
    Name = "${var.prefix}-custom-vpc-public-subnet-${count.index}"
  }
}

resource "aws_subnet" "private_subnets" {
  count                   = var.create_custom_vpc ? length(var.availability_zones) : 0
  vpc_id                  = aws_vpc.custom_vpc[0].id
  cidr_block              = cidrsubnet(aws_vpc.custom_vpc[0].cidr_block, 4, count.index + 10)
  availability_zone       = var.availability_zones[count.index]
  tags = {
    Name = "${var.prefix}-custom-vpc-private-subnet-${count.index}"
  }
}

# DB Subnet Group (uses subnets created above)

resource "aws_db_subnet_group" "this" {
  count      = var.create_custom_vpc ? 1 : 0
  name       = "${var.prefix}-vpc-subnet-group"
  subnet_ids = var.use_public_subnet ? aws_subnet.public_subnets[*].id : aws_subnet.private_subnets[*].id
}

# Internet Gateway

resource "aws_internet_gateway" "this" {
  count  = var.create_custom_vpc ? 1 : 0
  vpc_id = aws_vpc.custom_vpc[0].id
  tags = {
    Name = "${var.prefix}-custom-vpc-internet-gateway"
  }
}

# Route Table

resource "aws_route_table" "this" {
  count  = var.create_custom_vpc ? 1 : 0
  vpc_id = aws_vpc.custom_vpc[0].id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this[0].id
  }
  tags = {
    Name = "${var.prefix}-custom-vpc-route-table"
  }
}

# Associate subnets with the route table

resource "aws_route_table_association" "route_table_associations" {
  count          = var.create_custom_vpc ? 1 : 0
  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.this[0].id
}