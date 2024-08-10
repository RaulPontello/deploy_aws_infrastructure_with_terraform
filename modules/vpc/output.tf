output "vpc_id" {
  value       = aws_vpc.this.id
  description = "The ID of the VPC"
}

output "subnet_ids" {
  value       = [aws_subnet.vpc_subnet_1.id, aws_subnet.vpc_subnet_2.id]
  description = "The IDs of the public subnet"
}