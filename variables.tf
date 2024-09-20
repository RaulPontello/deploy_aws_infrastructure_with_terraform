# Other variables

variable "aws_region" {
  description = "Region were tools will be created"
  type        = string
}

variable "environment" {
  description = "Name of the environment used. Ex: dev, qa, prod"
  type        = string
}

variable "profile_name" {
  description = "Name of the profile used"
  type        = string
  default     = "terraform-profile"
}

variable "tags" {
  description = "Tags to set"
  type        = map(string)
  default     = {
    Name        = "Side Project"
    Environment = "Owner: Raul Pontello"
  }
}

# Variables for AWS S3

variable "s3_bucket_name" {
  description = "Name of the s3 bucket. Must be unique."
  type        = string
  default     = "bronze-terraform-bucket"
}

# Variables for AWS RDS

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

variable "storage_type" {
  description = "type of the storage"
  type        = string
  default     = "gp2"
}

variable "db_name" {
  description = "Database name"
  type        = string
  default     = "crypto_database"
}

variable "db_username" {
  description = "Username for the master DB user."
  type        = string
  default     = "terraform_db" # The Master username must contain only letters (A-Z and a-z) and any of the following: +=,.@-_
}

variable "db_password" {
  description = "Password of the database" 
  type        = string
  default     = "terraform_pw" # Minimum constraints: At least 8 printable ASCII characters. Can't contain any of the following symbols: / ' " @
}

variable "rds_instance_class" {
  description = "The RDS instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "skip_final_snapshot" {
  description = "skip snapshot"
  type        = string
  default     = "true"
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

variable "iam_database_authentication_enabled" {
  description = "Specifies whether mappings of AWS Identity and Access Management (IAM) accounts to database accounts is enabled."
  type        = bool
  default     = true
}

variable "source_file" {
  description = "(String) Package this file into the archive"
  type        = string
}
