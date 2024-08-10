resource "aws_iam_role" "this" {
  name = "lambda_exec_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action    = "sts:AssumeRole"
      Effect    = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })

  inline_policy {
    name   = "rds-access"
    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [{
        Action   = [
          "rds:*"
        ]
        Effect   = "Allow"
        Resource = "*"
      }]
    })
  }
}

resource "aws_security_group" "this" {
  vpc_id = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}