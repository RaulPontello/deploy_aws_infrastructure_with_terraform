resource "awscc_secretsmanager_secret" "this" {
  name = "${var.prefix}-${var.identifier}-${var.suffix}-secret-manager-credentials"
}

resource "aws_secretsmanager_secret_version" "rds_secret_version" {
  secret_id     = awscc_secretsmanager_secret.this.id
  secret_string = jsonencode({
    username = var.db_username
    password = var.db_password
  })
}