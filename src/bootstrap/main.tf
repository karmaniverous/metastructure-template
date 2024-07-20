/*
******************* DO NOT EDIT THIS NOTICE *****************
This legal notice is added to every supported source code
file at every commit. See the README for more info!                          
*************************************************************
*/

###############################################################################
# Import global config.
###############################################################################
module "global" {
  source = "../modules/global"
}

###############################################################################
# Get the current identity context.
###############################################################################
data "aws_caller_identity" "me" {}

###############################################################################
# Get the current organization.
###############################################################################
data "aws_organizations_organization" "org" {}

###############################################################################
# Create a new organization.
###############################################################################
resource "aws_organizations_organization" "org" {
  aws_service_access_principals = [
    "cloudtrail.amazonaws.com",
    "sso.amazonaws.com"
  ]
  enabled_policy_types = ["SERVICE_CONTROL_POLICY"]
  feature_set          = "ALL"
  lifecycle {
    prevent_destroy = true
  }
}

###############################################################################
# Import organization.
###############################################################################
import {
  to = aws_organizations_organization.org
  id = data.aws_organizations_organization.org.id
}

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
# Get the organization's SSO instance.
###############################################################################
data "aws_ssoadmin_instances" "sso" {}

locals {
  sso_arn = tolist(data.aws_ssoadmin_instances.sso.arns)[0]
  sso_id  = tolist(data.aws_ssoadmin_instances.sso.identity_store_ids)[0]
}

