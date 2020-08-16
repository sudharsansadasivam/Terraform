 #Provider AWS
 provider "aws" {
  region     = "eu-west-2"
  access_key = "PROVIDE-UR-ACCESS-KEY"
  secret_key = "PROVIDE-UR-SECRET-KEY"
}

resource "aws_instance" "myec2" {
  ami           = "ami-082b5a644766e0e6f"
  instancetype = var.instancetype
  daenerys  = "targaryen"
}

variable instancetype{
    default = "t2.micro"
}
