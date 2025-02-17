# Other variables

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

# Variables for AWS Secrets Manager

variable "length" {
  description = "Whether to create a new VPC or use the default one."
  type        = number
  default     = 10
}

variable "special" {
  description = "Whether to create a new VPC or use the default one."
  type        = bool
  default     = false
}

variable "numeric" {
  description = "Whether to create a new VPC or use the default one."
  type        = bool
  default     = true
}

variable "override_special" {
  description = "Whether to create a new VPC or use the default one."
  type        = string
  default     = "!#$%&*()-_=+[]{}<>:?"
}

variable "recovery_window_in_days" {
  description = "Whether to create a new VPC or use the default one."
  type        = number
  default     = 10
}

variable "force_overwrite_replica_secret" {
  description = "Whether to create a new VPC or use the default one."
  type        = bool
  default     = "true"
}

variable "db_username" {
  description = "Username for the master DB user."
  type        = string
}

# Variables for AWS RDS

variable "rds_instance_engine" {
  description = "The database engine"
  type        = string
}

variable "port" {
  description = "The database engine"
  type        = string
}

variable "allocated_storage" {
  description = "The amount of allocated storage."
  type        = number
  default     = 20
}

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "instance_class" {
  description = "The RDS instance class"
  type        = string
}

variable "identifier" {
  description = "The name of the RDS instance"
  type        = string
  default     = "rds-database"
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

variable "publicly_accessible" {
  description = "Bool to control if instance is publicly accessible. Default is false."
  type        = string
  default     = "true"
}