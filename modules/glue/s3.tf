# Create AWs S3 bucket to store .py file

resource "aws_s3_bucket" "this" {
  bucket = "${var.prefix}-glue-job-s3-bucket"
}

# Upload .py file to AWS S3 bucket

resource "aws_s3_object" "this" {
  bucket = aws_s3_bucket.this.id
  key    = ${local.python_file_name}.py
  source = "${path.root}/python/${local.python_file_name}.py"
}