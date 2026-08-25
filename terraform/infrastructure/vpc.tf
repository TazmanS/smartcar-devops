resource "aws_vpc" "smartcar" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "smartcar-vpc"
  }
}

resource "aws_subnet" "control_plane" {
  vpc_id                  = aws_vpc.smartcar.id
  cidr_block              = var.control_plane_subnet_cidr
  availability_zone       = var.control_plane_availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name = "smartcar-control-plane-subnet"
  }
}

resource "aws_subnet" "worker" {
  vpc_id                  = aws_vpc.smartcar.id
  cidr_block              = var.worker_subnet_cidr
  availability_zone       = var.worker_availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name = "smartcar-worker-subnet"
  }
}

resource "aws_internet_gateway" "smartcar" {
  vpc_id = aws_vpc.smartcar.id

  tags = {
    Name = "smartcar-internet-gateway"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.smartcar.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.smartcar.id
  }

  tags = {
    Name = "smartcar-public-route-table"
  }
}

resource "aws_route_table_association" "control_plane" {
  subnet_id      = aws_subnet.control_plane.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "worker" {
  subnet_id      = aws_subnet.worker.id
  route_table_id = aws_route_table.public.id
}
