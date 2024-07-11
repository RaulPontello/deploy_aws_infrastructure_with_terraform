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

# Variables for AWS S3

variable "s3_bucket_name" {
  description = "Name of the s3 bucket. Must be unique."
  type        = string
  default     = "bronze-terraform-bucket"
}

variable "s3_tags" {
  description = "Tags to set on the bucket."
  type        = map(string)
  default     = {
    Name        = "bronze_tag"
    Environment = "dev"
  }
}


# Variables for AWS RDS

variable "engine" {
  description = "The database engine"
  type = string
  default = "postgres"
}

variable "allocated_storage" {
  description = "The amount of allocated storage."
  type = number
  default = 20
}

variable "storage_type" {
  description = "type of the storage"
  type = string
  default = "gp2"
}

variable "username" {
  description = "Username for the master DB user."
  type = string
}

variable "password" {
  description = "password of the database"
  type = string
}

variable "instance_class" {
  description = "The RDS instance class"
  default = "db.t2.micro"
  type = string
}

variable "parameter_group_name" {
  description = "Name of the DB parameter group to associate"
  default = "default.mysql5.7"
  type = string
}

variable "engine_version" {
  description = "The engine version"
  default = "5.7"
  type = number
}

variable "skip_final_snapshot" {
  description = "skip snapshot"
  default = "true"
  type = string
}

variable "identifier" {
  description = "The name of the RDS instance"
  default = "terraform-database-test"
  type = string
}

variable "port" {
  description = "The port on which the DB accepts connections"
  default = "3306"
  type = number
}

variable "name" {
  description = "The database name"
  default = "Mysqldatabase"
  type = string
}
