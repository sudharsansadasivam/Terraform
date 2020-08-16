provider "aws" {
  region     = "eu-west-2"
  access_key = "provide-access-key"
  secret_key = "provide-secret-key"
}

resource "aws_instance" "myec2" {
   ami = "ami-04122be15033aa7ec"
   instance_type = "t2.micro"
}

