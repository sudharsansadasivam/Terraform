# variable creation without parameters #
#TYPE 1 Command Line Flag#
provider "aws" {
  region     = "eu-west-2"
  access_key = "PROVIDE-UR-ACCESS-KEY"
  secret_key = "PROVIDE-UR-SECRET-KEY"
}

resource "aws_instance" "myec2" {
   ami = "ami-0a13d44dccf1f5cf6"
   instance_type = var.instancetype
}
variable "instancetype"{
  default = "t2.micro"
}

#TYPE 1 Variable Default #

/*
variable "instancetype" {
  default = "t2.micro"
}
*/  


#TYPE 2 Variable terraform.tfvars #


#TYPE 2 File based Variables #
# Create a New file called "terraform.tfvars"   inside terraform folder #
#File based variables overrides the Default# 

#nstancetype= "t2.large"

#variables.tf
/*
variable "instancetype" {}
}
*/  



