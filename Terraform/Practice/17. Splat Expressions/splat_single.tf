# Provider AWS
provider "aws" {
  region     = "eu-west-2"
  access_key = "PROVIDE-UR-ACCESS-KEY"
  secret_key = "PROVIDE-UR-SECRET-KEY"
}
resource "aws_iam_user" "lb" {
  name = "iamuser.${count.index}"
  count = 3
  path = "/system/"
}

# Outputs of First ARN 
output "arns" {
  value = aws_iam_user.lb[0].arn
}



#Outputs:

#arns = arn:aws:iam::450488471598:user/system/iamuser.0