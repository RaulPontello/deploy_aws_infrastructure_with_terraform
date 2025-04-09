# Generic variables

variable "prefix" {
  description = "Prefix used in all AWS resources names"
  type        = string
}

variable "aws_region" {
  description = "Region were AWS resources will be created"
  type        = string
}

variable "create_custom_vpc" {
  description = "Whether to create a new VPC or use the default one."
  type        = bool
}

# AWS Glue variables

variable "secret_name" {
  description = "RDS Instance Secret name"
  type        = string
}

variable "database_name" {
  description = "RDS Instance Database name"
  type        = string
}

variable "database_host" {
  description = "RDS Instance host"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "python_file_name" {
  description = "Path where .py file is located, this file will be executed by AWS Lambda function"
  type        = string
}

variable "rds_instance_secret_manager_arn" {
  description = "The ARN of the RDS credentials stored in Secrets Manager"
  type        = string
}


variable "glue_version" {
  description = "The version of glue to use, for example 1.0. Ray jobs should set this to 4.0 or greater."
  type        = string
  default     = "3.0"
}

variable "number_of_workers" {
  description = "The number of workers of a defined workerType that are allocated when a job runs."
  type        = number
  default     = 1
}

variable "worker_type" {
  description = "The type of predefined worker that is allocated when a job runs. Accepts a value of Standard, G.1X, G.2X, or G.025X for Spark jobs. Accepts the value Z.2X for Ray jobs."
  type        = string
  default     = "G.1X"
}