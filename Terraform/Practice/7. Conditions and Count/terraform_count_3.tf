# Provider AWS #
provider "aws" {
  region     = "eu-west-2"
  access_key = "PROVIDE-UR-ACCESS-KEY"
  secret_key = "PROVIDE-UR-SECRET-KEY"
}

variable "istest"{}

# EC2 Instance Resource Creation in eu-west-2 #
resource "aws_instance" "dev" {
   ami = "ami-0a13d44dccf1f5cf6"
   instance_type = "t2.micro"
   count = var.istest == true ? 3 : 0
}

# EC2 Instance Resource Creation in eu-west-2 #
resource "aws_instance" "prod" {
   ami = "ami-0a13d44dccf1f5cf6"
   instance_type = "m5.large"
   count = var.istest == false ? 1 : 0
}