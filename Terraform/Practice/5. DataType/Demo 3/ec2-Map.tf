# Provider AWS #
 provider "aws" {
  region     = "eu-west-2"
  access_key = "PROVIDE-UR-ACCESS-KEY"
  secret_key = "PROVIDE-UR-SECRET-KEY"
}

# EC2 Instance Resource Creation in eu-west-2 #
resource "aws_instance" "myec2" {
   ami = "ami-0a13d44dccf1f5cf6"
   #instance_type = var.list
   instance_type = var.map["us-west-2"]
}

# Map type Variables
#Basically Key Value Pair
variable "map"{
  type = map
  default = {
    us-east-1 = "t2.micro"
    us-west-2 = "t2.medium"
    ap-southeast-1 = "t2.small"
  }
}



