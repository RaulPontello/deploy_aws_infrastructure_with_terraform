# Create my AWS Secret

resource "random_password" "rds_password" {
  length           = var.length
  special          = var.special
  numeric          = var.numeric
  override_special = var.override_special
}

resource "aws_secretsmanager_secret" "rds_secret" {
  name                           = "${var.prefix}-${var.identifier}-${var.suffix}-secret"
  recovery_window_in_days        = var.recovery_window_in_days
  force_overwrite_replica_secret = var.force_overwrite_replica_secret
  description                    = "This secret will be used to for ${var.prefix}-${var.identifier}-${var.suffix} rds instance"
}

resource "aws_secretsmanager_secret_version" "rds_secret_version" {
  secret_id     = aws_secretsmanager_secret.rds_secret.id
  secret_string = jsonencode({
    username = var.db_username
    password = random_password.rds_password.result
})
}