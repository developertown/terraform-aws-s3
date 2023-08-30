locals {
  enabled = var.enabled

  name = "${var.name}-${var.environment}%{if var.suffix != ""}-${var.suffix}%{endif}"

  tags = merge(
    var.tags,
    {
      "Environment" = var.environment,
      "ManagedBy"   = "Terraform"
    }
  )
}

data "aws_caller_identity" "current" {}

#tfsec:ignore:aws-s3-enable-versioning
resource "aws_s3_bucket" "bucket" {
  count = local.enabled ? 1 : 0

  bucket        = local.name
  force_destroy = var.force_destroy
}

resource "aws_s3_bucket_acl" "bucket" {
  count = local.enabled ? 1 : 0

  bucket = one(aws_s3_bucket.bucket[*].id)
  acl    = var.bucket_acl
}

resource "aws_s3_bucket_public_access_block" "bucket" {
  count = local.enabled ? 1 : 0

  bucket                  = one(aws_s3_bucket.bucket[*].id)
  block_public_acls       = var.bucket_block_public_acls
  ignore_public_acls      = var.bucket_ignore_public_acls
  block_public_policy     = var.bucket_block_public_policy
  restrict_public_buckets = var.bucket_restrict_public_buckets
}

# Resource to avoid error "AccessControlListNotSupported: The bucket does not allow ACLs"
resource "aws_s3_bucket_ownership_controls" "s3_bucket_acl_ownership" {
  count = local.enabled ? 1 : 0

  bucket = one(aws_s3_bucket.bucket[*].id)
  rule {
    object_ownership = "ObjectWriter"
  }
}

module "iam-s3-user" {
  count = local.enabled && var.create_authenticated_iam_user ? 1 : 0

  source  = "cloudposse/iam-s3-user/aws"
  version = "1.1.0"

  stage = var.environment
  name  = "${local.name}-user"

  s3_actions = [
    "s3:*"
  ]
  s3_resources = ["${one(aws_s3_bucket.bucket[*].arn)}/*"]
}