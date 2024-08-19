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

data "aws_iam_policy_document" "sso_terraform_state_writer" {
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
      "arn:aws:s3:::namespace-000-terraform-state",
      "arn:aws:s3:::namespace-000-terraform-state/*"
    ]
    condition {
      test     = "StringEquals"
      variable = "aws:SourceAccount"
      values   = [aws_organizations_account.shared_services.id]
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
      "arn:aws:dynamodb:${aws_organizations_account.shared_services.id}:terraform-state-lock",
    ]
    condition {
      test     = "StringEquals"
      variable = "aws:SourceAccount"
      values   = [aws_organizations_account.shared_services.id]
    }
  }
}
