# Terraform settings

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider

provider "aws" {
  region = var.aws_region
}

# Create AWS EC2 instance

resource "aws_instance" "ec2_instance" {
  ami           = var.ec2_ami           # Application machine imagine of my EC2 instance
  instance_type = var.ec2_instance_type # Instance type of my EC2 instance
  tags          = var.ec2_tags      # Tags to set on the EC2 instance
}

# Create AWS S3 bucket

resource "aws_s3_bucket" "s3bucket" {
  bucket = var.s3_bucket_name # bucket name
  tags   = var.s3_tags     # bucket tags
}

# Upload all files in path into AWS S3 bucket

resource "aws_s3_object" "upload_files" {
  bucket   = aws_s3_bucket.s3bucket.id          # bucket name (check aws_s3_bucket resource)
  for_each = fileset(var.files_directory, "**") # loop inside path (** includes files and sub-folders)
  key      = each.value
  source   = "${var.files_directory}/${each.value}"
}
