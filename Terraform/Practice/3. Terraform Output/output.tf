provider "aws" {
  region     = "us-west-2"
  access_key = "provide-ur-access-key"
  secret_key = "provide-ur-secret-key"
}


resource "aws_eip" "elasticip" {
  vpc      = true
}

output "eip" {
  value = aws_eip.elasticip
}

resource "aws_s3_bucket" "mys3" {
  bucket = "susa-demo-001"
}

output "mys3bucket" {
  value = aws_s3_bucket.mys3.arn
}
