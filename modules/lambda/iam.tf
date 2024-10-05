# Create AWS IAM Role and with policy that grants an entity permission to assume the role

resource "aws_iam_role" "this" {
  name   = "${var.prefix}-lambda-iam-role-${var.suffix}"
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

# Create AWS IAM Policy Statements

data "aws_iam_policy_document" "this" {
    statement {
        actions   = [
          "rds:*",
        ]
        effect    = "Allow"
        resources = [
          "*"
        ]
      }

    statement {
        actions   = [
          "ec2:CreateNetworkInterface",
          "ec2:DescribeNetworkInterfaces",
          "ec2:DeleteNetworkInterface",
        ]
        effect    = "Allow"
        resources = [
          "*"
        ]
      }

    statement = [
      {
        actions = [
          "secretsmanager:GetSecretValue",
          "secretsmanager:DescribeSecret"
        ]
        effect = "Allow"
        resources =  [
          var.rds_instance_secret_manager_arn
        ]
      }
    ]
  }

# Create AWS IAM Policy using AWS IAM Policy Statements 

resource "aws_iam_policy" "this" {
  name        = "${var.prefix}-lambda-iam-policy-${var.suffix}"
  description = "Policy for AWS Lambda to access AWS RDS"
  policy      = data.aws_iam_policy_document.this.json

}

# Attach AWS IAM Policy to AWS IAM Role

resource "aws_iam_role_policy_attachment" "policy_attach" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.this.arn
}

# Create Security Group for my AWS Lambda function
# (only created if create_custom_vpc is true)

resource "aws_security_group" "this" {
  count  = var.create_custom_vpc
  vpc_id = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}