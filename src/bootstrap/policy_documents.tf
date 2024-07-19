/*
******************* DO NOT EDIT THIS NOTICE *****************
This legal notice is added to every supported source code
file at every commit. See the README for more info!                          
*************************************************************
*/

###############################################################################
# Policy document that permits creation & management of unprotected resources.
# Currently this policy allows access to ALL resources... it is effectively
# admin access. We need to cut this down. Be careful about DENY statements.
###############################################################################
data "aws_iam_policy_document" "unprotected_resource_writer" {
  statement {
    sid       = "AllowUnprotectedResourceManagement"
    effect    = "Allow"
    actions   = ["*"]
    resources = ["*"]
  }
}

###############################################################################
# Policy document that permits writing of Terraform state.
# Note the conditions that restrict access to the account that owns the state.
# This may not actually be necessary!
###############################################################################
data "aws_iam_policy_document" "terraform_state_writer" {
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
      "arn:aws:s3:::${module.global.config.terraform.state.bucket}",
      "arn:aws:s3:::${module.global.config.terraform.state.bucket}/*"
    ]
    condition {
      test     = "StringEquals"
      variable = "aws:SourceAccount"
      values   = [aws_organizations_account.accounts[module.global.config.terraform.state.account].id]
    }
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
      "arn:aws:dynamodb:${module.global.config.organization.aws_region}:${aws_organizations_account.accounts[module.global.config.terraform.state.account].id}:${module.global.config.terraform.state.lock_table}",
    ]
    condition {
      test     = "StringEquals"
      variable = "aws:SourceAccount"
      values   = [aws_organizations_account.accounts[module.global.config.terraform.state.account].id]
    }
  }
}

