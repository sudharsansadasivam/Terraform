# Glue Job with Role ARN
resource "aws_glue_job" "gluejob1" {
  name     = "Glue  Job"
  role_arn = aws_iam_role.gluejob.arn

# Glue Job may be a Scala or Python based files
  command {
    script_location = "s3://${var.bucket_name}/scripts/data-quality/dataquality_analyzers_raw.py"
    python_version = 3
  }
  max_retries = 0
  timeout = 60
  glue_version =  "3.0"
  worker_type =  "G.1X"
  number_of_workers = 10

# If we have addtional py or scala files ref parameter --extra-py-files"="s3://${var.bucket_name}/libs/extra.zip"
# If we have addtional jar files --extra-jars"="s3://${var.bucket_name}/libs/extra.jar"
  default_arguments = {
    "--enable-auto-scaling" = true
    "--PAYLOAD"="${var.payload_dataquality_analyzers_raw}"
    
    
  }
}