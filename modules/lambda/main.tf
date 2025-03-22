locals{
  function_name    = "${var.prefix}-lambda-function"
  python_file_name = replace(basename(var.lambda_source_file), ".py", "")
}

# Zip my .py file, this .py will be execute by my AWS Lambda function

data "archive_file" "this" {
  type        = "zip"
  source_file = var.lambda_source_file
  output_path = replace(var.lambda_source_file, ".py", ".zip")
}

# Create my AWS Lambda function layer

resource "aws_lambda_layer_version" "this" {
	  layer_name          = "${local.function_name}-layer"
	  s3_bucket            = aws_s3_object.this.id
	  source_code_hash    = data.archive_file.this.output_base64sha256
	  compatible_runtimes = [var.runtime]
}

# Package libraries

resource "null_resource" "main" {
  provisioner "local-exec" {
    command = <<EOT
      rm -rf python
      mkdir -p python
      pip install pymysql psycopg2 -t python
      cd python && zip -r ../lambda.zip .
    EOT
  }

  triggers = {
    always_run = "${timestamp()}"
  }
}

# Create my AWS Lambda function

resource "aws_lambda_function" "this" {
  filename         = data.archive_file.this.output_path
  function_name    = "${local.function_name}"
  role             = aws_iam_role.this.arn
  handler          = "${local.python_file_name}.lambda_handler"
  runtime          = var.runtime
  source_code_hash = data.archive_file.this.output_base64sha256
  
  vpc_config {
    security_group_ids = var.create_custom_vpc ? [aws_security_group.this[0].id] : []
    subnet_ids         = var.create_custom_vpc ? var.subnet_ids : []
  }

  environment {
    variables = {
      foo = "bar"
    }
  }

  depends_on = [aws_lambda_layer_version.this, null_resource.this]
}