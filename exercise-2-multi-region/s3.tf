resource "random_id" "bucket_suffix" {
  count       = length(var.regions)
  byte_length = 6

  keepers = {
    bucket_name_prefix = var.bucket_name_prefix
  }
}

resource "aws_s3_bucket" "s3_us_east_1" {
  bucket = "${var.bucket_name_prefix}-${var.regions[0]}-${random_id.bucket_suffix[0].hex}"

  tags = {
    Name        = "lab10-s3-us-east-1"
    Lab         = "Lab10"
    Exercise    = "Exercise2"
    ManagedBy   = "Terraform"
    Region      = var.regions[0]
    Replication = var.replication_enabled ? "enabled" : "disabled"
  }
}

resource "aws_s3_bucket_versioning" "s3_us_east_1" {
  bucket = aws_s3_bucket.s3_us_east_1.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "s3_us_east_1" {
  bucket = aws_s3_bucket.s3_us_east_1.id

  rule {
    id     = "transition-to-glacier-instant-retrieval"
    status = "Enabled"

    filter {
      prefix = ""
    }

    transition {
      days          = var.lifecycle_transition_days
      storage_class = "GLACIER_IR"
    }
  }

  depends_on = [aws_s3_bucket_versioning.s3_us_east_1]
}

resource "aws_s3_bucket" "s3_us_west_2" {
  provider = aws.us_west_2

  bucket = "${var.bucket_name_prefix}-${var.regions[1]}-${random_id.bucket_suffix[1].hex}"

  tags = {
    Name        = "lab10-s3-us-west-2"
    Lab         = "Lab10"
    Exercise    = "Exercise2"
    ManagedBy   = "Terraform"
    Region      = var.regions[1]
    Replication = var.replication_enabled ? "enabled" : "disabled"
  }
}

resource "aws_s3_bucket_versioning" "s3_us_west_2" {
  provider = aws.us_west_2

  bucket = aws_s3_bucket.s3_us_west_2.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "s3_us_west_2" {
  provider = aws.us_west_2

  bucket = aws_s3_bucket.s3_us_west_2.id

  rule {
    id     = "transition-to-glacier-instant-retrieval"
    status = "Enabled"

    filter {
      prefix = ""
    }

    transition {
      days          = var.lifecycle_transition_days
      storage_class = "GLACIER_IR"
    }
  }

  depends_on = [aws_s3_bucket_versioning.s3_us_west_2]
}
