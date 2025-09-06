# Create bucket
resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name

  tags = merge(
    var.tags,
    { Name = var.bucket_name }
  )
}

# ACL (Access Control List) — dipisah dari bucket
resource "aws_s3_bucket_acl" "this" {
  bucket = aws_s3_bucket.this.id
  acl    = var.acl
}

# Versioning
resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id

  versioning_configuration {
    status = var.versioning_enabled ? "Enabled" : "Suspended"
  }
}

# Public Access Block
resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets
}

# Bucket Policy (opsional, ditentukan dari root)
resource "aws_s3_bucket_policy" "this" {
  count  = var.bucket_policy == null ? 0 : 1
  bucket = aws_s3_bucket.this.id
  policy = var.bucket_policy
}
