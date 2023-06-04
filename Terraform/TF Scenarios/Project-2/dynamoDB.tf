# Create DynamoDB table for Terraform state locking
resource "aws_dynamodb_table" "terraform_state_lock_table" {
  name         = "my-test-project-2"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}