# Provider AWS #

provider "aws" {
  region     = "eu-west-2"
  access_key = "PROVIDE-UR-ACCESS-KEY"
  secret_key = "PROVIDE-UR-SECRET-KEY"
}

locals{
    common_tags = {
        Owner = "Devops-Team"
        service = "backend"
    }
}

# EC2 Instance Resource Creation in eu-west-2 #
resource "aws_instance" "app-dev" {
   ami = "ami-0a13d44dccf1f5cf6"
   instance_type = "t2.micro"
   tags = local.common_tags

}

# EC2 Instance Resource Creation in eu-west-2 #
resource "aws_instance" "db-dev" {
   ami = "ami-0a13d44dccf1f5cf6"
   instance_type = "m5.large"
   tags = local.common_tags
}

#ebs volumes 
resource "aws_ebs_volume" "db_ebs"{
    availability_zone = "us-east-2a"
    size              = 8
    tags = local.common_tags
}
