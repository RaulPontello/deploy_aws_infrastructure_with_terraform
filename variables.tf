variable "files_directory" {
  description = "Path where files are located"
  type    = string
  default = "C:/Users/Engie/Desktop/all_files"
}

variable "bucket_name" {
  description = "Name of the s3 bucket. Must be unique."
  type        = string
  default = "bronze-raul-pontello2"
}

variable "tags" {
  description = "Tags to set on the bucket."
  type        = map(string)
  default     = {
                Name = "bronze_tag"
                Environment = "dev"
                }
}
