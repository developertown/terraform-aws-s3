variable "force_destroy" {
  description = "Destroy all objects in the bucket before destroying the bucket"
  type        = bool
  default     = true
}

variable "bucket_acl" {
  description = "The canned ACL to apply. Defaults to 'private'."
  type        = string
  default     = "private"
}

variable "bucket_block_public_acls" {
  description = "Whether Amazon S3 should block public ACLs for this bucket. Defaults to false."
  type        = bool
  default     = true
}

variable "bucket_block_public_policy" {
  description = "Whether Amazon S3 should block public bucket policies for this bucket. Defaults to false."
  type        = bool
  default     = false
}

variable "bucket_ignore_public_acls" {
  description = "Whether Amazon S3 should ignore public ACLs for this bucket. Defaults to false."
  type        = bool
  default     = false
}

variable "bucket_restrict_public_buckets" {
  description = "Whether Amazon S3 should restrict public bucket policies for this bucket. Defaults to true."
  type        = bool
  default     = true
}

variable "create_authenticated_iam_user" {
  description = "Create an IAM user with access to this bucket"
  type        = bool
  default     = false
}
