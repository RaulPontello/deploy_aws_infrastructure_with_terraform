# Retrieve created secret

data "aws_secretsmanager_secret_version" "db_secret" {
  secret_id = aws_secretsmanager_secret.this.id
}

locals {
  db_credentials = jsondecode(data.aws_secretsmanager_secret_version.db_secret.secret_string)
}

# Create my AWS RDS instance

resource "aws_db_instance" "this" {
  allocated_storage                   = var.allocated_storage
  engine                              = var.rds_instance_engine
  instance_class                      = var.instance_class
  db_name                             = var.db_name
  username                            = local.db_credentials["username"]
  password                            = local.db_credentials["password"]
  identifier                          = "${var.prefix}-${var.identifier}-${var.suffix}"
  skip_final_snapshot                 = var.skip_final_snapshot
  publicly_accessible                 = var.publicly_accessible
  db_subnet_group_name                = var.create_custom_vpc ? var.db_subnet_group_name : null
  vpc_security_group_ids              = var.create_custom_vpc ? [aws_security_group.this[0].id] : []
  depends_on                          = [aws_secretsmanager_secret_version.this]
}