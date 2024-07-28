/*
******************* DO NOT EDIT THIS NOTICE *****************
This legal notice is added to every supported source code
file at every commit. See the README for more info!                          
*************************************************************
*/

locals {
  audit_log_bucket = "${module.global.config.organization.tokens.namespace}-${replace(module.global.config.organization.key_accounts.log_archive, "_", "-")}-${module.global.config.organization.tokens.audit_log}"
}

###############################################################################
# Policy for AWS Config log delivery based on AWS Config Developer Guide.
# https://docs.aws.amazon.com/config/latest/developerguide/s3-bucket-policy.html
###############################################################################
data "aws_iam_policy_document" "audit_log" {
  provider = aws.key_account_log_archive
  statement {
    sid     = "AWSConfigBucketPermissionsCheck"
    actions = ["s3:GetBucketAcl"]
    principals {
      type        = "Service"
      identifiers = ["config.amazonaws.com"]
    }
    resources = ["arn:aws:s3:::${local.audit_log_bucket}"]
  }

  statement {
    sid     = "AWSConfigBucketExistenceCheck"
    actions = ["s3:ListBucket"]
    principals {
      type        = "Service"
      identifiers = ["config.amazonaws.com"]
    }
    resources = ["arn:aws:s3:::${local.audit_log_bucket}"]
  }

  statement {
    sid     = "AWSConfigBucketDelivery"
    actions = ["s3:PutObject"]
    principals {
      type        = "Service"
      identifiers = ["config.amazonaws.com"]
    }
    resources = concat(
      ["arn:aws:s3:::${local.audit_log_bucket}/AWSLogs/${data.aws_caller_identity.me.account_id}/*"],
      [
        for account in module.global.config.accounts
        : "arn:aws:s3:::${local.audit_log_bucket}/AWSLogs/${account.id}/Config/*"
        if can(account.id) && !can(account.action)
      ]
    )

    condition {
      test     = "StringEquals"
      variable = "s3:x-amz-acl"
      values   = ["bucket-owner-full-control"]
    }
  }

  statement {
    sid = "AWSConfigBucketPermissionsCheckForMemberAccounts"
    principals {
      type = "AWS"
      identifiers = [
        for account in module.global.config.accounts
        : "arn:aws:iam::${account.id}:root"
        if can(account.id) && !can(account.action)
      ]
    }
    actions   = ["s3:GetBucketAcl"]
    resources = ["arn:aws:s3:::${local.audit_log_bucket}"]
  }

  statement {
    sid = "AWSConfigBucketExistenceCheckForMemberAccounts"
    principals {
      type = "AWS"
      identifiers = [
        for account in module.global.config.accounts
        : "arn:aws:iam::${account.id}:root"
        if can(account.id) && !can(account.action)
      ]
    }
    actions   = ["s3:ListBucket", "s3:GetBucketLocation"]
    resources = ["arn:aws:s3:::${local.audit_log_bucket}"]
  }

  dynamic "statement" {
    for_each = {
      for k, v in module.global.config.accounts
      : k => v
      if can(v.id) && !can(v.action)
    }

    content {
      sid = "AWSConfigBucketDeliveryFor${replace(title(replace(statement.key, "/[^a-z0-9]/", " ")), " ", "")}Account"
      principals {
        type        = "AWS"
        identifiers = ["arn:aws:iam::${statement.value.id}:root"]
      }
      actions   = ["s3:PutObject"]
      resources = ["arn:aws:s3:::${local.audit_log_bucket}/AWSLogs/${statement.value.id}/*"]

      condition {
        test     = "StringEquals"
        variable = "s3:x-amz-acl"
        values   = ["bucket-owner-full-control"]
      }
    }
  }
}

###############################################################################
# Create audit log bucket at the key account assigned to log archive.
###############################################################################
resource "aws_s3_bucket" "audit_log" {
  provider = aws.key_account_log_archive
  bucket   = local.audit_log_bucket
}

###############################################################################
# Enable versioning on the audit log bucket at the key account assigned to 
# log archive.
###############################################################################
resource "aws_s3_bucket_versioning" "audit_log" {
  provider = aws.key_account_log_archive
  bucket   = aws_s3_bucket.audit_log.id
  versioning_configuration {
    status = "Enabled"
  }
}

###############################################################################
# Enable access logging on the audit log bucket at the key account assigned to 
# log archive.
###############################################################################
resource "aws_s3_bucket_logging" "audit_log" {
  provider      = aws.key_account_log_archive
  bucket        = aws_s3_bucket.audit_log.id
  target_bucket = data.aws_s3_bucket.s3_access_log_key_account_log_archive.id
  target_prefix = aws_s3_bucket.audit_log.bucket
}

###############################################################################
# Attach audit log policy to the audit log bucket at the key account assigned 
# to log archive.
###############################################################################
resource "aws_s3_bucket_policy" "audit_log" {
  provider = aws.key_account_log_archive
  bucket   = aws_s3_bucket.audit_log.id
  policy   = data.aws_iam_policy_document.audit_log.json
}
