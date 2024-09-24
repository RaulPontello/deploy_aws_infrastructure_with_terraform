variable "suffix" {
  description = "Suffix used in all resources names"
  type        = string
}

variable "prefix" {
  description = "Prefix used in all resources names"
  type        = string
}

variable "function_name" {
  description = "Unique name for your Lambda Function."
  type        = string
  default     = "send-data-from-api-to-rds"
}

variable "handler" {
  description = "Function entrypoint in your code."
  type        = string
  default     = "api.lambda_handler"
}

variable "runtime" {
  description = "Identifier of the function's runtime."
  type        = string
  default     = "python3.12"
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