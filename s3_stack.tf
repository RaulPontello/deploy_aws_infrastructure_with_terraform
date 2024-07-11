# Create AWS S3 bucket

resource "aws_s3_bucket" "s3bucket" {
  bucket = var.s3_bucket_name # bucket name
  tags   = var.s3_tags        # bucket tags
}