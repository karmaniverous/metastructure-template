/*
******************* DO NOT EDIT THIS NOTICE *****************
This legal notice is added to every supported source code
file at every commit. See the README for more info!                          
*************************************************************
*/

###############################################################################
# Get the organization's SSO instance.
###############################################################################
data "aws_ssoadmin_instances" "sso" {}

locals {
  sso_arn = tolist(data.aws_ssoadmin_instances.sso.arns)[0]
  sso_id  = tolist(data.aws_ssoadmin_instances.sso.identity_store_ids)[0]
}

###############################################################################
# Create SSO groups.
###############################################################################
resource "aws_identitystore_group" "groups" {
  for_each          = module.global.config.sso.groups
  description       = each.value.description
  display_name      = each.key
  identity_store_id = local.sso_id
}

###############################################################################
# Create SSO permission sets.
###############################################################################
resource "aws_ssoadmin_permission_set" "permission_sets" {
  for_each     = module.global.config.sso.permission_sets
  description  = each.value.description
  name         = each.key
  instance_arn = local.sso_arn
}
