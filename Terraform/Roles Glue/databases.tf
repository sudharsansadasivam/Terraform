resource "aws_glue_catalog_database" "glue_database_raw_data" {
  name = "raw-data"
}

resource "aws_glue_catalog_database" "glue_database_processed_data" {
  name = "processed-data"
}