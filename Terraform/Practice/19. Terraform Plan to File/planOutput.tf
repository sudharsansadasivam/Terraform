
provider "aws" {
  region     = "eu-west-2"
  access_key = "PROVIDE-UR-ACCESS-KEY"
  secret_key = "PROVIDE-UR-SECRET-KEY"
}


resource "aws_instance" "myec2" {
   ami = "ami-0a13d44dccf1f5cf6"
   instance_type = "t2.large"
}


# CLI Commands 
# terraform plan -out=demopath
# terraform apply .\backup_infra
