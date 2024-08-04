# Zip .py file 

data "archive_file" "this" {
  type        = "zip"
  source_file = "./python/from_API_to_RDS.py"
  output_path = "./python/from_API_to_RDS.zip"
}

# Create AWS Lambda function

resource "aws_lambda_function" "this" {
  filename         = data.archive_file.this.output_path
  function_name    = "send_data_from_api_to_rds_instance"
  role             = aws_iam_role.this.arn
  handler          = "api.lambda_handler"
  runtime          = "python3.12"
  source_code_hash = data.archive_file.this.output_base64sha256
  environment {
    variables = {
      foo = "bar"
    }
  }
}