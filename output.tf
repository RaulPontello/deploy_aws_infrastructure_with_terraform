# Other outputs

output "path_module" {
  value = path.module
}

output "path_root" {
  value = path.root
}

# Outputs for AWS VPC

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "subnet_ids" {
  value = module.vpc.subnet_ids
}

# Outputs for AWS RDS

# output "rds_username" {
#   value = module.rds_instance.rds_username
# }

# output "rds_endpoint" {
#   value = module.rds_instance.rds_endpoint
# }

# # Outputs for AWS Lambda

# output "lambda_function_arn" {
#   value = module.lambda_function.lambda_function_arn
# }

# Outputs for AWS S3

# output "bucket_name" {
#   description = "Bucket name of my S3 bucket"
#   value       = module.s3_bucket.bucket_name
# }

# output "bucket_arn" {
#   description = "Bucket ARN of my S3 bucket"
#   value       = module.s3_bucket.bucket_arn
# }