output "bucket_name" {
  value = aws_s3_bucket.logs.id
}

output "flow_log_id" {
  value = aws_flow_log.this.id
}
