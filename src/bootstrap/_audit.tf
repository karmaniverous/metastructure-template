/*
******************* DO NOT EDIT THIS NOTICE *****************
This legal notice is added to every supported source code
file at every commit. See the README for more info!                          
*************************************************************
*/

###############################################################################
###############################################################################
####                                                                       ####
####              THIS FILE WAS GENERATED WITH METASTRUCTURE               ####
####                       DO NOT EDIT IT MANUALLY!                        ####
####                                                                       ####
###############################################################################
###############################################################################

###############################################################################
###############################################################################
#### ACCOUNT S3 ACCESS LOG BUCKETS
###############################################################################
###############################################################################

###############################################################################
# DEVELOPMENT ACCOUNT S3 ACCESS LOG BUCKET 
###############################################################################

###############################################################################
# Create account Development Account S3 access log bucket. 
###############################################################################
resource "aws_s3_bucket" "s3_access_log_dev" {
  provider = aws.dev
  bucket   = "metastructure-001-dev-s3-access-logs"
}

###############################################################################
# Configure account Development Account S3 access log bucket SSE. 
###############################################################################
resource "aws_s3_bucket_server_side_encryption_configuration" "s3_access_log_dev" {
  provider = aws.dev
  bucket   = aws_s3_bucket.s3_access_log_dev.bucket
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
    bucket_key_enabled = true
  }
}

###############################################################################
# Configure account Development Account S3 access log bucket policy. 
###############################################################################
resource "aws_s3_bucket_policy" "s3_access_log_dev" {
  provider = aws.dev
  bucket   = aws_s3_bucket.s3_access_log_dev.bucket
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowLogging"
        Effect = "Allow"
        Principal = {
          Service = "logging.s3.amazonaws.com"
        }
        Action   = "s3:PutObject"
        Resource = "${aws_s3_bucket.s3_access_log_dev.arn}/*"
      }
    ]
  })
}

###############################################################################
# LOG ARCHIVE ACCOUNT S3 ACCESS LOG BUCKET 
###############################################################################

###############################################################################
# Create account Log Archive Account S3 access log bucket. 
###############################################################################
resource "aws_s3_bucket" "s3_access_log_log_archive" {
  provider = aws.log_archive
  bucket   = "metastructure-001-log-archive-s3-access-logs"
}

###############################################################################
# Configure account Log Archive Account S3 access log bucket SSE. 
###############################################################################
resource "aws_s3_bucket_server_side_encryption_configuration" "s3_access_log_log_archive" {
  provider = aws.log_archive
  bucket   = aws_s3_bucket.s3_access_log_log_archive.bucket
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
    bucket_key_enabled = true
  }
}

###############################################################################
# Configure account Log Archive Account S3 access log bucket policy. 
###############################################################################
resource "aws_s3_bucket_policy" "s3_access_log_log_archive" {
  provider = aws.log_archive
  bucket   = aws_s3_bucket.s3_access_log_log_archive.bucket
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowLogging"
        Effect = "Allow"
        Principal = {
          Service = "logging.s3.amazonaws.com"
        }
        Action   = "s3:PutObject"
        Resource = "${aws_s3_bucket.s3_access_log_log_archive.arn}/*"
      }
    ]
  })
}

###############################################################################
# MASTER ACCOUNT S3 ACCESS LOG BUCKET 
###############################################################################

###############################################################################
# Create account Master Account S3 access log bucket. 
###############################################################################
resource "aws_s3_bucket" "s3_access_log_master" {
  provider = aws.master
  bucket   = "metastructure-001-master-s3-access-logs"
}

###############################################################################
# Configure account Master Account S3 access log bucket SSE. 
###############################################################################
resource "aws_s3_bucket_server_side_encryption_configuration" "s3_access_log_master" {
  provider = aws.master
  bucket   = aws_s3_bucket.s3_access_log_master.bucket
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
    bucket_key_enabled = true
  }
}

###############################################################################
# Configure account Master Account S3 access log bucket policy. 
###############################################################################
resource "aws_s3_bucket_policy" "s3_access_log_master" {
  provider = aws.master
  bucket   = aws_s3_bucket.s3_access_log_master.bucket
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowLogging"
        Effect = "Allow"
        Principal = {
          Service = "logging.s3.amazonaws.com"
        }
        Action   = "s3:PutObject"
        Resource = "${aws_s3_bucket.s3_access_log_master.arn}/*"
      }
    ]
  })
}

###############################################################################
# PRODUCTION ACCOUNT S3 ACCESS LOG BUCKET 
###############################################################################

###############################################################################
# Create account Production Account S3 access log bucket. 
###############################################################################
resource "aws_s3_bucket" "s3_access_log_prod" {
  provider = aws.prod
  bucket   = "metastructure-001-prod-s3-access-logs"
}

###############################################################################
# Configure account Production Account S3 access log bucket SSE. 
###############################################################################
resource "aws_s3_bucket_server_side_encryption_configuration" "s3_access_log_prod" {
  provider = aws.prod
  bucket   = aws_s3_bucket.s3_access_log_prod.bucket
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
    bucket_key_enabled = true
  }
}

###############################################################################
# Configure account Production Account S3 access log bucket policy. 
###############################################################################
resource "aws_s3_bucket_policy" "s3_access_log_prod" {
  provider = aws.prod
  bucket   = aws_s3_bucket.s3_access_log_prod.bucket
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowLogging"
        Effect = "Allow"
        Principal = {
          Service = "logging.s3.amazonaws.com"
        }
        Action   = "s3:PutObject"
        Resource = "${aws_s3_bucket.s3_access_log_prod.arn}/*"
      }
    ]
  })
}

###############################################################################
# TESTING ACCOUNT S3 ACCESS LOG BUCKET 
###############################################################################

###############################################################################
# Create account Testing Account S3 access log bucket. 
###############################################################################
resource "aws_s3_bucket" "s3_access_log_test" {
  provider = aws.test
  bucket   = "metastructure-001-test-s3-access-logs"
}

###############################################################################
# Configure account Testing Account S3 access log bucket SSE. 
###############################################################################
resource "aws_s3_bucket_server_side_encryption_configuration" "s3_access_log_test" {
  provider = aws.test
  bucket   = aws_s3_bucket.s3_access_log_test.bucket
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
    bucket_key_enabled = true
  }
}

###############################################################################
# Configure account Testing Account S3 access log bucket policy. 
###############################################################################
resource "aws_s3_bucket_policy" "s3_access_log_test" {
  provider = aws.test
  bucket   = aws_s3_bucket.s3_access_log_test.bucket
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowLogging"
        Effect = "Allow"
        Principal = {
          Service = "logging.s3.amazonaws.com"
        }
        Action   = "s3:PutObject"
        Resource = "${aws_s3_bucket.s3_access_log_test.arn}/*"
      }
    ]
  })
}

###############################################################################
# SHARED SERVICES ACCOUNT S3 ACCESS LOG BUCKET 
###############################################################################

###############################################################################
# Create account Shared Services Account S3 access log bucket. 
###############################################################################
resource "aws_s3_bucket" "s3_access_log_shared_services" {
  provider = aws.shared_services
  bucket   = "metastructure-001-shared-services-s3-access-logs"
}

###############################################################################
# Configure account Shared Services Account S3 access log bucket SSE. 
###############################################################################
resource "aws_s3_bucket_server_side_encryption_configuration" "s3_access_log_shared_services" {
  provider = aws.shared_services
  bucket   = aws_s3_bucket.s3_access_log_shared_services.bucket
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
    bucket_key_enabled = true
  }
}

###############################################################################
# Configure account Shared Services Account S3 access log bucket policy. 
###############################################################################
resource "aws_s3_bucket_policy" "s3_access_log_shared_services" {
  provider = aws.shared_services
  bucket   = aws_s3_bucket.s3_access_log_shared_services.bucket
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowLogging"
        Effect = "Allow"
        Principal = {
          Service = "logging.s3.amazonaws.com"
        }
        Action   = "s3:PutObject"
        Resource = "${aws_s3_bucket.s3_access_log_shared_services.arn}/*"
      }
    ]
  })
}


