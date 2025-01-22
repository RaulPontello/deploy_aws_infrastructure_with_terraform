provider "aws" {
  region = var.aws_region
  profile = var.profile_name
  default_tags {
    tags = {
    name        = "Side Project"
    environment = var.environment
    owner       = "Raul Pontello"
    aws_region  = var.aws_region
    terraform   = "true"
    }
  }
}
