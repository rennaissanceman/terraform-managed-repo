variable "regions" {
  description = "AWS regions for multi-region S3 deployment."
  type        = list(string)
  default     = ["us-east-1", "us-west-2"]
}

variable "bucket_name_prefix" {
  description = "Prefix for S3 bucket names."
  type        = string
  default     = "lab10-modules-bucket-ziom"
}