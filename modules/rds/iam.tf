# Create Security Group for my AWS RDS instance to allow public traffic
# (only created if create_custom_vpc is true)

resource "aws_security_group" "this" {
  count       = var.create_custom_vpc ? 1 : 0
  name        = "${var.prefix}-rds-security-group-${var.suffix}"
  description = "Security group for AWS RDS instance"
  vpc_id      = var.vpc_id
  tags        = var.tags
  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}