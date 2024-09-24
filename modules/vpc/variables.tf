variable "suffix" {
  description = "Suffix used in all resources names"
  type        = string
}

variable "prefix" {
  description = "Prefix used in all resources names"
  type        = string
}

variable "create_vpc" {
  description = "Whether to create a new VPC or use the default one."
  type        = bool
}