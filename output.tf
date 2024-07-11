# AWS S3 outputs 

output "bucket_name" {
  description = "Bucket name of my S3 bucket"
  value       = aws_s3_bucket.s3bucket.bucket
}

output "bucket_arn" {
  description = "Bucket ARN of my S3 bucket"
  value       = aws_s3_bucket.s3bucket.arn
}

# AWS RDS outputs 

output "rds_endpoint" {
  value = aws_db_instance.rds_instance.endpoint
}

output "rds_username" {
  value = aws_db_instance.rds_instance.username
}

output "rds_instance_db_name" {
  value = aws_db_instance.rds_instance.name
}
