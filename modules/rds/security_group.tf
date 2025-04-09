# Create Security Group for my AWS RDS instance

resource "aws_security_group" "this" {
  name        = "${local.identifier}-security-group"
  description = "Security group for ${local.identifier}"
  vpc_id      = var.create_custom_vpc ? var.vpc_id : data.aws_vpc.default[0].id

  # Ingress for personal IP

  ingress {
    from_port   = var.rds_instance_engine == "mysql" ? 3306
    to_port     = var.rds_instance_engine == "mysql" ? 3306
    protocol    = "tcp"
    cidr_blocks = ["${chomp(data.http.my_ip.response_body)}/32"]
    description = "Allow inbound access for my personal IP"
  }

  # Ingress for 0.0.0.0/0 (access from anywhere)

  ingress {
    from_port   = var.rds_instance_engine == "mysql" ? 3306
    to_port     = var.rds_instance_engine == "mysql" ? 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow inbound access from anywhere"
  }

  # Egress

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }
}