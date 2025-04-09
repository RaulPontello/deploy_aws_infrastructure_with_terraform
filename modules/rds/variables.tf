# Generic variables

variable "prefix" {
  description = "Prefix used in all AWS resources names"
  type        = string
}

variable "create_custom_vpc" {
  description = "Whether to create a new VPC or use the default one."
  type        = bool
}

# Variables for AWS Secrets Manager

variable "length" {
  description = "The length of the string desired"
  type        = number
  default     = 10
}

variable "special" {
  description = " Include special characters in the result."
  type        = bool
  default     = false
}

variable "numeric" {
  description = "Include numeric characters in the result."
  type        = bool
  default     = true
}

variable "override_special" {
  description = "Supply your own list of special characters to use for string generation. This overrides the default character list in the special argument."
  type        = string
  default     = "!#$%&*()-_=+[]{}<>:?"
}

variable "recovery_window_in_days" {
  description = "Number of days that AWS Secrets Manager waits before it can delete the secret"
  type        = number
  default     = 0
}

variable "force_overwrite_replica_secret" {
  description = "Accepts boolean value to specify whether to overwrite a secret with the same name in the destination Region."
  type        = bool
  default     = true
}

variable "db_username" {
  description = "Username for database"
  type        = string
}

# Variables for AWS RDS

variable "rds_instance_engine" {
  description = "The database engine to use like mysql or postgres"
  type        = string
  default     = "mysql"
}

variable "allocated_storage" {
  description = "The allocated storage in gibibytes"
  type        = number
  default     = 20
}

variable "database_name" {
  description = "Database name"
  type        = string
}

variable "instance_class" {
  description = "The instance type of the RDS instance."
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "db_subnet_group_name" {
  description = "Name of DB subnet group created in VPC module"
  type        = string
}

variable "skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted"
  type        = string
  default     = "true"
}