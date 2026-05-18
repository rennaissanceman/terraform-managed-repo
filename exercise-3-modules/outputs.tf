output "bucket_arns" {
  description = "ARNs of created S3 buckets by region."

  value = {
    (var.regions[0]) = module.s3_us_east_1.bucket_arn
    (var.regions[1]) = module.s3_us_west_2.bucket_arn
  }
}

output "bucket_regions" {
  description = "Regions of created S3 buckets by bucket ID."

  value = {
    (module.s3_us_east_1.bucket_id) = module.s3_us_east_1.bucket_region
    (module.s3_us_west_2.bucket_id) = module.s3_us_west_2.bucket_region
  }
}

output "bucket_ids" {
  description = "Names/IDs of created S3 buckets."

  value = {
    (var.regions[0]) = module.s3_us_east_1.bucket_id
    (var.regions[1]) = module.s3_us_west_2.bucket_id
  }
}