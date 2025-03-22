provider "aws" {
  region = var.aws_region
  profile = var.profile_name
  default_tags {
    tags = {
    environment  = var.environment
    project_name = var.project_name
    terraform    = "true"
    owner        = var.owner
    }
  }
}
