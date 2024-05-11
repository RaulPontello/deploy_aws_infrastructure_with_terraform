output "bucket_name" {
  value = aws_s3_bucket.s3bucket.bucket
}

output "bucket_arn" {
  value = aws_s3_bucket.s3bucket.arn
}