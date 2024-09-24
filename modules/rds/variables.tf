variable "suffix" {
  description = "Suffix used in all resources names"
  type        = string
}

variable "tags" {
  description = "Tags to set"
  type        = map(string)
}

variable "engine" {
  description = "The database engine"
  type        = string
  default     = "postgres"
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

variable "db_username" {
  description = "Username for the master DB user."
  type        = string
}

variable "db_password" {
  description = "Password of the database" 
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

variable "port" {
  description = "The port on which the DB accepts connections"
  type        = string
  default     = "5432"
}

variable "publicly_accessible" {
  description = "Defines if the AWS RDS database is publicly accessible"
  type        = bool
  default     = true
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "db_subnet_group_name" {
  description = "Name of DB subnet group created in VPC moduçe"
  type        = string
}