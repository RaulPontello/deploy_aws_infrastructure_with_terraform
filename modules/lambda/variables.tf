variable "suffix" {
  description = "Suffix used in all resources names"
  type        = string
}

variable "prefix" {
  description = "Prefix used in all resources names"
  type        = string
}

variable "create_custom_vpc" {
  description = "Whether to create a new VPC or use the default one."
  type        = bool
}

variable "function_name" {
  description = "Unique name for your Lambda Function."
  type        = string
  default     = "send-data-from-api-to-rds"
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "subnet_ids" {
  description = "List of Subnet IDs"
  type        = list(string)
}

variable "source_file" {
  description = "(String) Package this file into the archive"
  type        = string
}

variable "rds_instance_secret_manager_arn" {
  description = "The ARN of the RDS credentials stored in Secrets Manager"
  type        = string
}