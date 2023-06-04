# Create VPC
resource "aws_vpc" "example_vpc" {
  cidr_block = "10.0.0.0/16"
}

# Create Internet Gateway
resource "aws_internet_gateway" "example_igw" {
  vpc_id = aws_vpc.example_vpc.id
}

# Create Subnets
resource "aws_subnet" "example_subnet1" {
  vpc_id            = aws_vpc.example_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
}

resource "aws_subnet" "example_subnet2" {
  vpc_id            = aws_vpc.example_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"
}

# Associate Subnets with Internet Gateway
resource "aws_route_table_association" "example_association1" {
  subnet_id      = aws_subnet.example_subnet1.id
  route_table_id = aws_vpc.example_vpc.default_route_table_id
}

resource "aws_route_table_association" "example_association2" {
  subnet_id      = aws_subnet.example_subnet2.id
  route_table_id = aws_vpc.example_vpc.default_route_table_id
}

# Create default route to Internet Gateway
resource "aws_route" "example_route" {
  route_table_id         = aws_vpc.example_vpc.default_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.example_igw.id
}