output "vpc_id" {
  value       = aws_vpc.this.id
  description = "The ID of the VPC"
}

output "subnet_id" {
  value       = aws_subnet.this.id
  description = "The ID of the public subnet"
}