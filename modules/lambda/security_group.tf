# Create Security Group for my AWS Lambda function
# (only created if create_custom_vpc is true)

resource "aws_security_group" "this" {
  count  = var.create_custom_vpc ? 1 : 0 
  vpc_id = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}