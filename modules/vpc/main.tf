data "aws_availability_zones" "available" {
    state = "available"
}

resource "aws_vpc" "vpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_support = true
    enable_dns_hostnames = true

    tags = {
      Name = "${var.project_name}-vpc"
    }
}

resource "aws_internet_gateway" "gateway" {
    vpc_id = aws_vpc.vpc.id

    tags = {
      Name = "${var.project_name}-igw"
    }
}

resource "aws_subnet" "subnets" {
  for_each = var.public_subnet_cidrs

  vpc_id = aws_vpc.vpc.id
  cidr_block = each.value.cidr_blocks
  availability_zone = data.aws_availability_zones.available.names[index(keys(var.public_subnet_cidrs), each.key) % length(data.aws_availability_zones.available.names)]
  map_public_ip_on_launch = true

  tags = {
      Name = "${var.project_name}-subnet"
    }
}

resource "aws_route_table" "route_table" {
    vpc_id = aws_vpc.vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.gateway.id
    }

    tags = {
      Name = "${var.project_name}-rt"
    }
}

resource "aws_route_table_association" "aws_route_table_association" {
    for_each = aws_subnet.subnets

    subnet_id = each.value.id
    route_table_id = aws_route_table.route_table.id
}