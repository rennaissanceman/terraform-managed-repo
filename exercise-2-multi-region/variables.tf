variable "regions" {
  description = "AWS regions where S3 buckets will be created"
  type        = list(string)
  default     = ["us-east-1", "us-west-2"]
}

variable "bucket_name_prefix" {
  description = "Prefix for globally unique S3 bucket names"
  type        = string
  default     = "lab10-multiregion-s3"
}

variable "replication_enabled" {
  description = "Replication setting shown in outputs. Actual replication is not configured in this exercise."
  type        = bool
  default     = false
}

variable "lifecycle_transition_days" {
  description = "Number of days before objects transition to Glacier Instant Retrieval"
  type        = number
  default     = 90
}