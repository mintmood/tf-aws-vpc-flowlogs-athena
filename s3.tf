resource "aws_s3_bucket" "logs" {
  bucket = var.name
  tags   = var.tags
}

resource "aws_s3_bucket_public_access_block" "logs" {
  bucket                  = aws_s3_bucket.logs.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_lifecycle_configuration" "logs" {
  bucket = aws_s3_bucket.logs.id
  rule {
    id     = "expire-flow-logs"
    status = "Enabled"
    expiration {
      days = var.retention_days
    }
  }
}
