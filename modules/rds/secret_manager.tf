# Create my AWS Secret

resource "random_password" "this" {
  length           = var.length
  special          = var.special
  numeric          = var.numeric
  override_special = var.override_special
}

resource "aws_secretsmanager_secret" "this" {
  name                           = "${var.prefix}-${var.identifier}-${var.suffix}-secret"
  recovery_window_in_days        = var.recovery_window_in_days
  force_overwrite_replica_secret = var.force_overwrite_replica_secret
  description                    = "This secret will be used to for ${var.prefix}-${var.identifier}-${var.suffix} rds instance"
}

resource "aws_secretsmanager_secret_version" "this" {
  secret_id     = aws_secretsmanager_secret.this.id
  secret_string = jsonencode({
    username = var.db_username
    password = random_password.this.result
})
}