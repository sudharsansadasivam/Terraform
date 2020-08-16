# Provider AWS #
 provider "aws" {
  region     = "eu-west-2"
  access_key = "PROVIDE-UR-ACCESS-KEY"
  secret_key = "PROVIDE-UR-SECRET-KEY"
}

# Count and index can be used as a loop in terraform 
resource aws_iam_user "lb"{
    name = "loadbalancer.${count.index}"
    count = 5
    path = "/system/"
}