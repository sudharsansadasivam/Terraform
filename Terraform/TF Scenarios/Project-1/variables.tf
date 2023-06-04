# Define variables
variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "ami" {
  description = "AMI ID"
  default     = "ami-12345678"
}

variable "key_pair" {
  description = "Key pair name"
  default     = "my_key_pair"
}

variable "dynamodb_table_name" {
  description = "Name of the DynamoDB table for Terraform state locking"
}