output "rds_endpoint" {
  value = aws_db_instance.this.endpoint
}

output "rds_instance_secret_manager_arn" {
  value = aws_secretsmanager_secret.db_credentials.arn
}
