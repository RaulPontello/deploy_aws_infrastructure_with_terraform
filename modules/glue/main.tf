resource "aws_glue_job" "this" {
  name     = "${var.prefix}-glue-job"
  role_arn = aws_iam_role.this.arn

  command {
    script_location = "s3://${aws_s3_bucket.this.id}/${local.python_file_name}.py"
    python_version  = "3"
  }

  glue_version     = "3.0"
  number_of_workers = 2
  worker_type      = "G.1X"

  default_arguments = {
    "--continuous-log-logGroup"          = aws_cloudwatch_log_group.this.name
    "--enable-continuous-cloudwatch-log" = "true"
    "--enable-continuous-log-filter"     = "true"
}