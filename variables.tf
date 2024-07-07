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

variable "files_directory" {
  description = "Path where files are located"
  type        = string
  default     = "C:\\Users\\raulv\\all_files"
}

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

# Variables for AWS EC2

variable "ec2_ami" {
  description = "Application machine imagine of my EC2 instance"
  type        = string
  default     = "ami-07caf09b362be10b8"
}

variable "ec2_instance_type" {
  description = "Instance type of my EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "ec2_tags" {
  description = "Tags to set on the EC2 instance"
  type        = map(string)
  default     = {
    Name        = "ec2_tag"
    Environment = "dev"
  }
}
