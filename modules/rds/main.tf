resource "aws_security_group" "this" {
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

resource "aws_db_instance" "this" {
  allocated_storage                   = var.allocated_storage
  engine                              = var.engine
  instance_class                      = var.instance_class
  db_name                             = var.db_name
  username                            = var.db_username
  password                            = var.db_password
  port                                = var.port
  identifier                          = "${var.prefix}-${var.identifier}-${var.suffix}"
  skip_final_snapshot                 = "true"
  publicly_accessible                 = var.publicly_accessible
  db_subnet_group_name                = var.db_subnet_group_name
  vpc_security_group_ids              = [aws_security_group.this.id]
}