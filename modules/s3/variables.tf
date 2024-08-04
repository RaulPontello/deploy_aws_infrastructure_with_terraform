variable "tags" {
  description = "Tags to set"
  type        = map(string)
}

variable "s3_bucket_name" {
  description = "Name of the s3 bucket. Must be unique."
  type        = string
}