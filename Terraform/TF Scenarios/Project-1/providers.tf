provider "aws" {
  region     = "us-east-1"
  access_key = "YOUR_ACCESS_KEY"
  secret_key = "YOUR_SECRET_KEY"
}

# Configure Terraform backend to use S3 and DynamoDB
terraform {
  backend "s3" {
    bucket         = "terraform-state-lock-table-june23"
    key            = "remotes/terraform/terraform.tfstate"
    encrypt        = true
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock-table-june23"
  }
}