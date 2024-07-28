# Create Security Group

resource "aws_security_group" "rds_sg" {
  name        = "rds_security_group"
  description = "Security group for RDS PostgreSQL instance"
  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }
  tags = var.tags
}

# Create AWS RDS instance

resource "aws_db_instance" "rds_instance" {
  allocated_storage                   = var.allocated_storage
  storage_type                        = var.storage_type
  engine                              = var.engine
  instance_class                      = var.rds_instance_class
  username                            = var.db_username
  password                            = var.db_password
  port                                = var.port
  identifier                          = var.identifier
  skip_final_snapshot                 = var.skip_final_snapshot
  publicly_accessible                 = var.publicly_accessible
  iam_database_authentication_enabled = var.iam_database_authentication_enabled
  vpc_security_group_ids              = [aws_security_group.rds_sg.id]
}