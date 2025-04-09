output "vpc_id" {
  value       = var.create_custom_vpc ? aws_vpc.custom_vpc[0].id : "default_vpc"
  description = "The ID of the VPC"
}

output "db_subnet_group_name" {
  value       = var.create_custom_vpc ? aws_db_subnet_group.this[0].name : "default_vpc"
  description = "The ID of the VPC"
}