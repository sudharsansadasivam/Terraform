variable  "read_capacity_units" {
   description = "Desired No of servers in App target"
   default = "1"
}

variable  "partition_key" {
   description = "Primary partition key for Dynamo DB Table"
   default = "Test-Primary"
}

variable  "range_key" {
 description = "Primary sort key for Dynamo DB Table"
   default = "Test-range"
}

variable  "stack_id" {
   description = "stack_id for tag"
   default = "Test-Dynamo-sourcess"
}

