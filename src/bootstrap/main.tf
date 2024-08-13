/*
******************* DO NOT EDIT THIS NOTICE *****************
This legal notice is added to every supported source code
file at every commit. See the README for more info!                          
*************************************************************
*/

###############################################################################
# Create & import user bootstrap-admin.
###############################################################################
resource "aws_iam_user" "bootstrap_admin" {
  name = "bootstrap-admin"
}

import {
  to = aws_iam_user.bootstrap_admin
  id = "bootstrap-admin"
}

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
# Get the organization's SSO instance.
###############################################################################
data "aws_ssoadmin_instances" "sso" {}

locals {
  sso_arn = tolist(data.aws_ssoadmin_instances.sso.arns)[0]
  sso_id  = tolist(data.aws_ssoadmin_instances.sso.identity_store_ids)[0]
}

###############################################################################
# Create an sso_admin user & assign to the TerraformAdmin group.
###############################################################################
resource "aws_identitystore_user" "sso_admin" {
  display_name = "SSO Admin"
  emails {
    primary = true
    value   = "jscroft+${module.global.config.organization.tokens.namespace}-sso-admin@gmail.com"
  }
  identity_store_id = local.sso_id
  name {
    family_name = "Admin"
    given_name  = "SSO"
  }
  user_name = "sso-admin"
}

resource "aws_identitystore_group_membership" "sso_admin_terraform_admin" {
  identity_store_id = local.sso_id
  group_id          = aws_identitystore_group.terraform_admin.group_id
  member_id         = aws_identitystore_user.sso_admin.user_id
}

