variable "prefix" {
  description = "Prefix used in all resources names"
  type        = string
}

variable "aws_region" {
  description = "Region were tools will be created"
  type        = string
}

variable "create_custom_vpc" {
  description = "Whether to create a new VPC or use the default one."
  type        = bool
}

variable "secret_name" {
  description = "Whether to create a new VPC or use the default one."
  type        = string
}

variable "database_name" {
  description = "Database name"
  type        = string
}

variable "database_host" {
  description = "database_host"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

# variable "subnet_ids" {
#   description = "List of Subnet IDs"
#   type        = list(string)
# }

variable "python_file_name" {
  description = "Path where .py file is located, this file will be executed by AWS Lambda function"
  type        = string
}

variable "rds_instance_secret_manager_arn" {
  description = "The ARN of the RDS credentials stored in Secrets Manager"
  type        = string
}

variable "retention_in_days" {
  description = "retention_in_days"
  type        = number
  default     = 3
}

variable "runtime" {
  description = "runtime"
  type        = string
  default     = "python3.12"
}