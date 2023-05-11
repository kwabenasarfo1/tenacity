# Tenacity VPC

resource "aws_vpc" "tenacity-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames  = true
  enable_dns_support    = true

  tags = {
    Name = "tenacity-vpc"
  }
}


# Public Subnets

resource "aws_subnet" "Prod-pub-sub1" {
  vpc_id     = aws_vpc.tenacity-vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "eu-west-2a"

  tags = {
    Name = "Prod-pub-sub1"
  }
}


resource "aws_subnet" "Prod-pub-sub2" {
  vpc_id     = aws_vpc.tenacity-vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "eu-west-2b"
  
  tags = {
    Name = "Prod-pub-sub2"
    }
}


# Private Subnets
resource "aws_subnet" "Prod-priv-sub1" {
  vpc_id     = aws_vpc.tenacity-vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "eu-west-2c"
  
  tags = {
    Name = "Prod-priv-sub1"
    }
}


resource "aws_subnet" "Prod-priv-sub2" {
  vpc_id     = aws_vpc.tenacity-vpc.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "eu-west-2a"
  
  tags = {
    Name = "Prod-priv-sub1"
    }
}


# Route tables

resource "aws_route_table" "Prod-pub-route-table" {
  vpc_id = aws_vpc.tenacity-vpc.id

  tags = {
    Name = "Prod-pub-route-table"
  }
}


resource "aws_route_table" "Prod-priv-route-table" {
  vpc_id = aws_vpc.tenacity-vpc.id

  tags = {
    Name = "Prod-priv-route-table"
  }
}


# Subnet Associations

resource "aws_route_table_association" "public-route-table-association1" {
  subnet_id      = aws_subnet.Prod-pub-sub1.id
  route_table_id = aws_route_table.Prod-pub-route-table.id
}


resource "aws_route_table_association" "public-route-table-association2" {
  subnet_id      = aws_subnet.Prod-pub-sub2.id
  route_table_id = aws_route_table.Prod-pub-route-table.id
}


resource "aws_route_table_association" "private-route-table-association1" {
  subnet_id      = aws_subnet.Prod-priv-sub1.id
  route_table_id = aws_route_table.Prod-priv-route-table.id
}


resource "aws_route_table_association" "private-route-table-association2" {
  subnet_id      = aws_subnet.Prod-priv-sub2.id
  route_table_id = aws_route_table.Prod-priv-route-table.id
}


# Internet Gateway

resource "aws_internet_gateway" "Prod-igw" {
  vpc_id = aws_vpc.tenacity-vpc.id

  tags = {
    Name = "Prod-igw"
  }
}


# Internet Gateway Association

resource "aws_route" "Prod-igw-association" {
  gateway_id = aws_internet_gateway.Prod-igw.id
  route_table_id = aws_route_table.Prod-pub-route-table.id 
  destination_cidr_block    = "0.0.0.0/0"
}


# Create Elastic IP

resource "aws_eip" "Prod-eip" {
  vpc      = true

  tags = {
    Name = "Prod-eip"
  }
}


# Create Nat Gateway

resource "aws_nat_gateway" "Prod-Nat-gateway" {
  allocation_id = aws_eip.Prod-eip.id
  subnet_id     = aws_subnet.Prod-priv-sub1.id

  tags = {
    Name = "Prod-Nat-gateway"
  }
}


# Nat Gateway association

resource "aws_route" "Prod-Nat-association" {
  route_table_id            = aws_route_table.Prod-priv-route-table.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_nat_gateway.Prod-Nat-gateway.id 
  }