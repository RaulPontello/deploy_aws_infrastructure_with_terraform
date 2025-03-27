# Zip my .py file, this .py will be execute by my AWS Lambda function

data "archive_file" "this" {
  type        = "zip"
  source_dir  = "${path.root}/python"
  output_path = "${path.root}/lambda_package.zip"
}


# Create Lambda layer

resource "aws_lambda_layer_version" "this" {
  layer_name               = "${local.function_name}-layer"
  filename                 = data.archive_file.this.output_path
  compatible_architectures = ["x86_64"]
  compatible_runtimes      = [var.runtime]
}

# Create my AWS Lambda function

resource "aws_lambda_function" "this" {
  filename         = data.archive_file.this.output_path
  source_code_hash = data.archive_file.this.output_base64sha256
  function_name    = "${local.function_name}"
  role             = aws_iam_role.this.arn
  handler          = "${var.python_file_name}.lambda_handler"
  runtime          = var.runtime
  layers           = [aws_lambda_layer_version.this.arn]

  vpc_config {
    security_group_ids = var.create_custom_vpc ? [aws_security_group.this[0].id] : []
    subnet_ids         = var.create_custom_vpc ? var.subnet_ids : []
  }

  environment {
    variables = {
      foo = "bar"
    }
  }
}