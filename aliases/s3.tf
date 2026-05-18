resource "aws_s3_bucket" "my_bucket" {
  bucket = "lab10-aliases-ziom-east-123456"

  tags = {
    Name      = "lab10-aliases-east"
    Lab       = "Lab10"
    ManagedBy = "Terraform"
    Region    = "us-east-1"
  }
}

resource "aws_s3_bucket" "my_bucket_us_west_2" {
  bucket   = "lab10-aliases-ziom-west-123456"
  provider = aws.us_west_2

  tags = {
    Name      = "lab10-aliases-west"
    Lab       = "Lab10"
    ManagedBy = "Terraform"
    Region    = "us-west-2"
  }
}