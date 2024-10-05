# Custom VPC creation (only created if create_custom_vpc is true)

resource "aws_vpc" "custom_vpc" {
  count                = var.create_custom_vpc ? 1 : 0
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags                 = {Name = "${var.prefix}-vpc-${var.suffix}"}
}

# Dynamic creation of subnets in different availability zones

resource "aws_subnet" "custom_vpc_subnets" {
  count                   = var.create_custom_vpc ? length(var.availability_zones) : 0
  vpc_id                  = aws_vpc.custom_vpc[0].id
  cidr_block              = cidrsubnet(aws_vpc.custom_vpc[0].cidr_block, 8, count.index + 1)
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.prefix}-custom-vpc-subnet-${count.index + 1}-${var.suffix}"
  }
}

# DB Subnet Group (uses subnets created above)

resource "aws_db_subnet_group" "this" {
  count      = var.create_custom_vpc ? 1 : 0
  name       = "${var.prefix}-vpc-subnet-group-${var.suffix}"
  subnet_ids = aws_subnet.custom_vpc_subnets[*].id

  tags = {
    Name = "${var.prefix}-db-subnet-group-${var.suffix}"
  }
}

# Internet Gateway

resource "aws_internet_gateway" "this" {
  count  = var.create_custom_vpc ? 1 : 0
  vpc_id = aws_vpc.custom_vpc[0].id

  tags = {
    Name = "${var.prefix}-vpc-internet-gateway-${var.suffix}"
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
    Name = "${var.prefix}-vpc-route-table-${var.suffix}"
  }
}

# Associate subnets with the route table

resource "aws_route_table_association" "route_table_associations" {
  count          = var.create_custom_vpc ? length(aws_subnet.custom_vpc_subnets) : 0
  subnet_id      = aws_subnet.custom_vpc_subnets[count.index].id
  route_table_id = aws_route_table.this[0].id
}