# Provider AWS #
 provider "aws" {
  region     = "eu-west-2"
  access_key = "PROVIDE-UR-ACCESS-KEY"
  secret_key = "PROVIDE-UR-SECRET-KEY"
}

# EC2 Instance Resource Creation in eu-west-2 #
resource "aws_instance" "myec2" {
   ami = "ami-0a13d44dccf1f5cf6"
   instance_type = var.instancetype
   instance_name = var.instance_name
}
variable "instancetype"{}

variable "instance_name"{
    type = number
}



