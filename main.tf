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
  region = "us-east-1"
}

# Create S3 bucket

resource "aws_s3_bucket" "s3bucket" {
    bucket = var.bucket_name
    tags = var.tags
}

# Upload all files in path into S3 bucket

resource "aws_s3_bucket_object" "upload_files" {
  bucket = aws_s3_bucket.s3bucket.id
  for_each = fileset(var.files_directory, "**")
  key = each.value
  source = "${var.files_directory}/${each.value}"
}