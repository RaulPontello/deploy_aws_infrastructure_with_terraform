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
  profile = var.profile_name
}

# Create AWS stacks

module "s3" {
  source = "./aws_stacks/s3_stack.tf"
}

module "rds" {
  source = "./aws_stacks/rds_stack.tf"
}


