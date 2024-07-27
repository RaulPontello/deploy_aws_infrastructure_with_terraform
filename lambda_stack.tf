data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "${path.module}/${var.lambda_file}.py"
  output_path = "${path.module}/${var.lambda_file}.zip"
}

resource "aws_lambda_function" "lambda_function" {
  filename         = data.archive_file.lambda_zip.output_path
  function_name    = var.lambda_file
  role             = aws_iam_role.iam_for_lambda.arn
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
  environment {
    variables = {
      foo = "bar"
    }
  }
}