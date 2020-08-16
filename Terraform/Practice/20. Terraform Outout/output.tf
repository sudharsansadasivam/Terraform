 provider "aws" {
  region     = "eu-west-2"
  access_key = "PROVIDE-UR-ACCESS-KEY"
  secret_key = "PROVIDE-UR-SECRET-KEY"
}

resource "aws_iam_user" "lb"{
    name =  "iamuser.${count.index}"
    count = 3
    path = "/system/"
}

# splat expressions and output
output "iam_names"{
    value =aws_iam_user.lb[*].name
}
output "iam_arn"{
    value =aws_iam_user.lb[*].arn
}

# CLI Commands 
# terraform plan -out=demopath
# terraform apply .\backup_infra
