# Create AWS RDS instance

resource "aws_db_instance" "rds_instance" {
  allocated_storage    = var.allocated_storage
  storage_type         = var.storage_type
  engine               = var.engine
  instance_class       = var.rds_instance_class
  username             = var.db_username
  password             = var.db_password
  port                 = var.port
  identifier           = var.identifier
  skip_final_snapshot  = var.skip_final_snapshot
}