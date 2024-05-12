# AWS S3 outputs 

output "bucket_name" {
  description = "Bucket name of my S3 bucket"
  value       = aws_s3_bucket.s3bucket.bucket
}

output "bucket_arn" {
  description = "Bucket ARN of my S3 bucket"
  value       = aws_s3_bucket.s3bucket.arn
}

# AWS EC2 outputs 

output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.ec2_instance.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.ec2_instance.public_ip
}
