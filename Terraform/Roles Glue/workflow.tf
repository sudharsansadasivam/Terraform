# Glue Workflow for the example job trigger
resource "aws_glue_workflow" "examplewf" {
  name = "Glue Workflow"
}

# Scheduled Trigger can be used to trigger cron based ETL jobs 
resource "aws_glue_trigger" "examplegt" {
  name     = "Glue Trigger"
  schedule = "cron(15 12 * * ? *)"
  type     = "SCHEDULED"

  actions {
    job_name = aws_glue_job.gluejob.name
  }
}


/*
resource "aws_glue_trigger" "example-inner" {
  name          = "trigger-inner"
  type          = "CONDITIONAL"
  workflow_name = aws_glue_workflow.example.name

  predicate {
    conditions {
      job_name = "example-job"
      state    = "SUCCEEDED"
    }
  }

  actions {
    job_name = "another-example-job"
  }
}
*/