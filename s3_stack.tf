# Create AWS S3 bucket

resource "aws_s3_bucket" "s3bucket" {
  bucket = var.s3_bucket_name 
  tags   = var.tags
  depends_on = [aws_db_instance.rds_instance]
}