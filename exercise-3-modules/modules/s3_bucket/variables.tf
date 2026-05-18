variable "bucket_name_prefix" {
  description = "Prefix used to build the S3 bucket name."
  type        = string
}

variable "region" {
  description = "AWS region where the S3 bucket is created."
  type        = string
}

variable "random_suffix" {
  description = "Random suffix used to make the S3 bucket name globally unique."
  type        = string
}

variable "lifecycle_days" {
  description = "Number of days after which objects transition to another storage class."
  type        = number
  default     = 90
}

variable "lifecycle_storage_class" {
  description = "S3 storage class used in the lifecycle transition."
  type        = string
  default     = "GLACIER"
}