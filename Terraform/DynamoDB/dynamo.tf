resource "aws_dynamodb_table" "dynamodb-table" {
  name           = "TestDynamo_sourcess"
  read_capacity  = "${var.read_capacity_units}"
  write_capacity = "${var.read_capacity_units}"
  hash_key       = "${var.partition_key}"
  range_key      = "${var.range_key}"
  attribute {
    name = "${var.partition_key}"
    type = "N"
  }
  attribute {
    name = "${var.range_key}"
    type = "N"
  }
  tags = {
    StackId        = "${var.stack_id}"
  }
}
