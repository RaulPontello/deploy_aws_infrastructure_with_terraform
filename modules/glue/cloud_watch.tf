resource "aws_cloudwatch_log_group" "this" {
  name              = "/aws/glue/${var.prefix}-glue-job"
  retention_in_days = var.retention_in_days
}