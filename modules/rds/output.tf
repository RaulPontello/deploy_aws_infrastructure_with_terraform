output "rds_endpoint" {
  value = aws_db_instance.this.address
}

output "rds_instance_secret_manager_arn" {
  value = aws_secretsmanager_secret.this.arn
}

output "secret_name" {
  value = aws_secretsmanager_secret.this.name
}