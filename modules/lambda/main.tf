# Zip my .py file, this .py will be execute by my AWS Lambda function

data "archive_file" "this" {
  type        = "zip"
  source_file = var.lambda_source_file
  output_path = replace(var.source_file, ".py", ".zip")
}

# Create my AWS Lambda function

resource "aws_lambda_function" "this" {
  filename         = data.archive_file.this.output_path
  function_name    = "${var.prefix}-${var.function_name}-${var.suffix}"
  role             = aws_iam_role.this.arn
  handler          = "api.lambda_handler"
  runtime          = "python3.12"
  source_code_hash = data.archive_file.this.output_base64sha256
  
  vpc_config {
    security_group_ids = var.create_custom_vpc ? [aws_security_group.this[0].id] : []
    subnet_ids         = var.create_custom_vpc ? var.subnet_ids : null
  }

  environment {
    variables = {
      foo = "bar"
    }
  }
}