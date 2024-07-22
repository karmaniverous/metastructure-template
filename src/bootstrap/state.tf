/*
******************* DO NOT EDIT THIS NOTICE *****************
This legal notice is added to every supported source code
file at every commit. See the README for more info!                          
*************************************************************
*/

###############################################################################
# Create S3 state bucket on the Terraform state account.
###############################################################################
resource "aws_s3_bucket" "terraform_state" {
  provider = aws.terraform_state_account
  bucket   = module.global.config.terraform.state.bucket
}

###############################################################################
# Create DynamoDB state lock table on the Terraform state account.
###############################################################################
resource "aws_dynamodb_table" "terraform_state_lock" {
  provider     = aws.terraform_state_account
  name         = module.global.config.terraform.state.lock_table
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}

###############################################################################
# Permits writing of Terraform state.
###############################################################################
data "aws_iam_policy_document" "write_terraform_state_permissions" {
  statement {
    sid    = "TerraformStateBucketWrite"
    effect = "Allow"
    actions = [
      "s3:DeleteObject",
      "s3:GetObject",
      "s3:ListBucket",
      "s3:PutObject"
    ]
    resources = [
      "arn:aws:s3:::${aws_s3_bucket.terraform_state.bucket}",
      "arn:aws:s3:::${aws_s3_bucket.terraform_state.bucket}/*"
    ]
  }

  statement {
    sid    = "TerraformStateLockTableWrite"
    effect = "Allow"
    actions = [
      "dynamodb:DeleteItem",
      "dynamodb:GetItem",
      "dynamodb:PutItem",
      "dynamodb:Query",
      "dynamodb:Scan",
      "dynamodb:UpdateItem"
    ]
    resources = [
      "arn:aws:dynamodb:::${aws_dynamodb_table.terraform_state_lock.name}",
    ]
  }
}

###############################################################################
# Policy at Terraform state account that permits writing of Terraform state.
###############################################################################
resource "aws_iam_policy" "write_terraform_state" {
  provider    = aws.terraform_state_account
  name        = "WriteTerraformState"
  description = "Permits writing of Terraform state."
  policy      = data.aws_iam_policy_document.write_terraform_state_permissions.json
}

###############################################################################
# Permits role assumption by SSO Terraform state writer roles.
###############################################################################
data "aws_iam_policy_document" "sso_terraform_state_writer_assume" {
  statement {
    sid     = "SSOTerraformStateWriterAssume"
    effect  = "Allow"
    actions = ["sts:AssumeRole", "sts:TagSession"]
    principals {
      type        = "AWS"
      identifiers = ["*"]
      #   identifiers = ["arn:aws:sts::*:assumed-role/AWSReservedSSO_Terraform/terraform"]
    }
  }
}

###############################################################################
# Create TerraformStateWriter role at Terraform state account and allow it to 
# be assumed by SSO Terraform state writer roles.
###############################################################################
resource "aws_iam_role" "terraform_state_writer" {
  provider           = aws.terraform_state_account
  name               = "TerraformStateWriter"
  assume_role_policy = data.aws_iam_policy_document.sso_terraform_state_writer_assume.json
}

###############################################################################
# Attach WriteTerraformState policy to TerraformStateWriter role at Terraform
# state account. 
###############################################################################
resource "aws_iam_role_policy_attachment" "terraform_state_writer_permissions" {
  provider   = aws.terraform_state_account
  role       = aws_iam_role.terraform_state_writer.name
  policy_arn = aws_iam_policy.write_terraform_state.arn
}


