/*
******************* DO NOT EDIT THIS NOTICE *****************
This legal notice is added to every supported source code
file at every commit. See the README for more info!                          
*************************************************************
*/

###############################################################################
# Create audit log bucket at the key account assigned to log archive.
###############################################################################
resource "aws_s3_bucket" "audit_log" {
  provider = aws.key_account_log_archive
  bucket   = "${module.global.config.organization.tokens.namespace}-${replace(module.global.config.organization.key_accounts.log_archive, "_", "-")}-${module.global.config.organization.tokens.audit_log}"
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

