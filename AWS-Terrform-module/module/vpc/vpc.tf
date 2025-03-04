resource "aws_vpc" "module_vpc" {
  cidr_block = var.cidr_block
  instance_tenancy = var.instance_tenancy
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name = "module_vpc"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.module_vpc.id
  count = 3
  availability_zone = var.availability_zone[count.index]
  cidr_block = var.public_subnet_cidr[count.index]
  # for_each = toset(var.public_subnet_cidr)
  # cidr_block = each.value
  tags = {
    Name = "public_subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.module_vpc.id
  count = 3
  availability_zone = var.availability_zone[count.index]
  cidr_block = var.private_cidr_block[count.index]
  # for_each = toset(var.private_cidr_block)
  # cidr_block = each.value
  tags = {
    Name = "private_subnet"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.module_vpc.id
  route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id 
    }
  tags = {
    Name = "public_rt"
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.module_vpc.id
  tags = {
    Name = "private_rt"
  }
  route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.ngw.id 
    }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.module_vpc.id
  tags = {
    Name = "igw"
  }
}

resource "aws_route_table_association" "public_rt_association" {
  count            = 3
  route_table_id   = aws_route_table.public_rt.id
  subnet_id        = aws_subnet.public_subnet[count.index].id
}

resource "aws_route_table_association" "private_rt_association" {
  count            = 3
  route_table_id   = aws_route_table.private_rt.id
  subnet_id        = aws_subnet.private_subnet[count.index].id
}

resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_subnet[0].id
}

resource "aws_eip" "nat" {
  domain = "vpc"
}

