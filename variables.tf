# Other variables

variable "aws_region" {
  description = "Region were tools will be created"
  type        = string
  default     = "us-east-1"
}

variable "profile_name" {
  description = "Name of the profile used"
  type        = string
  default     = "terraform_profile"
}

variable "tags" {
  description = "Tags to set"
  type        = map(string)
  default     = {
    Name        = "bronze_tag"
    Environment = "dev"
  }
}

# Variables for AWS S3, used in s3_stack.tf

variable "s3_bucket_name" {
  description = "Name of the s3 bucket. Must be unique."
  type        = string
  default     = "bronze-terraform-bucket"
}

# Variables for AWS Secrets Manager, used in secrets_manager_stack.tf

variable "secret_name" {
  description = "The secret name used for finding my database credentials"
  type        = string
  default     = "rds_db_credentials"
}

# Variables for AWS RDS, used in rds_stack.tf

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
  default     = "terraform-rds-database"
}

variable "port" {
  description = "The port on which the DB accepts connections"
  type        = string
  default     = "5432"
}

variable "publicly_accessible" {
  description = "Defines if the AWS RDS database is publicly accessible"
  type        = bool
  default     = false
}

variable "iam_database_authentication_enabled" {
  description = "Specifies whether mappings of AWS Identity and Access Management (IAM) accounts to database accounts is enabled."
  type        = bool
  default     = true
}

# Variables for AWS Lambda, used in lambda_stack.tf

variable "lambda_file" {
  description = "Name of the .py file"
  type        = string
  default     = "from_API_to_RDS"
}

variable "function_name" {
  description = "Name of the .py file"
  type        = string
  default     = "from_API_to_RDS"
}

variable "runtime" {
  description = "Runtime provides a language-specific environment "
  type        = string
  default     = "python3.12"
}

variable "handler" {
  description = "Indicates the method AWS Lambda should invoke when executing the function"
  type        = string
  default     = "api.lambda_handler"
}