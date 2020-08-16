# Provider AWS #
  provider "aws" {
  region     = "eu-west-2"
  access_key = "PROVIDE-UR-ACCESS-KEY"
  secret_key = "PROVIDE-UR-SECRET-KEY"
}

# Count and index can be used as a loop in terraform 
# This Example shows Naming convenntions along with Count and index

variable "elb_names"{
    type = list
    default =["dev-loadbalancer","stage-loadbalancer","prod-loadbalancer"]
}

resource aws_iam_user "lb"{
    name = var.elb_names[count.index]
    count = 3
    path = "/system/"
}