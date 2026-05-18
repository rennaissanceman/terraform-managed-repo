output "bucket_arns" {
  description = "ARNs of created S3 buckets by region"

  value = {
    (var.regions[0]) = aws_s3_bucket.s3_us_east_1.arn
    (var.regions[1]) = aws_s3_bucket.s3_us_west_2.arn
  }
}

output "bucket_regions" {
  description = "Bucket names mapped to AWS regions"

  value = {
    (aws_s3_bucket.s3_us_east_1.id) = var.regions[0]
    (aws_s3_bucket.s3_us_west_2.id) = var.regions[1]
  }
}

output "replication_status" {
  description = "Replication status for each bucket"

  value = {
    (var.regions[0]) = var.replication_enabled ? "enabled" : "disabled"
    (var.regions[1]) = var.replication_enabled ? "enabled" : "disabled"
  }
}