# Create my AWS RDS instance

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
  db_subnet_group_name                = var.create_custom_vpc ? var.db_subnet_group_name : null
  vpc_security_group_ids              = var.create_custom_vpc ? [aws_security_group.this[0].id] : []
}