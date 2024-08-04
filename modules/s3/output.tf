output "bucket_name" {
  description = "Bucket name of my S3 bucket"
  value       = aws_s3_bucket.this.bucket
}

output "bucket_arn" {
  description = "Bucket ARN of my S3 bucket"
  value       = aws_s3_bucket.this.arn
}