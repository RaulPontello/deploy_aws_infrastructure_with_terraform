resource "aws_secretsmanager_secret" "this" {
  name        = "rds_instance_secret2"
  description = "Credentials for RDS instance"
}

resource "aws_secretsmanager_secret_version" "this" {
  secret_id     = aws_secretsmanager_secret.this.id
  secret_string = jsonencode({
    username = var.db_username
    password = var.db_password
  })
}