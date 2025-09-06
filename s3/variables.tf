variable "bucket_name" {
  description = "Nama bucket S3"
  type        = string
}

variable "acl" {
  description = "Access control list (ex: private, public-read)"
  type        = string
  default     = "private"
}

variable "versioning_enabled" {
  description = "Apakah versioning diaktifkan"
  type        = bool
  default     = false
}

variable "block_public_acls" {
  description = "Block public ACLs"
  type        = bool
  default     = true
}

variable "block_public_policy" {
  description = "Block public bucket policies"
  type        = bool
  default     = true
}

variable "ignore_public_acls" {
  description = "Ignore public ACLs"
  type        = bool
  default     = true
}

variable "restrict_public_buckets" {
  description = "Restrict public buckets"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tag tambahan"
  type        = map(string)
  default     = {}
}

variable "bucket_policy" {
  description = "JSON policy untuk bucket (opsional, di-set dari root)"
  type        = string
  default     = null
}
