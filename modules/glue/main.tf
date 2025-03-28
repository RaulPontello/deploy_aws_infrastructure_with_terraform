resource "aws_glue_job" "this" {
  name     = "${var.prefix}-glue-job"
  role_arn = aws_iam_role.glue_role.arn

  command {
    script_location = "s3://${aws_s3_bucket.this.id}/${local.python_file_name}.py"
    python_version  = "3"
  }

  max_retries      = 1
  timeout          = 10
  glue_version     = "3.0"
  number_of_workers = 2
  worker_type      = "G.1X"
}