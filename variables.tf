# Other variables

variable "aws_region" {
  description = "Region were tools will be created"
  type        = string
}

variable "owner" {
  description = "Owner of this project"
  type        = string
}

variable "environment" {
  description = "Name of the environment used. Ex: dev, qa, prod"
  type        = string
}

variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "profile_name" {
  description = "Name of the profile used"
  type        = string
}

variable "create_custom_vpc" {
  description = "Whether to create a new VPC or use the default one."
  type        = bool
  default     = true
}

# Variables for AWS RDS

variable "database_name" {
  description = "Database name"
  type        = string
  default     = "crypto_database"
}

variable "db_username" {
  description = "Username for the master DB user."
  type        = string
  default     = "terraform_db" # The Master username must contain only letters (A-Z and a-z) and any of the following: +=,.@-_
}

variable "instance_class" {
  description = "The RDS instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "rds_instance_engine" {
  description = "The database engine"
  type        = string
}

# Variables for AWS Lambda

variable "python_file_name" {
  description = "Path where .py file is located, this file will be executed by AWS Lambda function"
  type        = string
}
