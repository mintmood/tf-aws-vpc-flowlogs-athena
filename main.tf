resource "aws_flow_log" "this" {
  vpc_id               = var.vpc_id
  traffic_type         = "ALL"
  log_destination_type = "s3"
  log_destination      = aws_s3_bucket.logs.arn

  destination_options {
    file_format        = "parquet"
    per_hour_partition = true
  }

  tags = var.tags
}
