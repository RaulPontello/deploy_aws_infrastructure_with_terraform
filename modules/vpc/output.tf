output "vpc_id" {
  value       = aws_vpc.custom_vpc.id
  description = "The ID of the VPC"
}

output "subnet_ids" {
  value       = [aws_subnet.customn_vpc_subnet_1.id, aws_subnet.customn_vpc_subnet_2.id]
  description = "List of IDs of the public subnets"
}

output "db_subnet_group_name" {
  value       = aws_db_subnet_group.this.name
  description = "The ID of the VPC"
}