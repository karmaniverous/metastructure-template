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
# DEVELOPMENT ACCOUNT POLICIES
###############################################################################

###############################################################################
# Add TerraformStateWriter policy to Development Account.
###############################################################################
resource "aws_iam_policy" "dev_terraform_state_writer" {
  name        = "TerraformStateWriter"
  provider    = aws.dev
  description = "Some description."
  policy      = data.aws_iam_policy_document.terraform_state_writer.json
}

###############################################################################
# Add UnprotectedResourceWriter policy to Development Account.
###############################################################################
resource "aws_iam_policy" "dev_unprotected_resource_writer" {
  name        = "UnprotectedResourceWriter"
  provider    = aws.dev
  description = "Some description."
  policy      = data.aws_iam_policy_document.unprotected_resource_writer.json
}

###############################################################################
# MASTER ACCOUNT POLICIES
###############################################################################

###############################################################################
# Add TerraformStateWriter policy to Master Account.
###############################################################################
resource "aws_iam_policy" "master_terraform_state_writer" {
  name        = "TerraformStateWriter"
  provider    = aws.master
  description = "Some description."
  policy      = data.aws_iam_policy_document.terraform_state_writer.json
}

###############################################################################
# Add UnprotectedResourceWriter policy to Master Account.
###############################################################################
resource "aws_iam_policy" "master_unprotected_resource_writer" {
  name        = "UnprotectedResourceWriter"
  provider    = aws.master
  description = "Some description."
  policy      = data.aws_iam_policy_document.unprotected_resource_writer.json
}

###############################################################################
# PRODUCTION ACCOUNT POLICIES
###############################################################################

###############################################################################
# Add TerraformStateWriter policy to Production Account.
###############################################################################
resource "aws_iam_policy" "prod_terraform_state_writer" {
  name        = "TerraformStateWriter"
  provider    = aws.prod
  description = "Some description."
  policy      = data.aws_iam_policy_document.terraform_state_writer.json
}

###############################################################################
# Add UnprotectedResourceWriter policy to Production Account.
###############################################################################
resource "aws_iam_policy" "prod_unprotected_resource_writer" {
  name        = "UnprotectedResourceWriter"
  provider    = aws.prod
  description = "Some description."
  policy      = data.aws_iam_policy_document.unprotected_resource_writer.json
}

###############################################################################
# TESTING ACCOUNT POLICIES
###############################################################################

###############################################################################
# Add TerraformStateWriter policy to Testing Account.
###############################################################################
resource "aws_iam_policy" "test_terraform_state_writer" {
  name        = "TerraformStateWriter"
  provider    = aws.test
  description = "Some description."
  policy      = data.aws_iam_policy_document.terraform_state_writer.json
}

###############################################################################
# Add UnprotectedResourceWriter policy to Testing Account.
###############################################################################
resource "aws_iam_policy" "test_unprotected_resource_writer" {
  name        = "UnprotectedResourceWriter"
  provider    = aws.test
  description = "Some description."
  policy      = data.aws_iam_policy_document.unprotected_resource_writer.json
}

###############################################################################
# SHARED SERVICES ACCOUNT POLICIES
###############################################################################

###############################################################################
# Add TerraformStateWriter policy to Shared Services Account.
###############################################################################
resource "aws_iam_policy" "shared_services_terraform_state_writer" {
  name        = "TerraformStateWriter"
  provider    = aws.shared_services
  description = "Some description."
  policy      = data.aws_iam_policy_document.terraform_state_writer.json
}

###############################################################################
# Add UnprotectedResourceWriter policy to Shared Services Account.
###############################################################################
resource "aws_iam_policy" "shared_services_unprotected_resource_writer" {
  name        = "UnprotectedResourceWriter"
  provider    = aws.shared_services
  description = "Some description."
  policy      = data.aws_iam_policy_document.unprotected_resource_writer.json
}


###############################################################################
# TERRAFORM ADMIN PERMISSION SET POLICIES
###############################################################################

###############################################################################
# Add AdministratorAccess policy to TerraformAdmin permission set.
###############################################################################
resource "aws_ssoadmin_managed_policy_attachment" "terraform_admin_administrator_access" {
  managed_policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  instance_arn       = local.sso_arn
  permission_set_arn = aws_ssoadmin_permission_set.permission_sets["terraform_admin"].arn
}

###############################################################################
# Add TerraformStateWriter policy to TerraformAdmin permission set.
###############################################################################
resource "aws_ssoadmin_customer_managed_policy_attachment" "terraform_admin_terraform_state_writer" {
  customer_managed_policy_reference {
    name = "TerraformStateWriter"
  }
  instance_arn       = local.sso_arn
  permission_set_arn = aws_ssoadmin_permission_set.permission_sets["terraform_admin"].arn
  depends_on         = [
    aws_iam_policy.dev_terraform_state_writer,
    aws_iam_policy.master_terraform_state_writer,
    aws_iam_policy.prod_terraform_state_writer,
    aws_iam_policy.test_terraform_state_writer,
    aws_iam_policy.shared_services_terraform_state_writer
  ]
}

###############################################################################
# TERRAFORM DEPLOYMENT PERMISSION SET POLICIES
###############################################################################

###############################################################################
# Add UnprotectedResourceWriter policy to terraform_deployment permission set.
###############################################################################
resource "aws_ssoadmin_customer_managed_policy_attachment" "terraform_deployment_unprotected_resource_writer" {
  customer_managed_policy_reference {
    name = "UnprotectedResourceWriter"
  }
  instance_arn       = local.sso_arn
  permission_set_arn = aws_ssoadmin_permission_set.permission_sets["terraform_deployment"].arn
  depends_on         = [
    aws_iam_policy.dev_unprotected_resource_writer,
    aws_iam_policy.master_unprotected_resource_writer,
    aws_iam_policy.prod_unprotected_resource_writer,
    aws_iam_policy.test_unprotected_resource_writer,
    aws_iam_policy.shared_services_unprotected_resource_writer
  ]
}

###############################################################################
# Add TerraformStateWriter policy to terraform_deployment permission set.
###############################################################################
resource "aws_ssoadmin_customer_managed_policy_attachment" "terraform_deployment_terraform_state_writer" {
  customer_managed_policy_reference {
    name = "TerraformStateWriter"
  }
  instance_arn       = local.sso_arn
  permission_set_arn = aws_ssoadmin_permission_set.permission_sets["terraform_deployment"].arn
  depends_on         = [
    aws_iam_policy.dev_terraform_state_writer,
    aws_iam_policy.master_terraform_state_writer,
    aws_iam_policy.prod_terraform_state_writer,
    aws_iam_policy.test_terraform_state_writer,
    aws_iam_policy.shared_services_terraform_state_writer
  ]
}

###############################################################################
# TERRAFORM ADMIN GROUP PERMISSION SETS
###############################################################################

###############################################################################
# Assign permission sets to dev for the terraform_admin group.
###############################################################################
resource "aws_ssoadmin_account_assignment" "terraform_admin_dev" {
  count              = length(module.global.config.sso.groups["terraform_admin"].account_permission_sets["dev"])
  instance_arn       = local.sso_arn
  permission_set_arn = aws_ssoadmin_permission_set.permission_sets[module.global.config.sso.groups["terraform_admin"].account_permission_sets["dev"][count.index]].arn
  principal_id       = aws_identitystore_group.groups["terraform_admin"].group_id
  principal_type     = "GROUP"
  target_id          = aws_organizations_account.accounts["dev"].id
  target_type        = "AWS_ACCOUNT"
  depends_on         = [
    aws_ssoadmin_customer_managed_policy_attachment.terraform_admin_terraform_state_writer
  ]
}

###############################################################################
# Assign permission sets to master for the terraform_admin group.
###############################################################################
resource "aws_ssoadmin_account_assignment" "terraform_admin_master" {
  count              = length(module.global.config.sso.groups["terraform_admin"].account_permission_sets["master"])
  instance_arn       = local.sso_arn
  permission_set_arn = aws_ssoadmin_permission_set.permission_sets[module.global.config.sso.groups["terraform_admin"].account_permission_sets["master"][count.index]].arn
  principal_id       = aws_identitystore_group.groups["terraform_admin"].group_id
  principal_type     = "GROUP"
  target_id          = aws_organizations_account.accounts["master"].id
  target_type        = "AWS_ACCOUNT"
  depends_on         = [
    aws_ssoadmin_customer_managed_policy_attachment.terraform_admin_terraform_state_writer
  ]
}

###############################################################################
# Assign permission sets to prod for the terraform_admin group.
###############################################################################
resource "aws_ssoadmin_account_assignment" "terraform_admin_prod" {
  count              = length(module.global.config.sso.groups["terraform_admin"].account_permission_sets["prod"])
  instance_arn       = local.sso_arn
  permission_set_arn = aws_ssoadmin_permission_set.permission_sets[module.global.config.sso.groups["terraform_admin"].account_permission_sets["prod"][count.index]].arn
  principal_id       = aws_identitystore_group.groups["terraform_admin"].group_id
  principal_type     = "GROUP"
  target_id          = aws_organizations_account.accounts["prod"].id
  target_type        = "AWS_ACCOUNT"
  depends_on         = [
    aws_ssoadmin_customer_managed_policy_attachment.terraform_admin_terraform_state_writer
  ]
}

###############################################################################
# Assign permission sets to test for the terraform_admin group.
###############################################################################
resource "aws_ssoadmin_account_assignment" "terraform_admin_test" {
  count              = length(module.global.config.sso.groups["terraform_admin"].account_permission_sets["test"])
  instance_arn       = local.sso_arn
  permission_set_arn = aws_ssoadmin_permission_set.permission_sets[module.global.config.sso.groups["terraform_admin"].account_permission_sets["test"][count.index]].arn
  principal_id       = aws_identitystore_group.groups["terraform_admin"].group_id
  principal_type     = "GROUP"
  target_id          = aws_organizations_account.accounts["test"].id
  target_type        = "AWS_ACCOUNT"
  depends_on         = [
    aws_ssoadmin_customer_managed_policy_attachment.terraform_admin_terraform_state_writer
  ]
}

###############################################################################
# Assign permission sets to shared_services for the terraform_admin group.
###############################################################################
resource "aws_ssoadmin_account_assignment" "terraform_admin_shared_services" {
  count              = length(module.global.config.sso.groups["terraform_admin"].account_permission_sets["shared_services"])
  instance_arn       = local.sso_arn
  permission_set_arn = aws_ssoadmin_permission_set.permission_sets[module.global.config.sso.groups["terraform_admin"].account_permission_sets["shared_services"][count.index]].arn
  principal_id       = aws_identitystore_group.groups["terraform_admin"].group_id
  principal_type     = "GROUP"
  target_id          = aws_organizations_account.accounts["shared_services"].id
  target_type        = "AWS_ACCOUNT"
  depends_on         = [
    aws_ssoadmin_customer_managed_policy_attachment.terraform_admin_terraform_state_writer
  ]
}


###############################################################################
# TERRAFORM DEPLOYMENT GROUP PERMISSION SETS
###############################################################################

###############################################################################
# Assign permission sets to dev for the terraform_deployment group.
###############################################################################
resource "aws_ssoadmin_account_assignment" "terraform_deployment_dev" {
  count              = length(module.global.config.sso.groups["terraform_deployment"].account_permission_sets["dev"])
  instance_arn       = local.sso_arn
  permission_set_arn = aws_ssoadmin_permission_set.permission_sets[module.global.config.sso.groups["terraform_deployment"].account_permission_sets["dev"][count.index]].arn
  principal_id       = aws_identitystore_group.groups["terraform_deployment"].group_id
  principal_type     = "GROUP"
  target_id          = aws_organizations_account.accounts["dev"].id
  target_type        = "AWS_ACCOUNT"
  depends_on         = [
    aws_ssoadmin_customer_managed_policy_attachment.terraform_deployment_terraform_state_writer
  ]
}

###############################################################################
# Assign permission sets to master for the terraform_deployment group.
###############################################################################
resource "aws_ssoadmin_account_assignment" "terraform_deployment_master" {
  count              = length(module.global.config.sso.groups["terraform_deployment"].account_permission_sets["master"])
  instance_arn       = local.sso_arn
  permission_set_arn = aws_ssoadmin_permission_set.permission_sets[module.global.config.sso.groups["terraform_deployment"].account_permission_sets["master"][count.index]].arn
  principal_id       = aws_identitystore_group.groups["terraform_deployment"].group_id
  principal_type     = "GROUP"
  target_id          = aws_organizations_account.accounts["master"].id
  target_type        = "AWS_ACCOUNT"
  depends_on         = [
    aws_ssoadmin_customer_managed_policy_attachment.terraform_deployment_terraform_state_writer
  ]
}

###############################################################################
# Assign permission sets to prod for the terraform_deployment group.
###############################################################################
resource "aws_ssoadmin_account_assignment" "terraform_deployment_prod" {
  count              = length(module.global.config.sso.groups["terraform_deployment"].account_permission_sets["prod"])
  instance_arn       = local.sso_arn
  permission_set_arn = aws_ssoadmin_permission_set.permission_sets[module.global.config.sso.groups["terraform_deployment"].account_permission_sets["prod"][count.index]].arn
  principal_id       = aws_identitystore_group.groups["terraform_deployment"].group_id
  principal_type     = "GROUP"
  target_id          = aws_organizations_account.accounts["prod"].id
  target_type        = "AWS_ACCOUNT"
  depends_on         = [
    aws_ssoadmin_customer_managed_policy_attachment.terraform_deployment_terraform_state_writer
  ]
}

###############################################################################
# Assign permission sets to test for the terraform_deployment group.
###############################################################################
resource "aws_ssoadmin_account_assignment" "terraform_deployment_test" {
  count              = length(module.global.config.sso.groups["terraform_deployment"].account_permission_sets["test"])
  instance_arn       = local.sso_arn
  permission_set_arn = aws_ssoadmin_permission_set.permission_sets[module.global.config.sso.groups["terraform_deployment"].account_permission_sets["test"][count.index]].arn
  principal_id       = aws_identitystore_group.groups["terraform_deployment"].group_id
  principal_type     = "GROUP"
  target_id          = aws_organizations_account.accounts["test"].id
  target_type        = "AWS_ACCOUNT"
  depends_on         = [
    aws_ssoadmin_customer_managed_policy_attachment.terraform_deployment_terraform_state_writer
  ]
}

###############################################################################
# Assign permission sets to shared_services for the terraform_deployment group.
###############################################################################
resource "aws_ssoadmin_account_assignment" "terraform_deployment_shared_services" {
  count              = length(module.global.config.sso.groups["terraform_deployment"].account_permission_sets["shared_services"])
  instance_arn       = local.sso_arn
  permission_set_arn = aws_ssoadmin_permission_set.permission_sets[module.global.config.sso.groups["terraform_deployment"].account_permission_sets["shared_services"][count.index]].arn
  principal_id       = aws_identitystore_group.groups["terraform_deployment"].group_id
  principal_type     = "GROUP"
  target_id          = aws_organizations_account.accounts["shared_services"].id
  target_type        = "AWS_ACCOUNT"
  depends_on         = [
    aws_ssoadmin_customer_managed_policy_attachment.terraform_deployment_terraform_state_writer
  ]
}



