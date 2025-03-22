locals{
  function_name    = "${var.prefix}-lambda-function"
  python_file_name = replace(basename(var.lambda_source_file), ".py", "")
}

# Zip my .py file, this .py will be execute by my AWS Lambda function

# resource "null_resource" "this" {
#   provisioner "local-exec" {
#     command = <<EOT
#       rm -rf ./package
#       mkdir -p package
#       pip install -r requirements.txt -t package
#       cd package && zip -r ../lambda.zip .
#       zip -g lambda.zip lambda_function.py
#     EOT
#   }

#   triggers = {
#     always_run = "${timestamp()}"
#   }
# }


# data "archive_file" "this" {
#   type        = "zip"
#   source_file = var.lambda_source_file
#   output_path = replace(var.lambda_source_file, ".py", ".zip")
# }

data "archive_file" "this" {
  type        = "zip"
  source_dir  = "${path.root}/python"
  output_path = "${path.root}/python/lambda_package.zip"
}

# Create my AWS Lambda function

resource "aws_lambda_function" "this" {
  filename         = data.archive_file.this.output_path
  function_name    = "${local.function_name}"
  role             = aws_iam_role.this.arn
  handler          = "${local.python_file_name}.lambda_handler"
  runtime          = var.runtime
  source_code_hash = data.archive_file.this.output_base64sha256
  s3_bucket       = aws_s3_bucket.this.id
  s3_key          = aws_s3_object.this.key
  
  vpc_config {
    security_group_ids = var.create_custom_vpc ? [aws_security_group.this[0].id] : []
    subnet_ids         = var.create_custom_vpc ? var.subnet_ids : []
  }

  environment {
    variables = {
      foo = "bar"
    }
  }

  depends_on = [null_resource.this]
}