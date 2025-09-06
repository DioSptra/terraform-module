output "bucket_id" {
  description = "ID dari bucket"
  value       = aws_s3_bucket.this.id
}

output "bucket_arn" {
  description = "ARN dari bucket"
  value       = aws_s3_bucket.this.arn
}

output "bucket_domain_name" {
  description = "Domain bucket"
  value       = aws_s3_bucket.this.bucket_domain_name
}
