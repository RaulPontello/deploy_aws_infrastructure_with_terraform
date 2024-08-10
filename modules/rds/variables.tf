variable "tags" {
  description = "Tags to set"
  type        = map(string)
}

variable "engine" {
  description = "The database engine"
  type        = string
}

variable "allocated_storage" {
  description = "The amount of allocated storage."
  type        = number
}

variable "storage_type" {
  description = "type of the storage"
  type        = string
}

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "db_username" {
  description = "Username for the master DB user."
  type        = string
}

variable "db_password" {
  description = "Password of the database" 
  type        = string
}

variable "rds_instance_class" {
  description = "The RDS instance class"
  type        = string
}

variable "skip_final_snapshot" {
  description = "skip snapshot"
  type        = string
}

variable "identifier" {
  description = "The name of the RDS instance"
  type        = string
}

variable "port" {
  description = "The port on which the DB accepts connections"
  type        = string
}

variable "publicly_accessible" {
  description = "Defines if the AWS RDS database is publicly accessible"
  type        = bool
}

variable "iam_database_authentication_enabled" {
  description = "Specifies whether mappings of AWS Identity and Access Management (IAM) accounts to database accounts is enabled."
  type        = bool
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "subnet_ids" {
  description = "List of Subnet IDs"
  type        = list(string)
}