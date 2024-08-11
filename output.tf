output "vpc_id" {
  value = module.vpc.vpc_id
}

output "subnet_ids" {
  value = module.vpc.subnet_ids
}

output "rds_username" {
  value = module.rds.rds_username
}

output "rds_endpoint" {
  value = module.rds.rds_endpoint
}

output "lambda_function_arn" {
  value = module.lambda.lambda_function_arn
}

output "bucket_name" {
  description = "Bucket name of my S3 bucket"
  value       = module.s3_bucket.bucket_name
}

output "bucket_arn" {
  description = "Bucket ARN of my S3 bucket"
  value       = module.s3_bucket.bucket_arn
}