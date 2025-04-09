# Create Glue Job

resource "aws_glue_job" "this" {
  name     = "${var.prefix}-glue-job"
  role_arn = aws_iam_role.this.arn

  command {
    script_location = "s3://${aws_s3_bucket.this.id}/${local.python_file_name}.py"
    python_version  = "3"
  }

  glue_version      = var.glue_version
  number_of_workers = var.number_of_workers
  worker_type       = var.worker_type

  default_arguments = {
    "--continuous-log-logGroup"          = aws_cloudwatch_log_group.this.name
    "--enable-continuous-cloudwatch-log" = "true"
    "--enable-continuous-log-filter"     = "true"
    "--enable-metrics"                   = "true"
    "--enable-job-insights"              = "true"
    "--job-language"                     = "python"
    "--secret_name"                      = var.secret_name
    "--aws_region"                       = var.aws_region
    "--database_name"                    = var.database_name
    "--database_host"                    = var.database_host
}
}