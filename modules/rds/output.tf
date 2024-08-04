output "rds_endpoint" {
  value = aws_db_instance.this.endpoint
}

output "rds_username" {
  value = aws_db_instance.this.username
}