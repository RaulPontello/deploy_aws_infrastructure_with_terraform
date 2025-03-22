resource "aws_s3_object" "this" {
	  bucket   = "${var.prefix}-s3-bucket"
}     