locals{
  identifier = "${var.prefix}-${var.rds_instance_engine}-rds-instance"
  db_credentials = jsondecode(aws_secretsmanager_secret_version.this.secret_string)
}