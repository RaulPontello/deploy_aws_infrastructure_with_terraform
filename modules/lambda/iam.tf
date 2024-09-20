
resource "aws_iam_role" "this" {
  name   = "terraform-side-project-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action    = "sts:AssumeRole",
        Effect    = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

data "aws_iam_policy_document" "glue_policy_statements" {
    statement {
        actions   = [
          "rds:*",
        ]
        effect    = "Allow"
        resources = [
          "*"
        ]
      }
  }

resource "aws_iam_policy" "glue_policy" {
  name        = "terraform-side-project-policy"
  description = "Policy for Glue Job to access S3 buckets"
  policy      = data.aws_iam_policy_document.glue_policy_statements.json

}

resource "aws_iam_role_policy_attachment" "glue_policy_attach" {
  role       = aws_iam_role.glue_role.name
  policy_arn = aws_iam_policy.glue_policy.arn
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