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
#### POLICY DOCUMENTS
###############################################################################
###############################################################################

###############################################################################
# Permits creation & management of unprotected resources.
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
# Permits writing of Terraform state.
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
      "arn:aws:s3:::metastructure-001-terraform-state",
      "arn:aws:s3:::metastructure-001-terraform-state/*"
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

###############################################################################
###############################################################################
#### ACCOUNT POLICIES
###############################################################################
###############################################################################

###############################################################################
# ACCOUNT: DEVELOPMENT ACCOUNT
###############################################################################

###############################################################################
# Add policy SSOTerraformStateWriter to account Development Account.
###############################################################################
resource "aws_iam_policy" "dev_sso_terraform_state_writer" {
  name        = "SSOTerraformStateWriter"
  provider    = aws.dev
  description = "Some description."
  policy      = data.aws_iam_policy_document.sso_terraform_state_writer.json
}

###############################################################################
# Add policy UnprotectedResourceWriter to account Development Account.
###############################################################################
resource "aws_iam_policy" "dev_unprotected_resource_writer" {
  name        = "UnprotectedResourceWriter"
  provider    = aws.dev
  description = "Some description."
  policy      = data.aws_iam_policy_document.unprotected_resource_writer.json
}

###############################################################################
# ACCOUNT: LOG ARCHIVE ACCOUNT
###############################################################################

###############################################################################
# Add policy SSOTerraformStateWriter to account Log Archive Account.
###############################################################################
resource "aws_iam_policy" "log_archive_sso_terraform_state_writer" {
  name        = "SSOTerraformStateWriter"
  provider    = aws.log_archive
  description = "Some description."
  policy      = data.aws_iam_policy_document.sso_terraform_state_writer.json
}

###############################################################################
# Add policy UnprotectedResourceWriter to account Log Archive Account.
###############################################################################
resource "aws_iam_policy" "log_archive_unprotected_resource_writer" {
  name        = "UnprotectedResourceWriter"
  provider    = aws.log_archive
  description = "Some description."
  policy      = data.aws_iam_policy_document.unprotected_resource_writer.json
}

###############################################################################
# ACCOUNT: MASTER ACCOUNT
###############################################################################

###############################################################################
# Add policy SSOTerraformStateWriter to account Master Account.
###############################################################################
resource "aws_iam_policy" "master_sso_terraform_state_writer" {
  name        = "SSOTerraformStateWriter"
  provider    = aws.master
  description = "Some description."
  policy      = data.aws_iam_policy_document.sso_terraform_state_writer.json
}

###############################################################################
# Add policy UnprotectedResourceWriter to account Master Account.
###############################################################################
resource "aws_iam_policy" "master_unprotected_resource_writer" {
  name        = "UnprotectedResourceWriter"
  provider    = aws.master
  description = "Some description."
  policy      = data.aws_iam_policy_document.unprotected_resource_writer.json
}

###############################################################################
# ACCOUNT: PRODUCTION ACCOUNT
###############################################################################

###############################################################################
# Add policy SSOTerraformStateWriter to account Production Account.
###############################################################################
resource "aws_iam_policy" "prod_sso_terraform_state_writer" {
  name        = "SSOTerraformStateWriter"
  provider    = aws.prod
  description = "Some description."
  policy      = data.aws_iam_policy_document.sso_terraform_state_writer.json
}

###############################################################################
# Add policy UnprotectedResourceWriter to account Production Account.
###############################################################################
resource "aws_iam_policy" "prod_unprotected_resource_writer" {
  name        = "UnprotectedResourceWriter"
  provider    = aws.prod
  description = "Some description."
  policy      = data.aws_iam_policy_document.unprotected_resource_writer.json
}

###############################################################################
# ACCOUNT: TESTING ACCOUNT
###############################################################################

###############################################################################
# Add policy SSOTerraformStateWriter to account Testing Account.
###############################################################################
resource "aws_iam_policy" "test_sso_terraform_state_writer" {
  name        = "SSOTerraformStateWriter"
  provider    = aws.test
  description = "Some description."
  policy      = data.aws_iam_policy_document.sso_terraform_state_writer.json
}

###############################################################################
# Add policy UnprotectedResourceWriter to account Testing Account.
###############################################################################
resource "aws_iam_policy" "test_unprotected_resource_writer" {
  name        = "UnprotectedResourceWriter"
  provider    = aws.test
  description = "Some description."
  policy      = data.aws_iam_policy_document.unprotected_resource_writer.json
}

###############################################################################
# ACCOUNT: SHARED SERVICES ACCOUNT
###############################################################################

###############################################################################
# Add policy SSOTerraformStateWriter to account Shared Services Account.
###############################################################################
resource "aws_iam_policy" "shared_services_sso_terraform_state_writer" {
  name        = "SSOTerraformStateWriter"
  provider    = aws.shared_services
  description = "Some description."
  policy      = data.aws_iam_policy_document.sso_terraform_state_writer.json
}

###############################################################################
# Add policy UnprotectedResourceWriter to account Shared Services Account.
###############################################################################
resource "aws_iam_policy" "shared_services_unprotected_resource_writer" {
  name        = "UnprotectedResourceWriter"
  provider    = aws.shared_services
  description = "Some description."
  policy      = data.aws_iam_policy_document.unprotected_resource_writer.json
}


###############################################################################
###############################################################################
#### SSO PERMISSION SETS
###############################################################################
###############################################################################

###############################################################################
# PERMISSION SET: TERRAFORM ADMIN 
###############################################################################

###############################################################################
# Create permission set TerraformAdmin.
###############################################################################
resource "aws_ssoadmin_permission_set" "terraform_admin" {
  description  = "Permits creation & management of all resources."
  name         = "TerraformAdmin"
  instance_arn = local.sso_arn
}

###############################################################################
# Add policy AdministratorAccess to permission set TerraformAdmin.
###############################################################################
resource "aws_ssoadmin_managed_policy_attachment" "terraform_admin_administrator_access" {
  managed_policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  instance_arn       = local.sso_arn
  permission_set_arn = aws_ssoadmin_permission_set.terraform_admin.arn
}

###############################################################################
# Add policy SSOTerraformStateWriter to permission set TerraformAdmin.
###############################################################################
resource "aws_ssoadmin_customer_managed_policy_attachment" "terraform_admin_sso_terraform_state_writer" {
  customer_managed_policy_reference {
    name = "SSOTerraformStateWriter"
  }
  instance_arn       = local.sso_arn
  permission_set_arn = aws_ssoadmin_permission_set.terraform_admin.arn
  depends_on = [
    aws_iam_policy.dev_sso_terraform_state_writer,
    aws_iam_policy.log_archive_sso_terraform_state_writer,
    aws_iam_policy.master_sso_terraform_state_writer,
    aws_iam_policy.prod_sso_terraform_state_writer,
    aws_iam_policy.test_sso_terraform_state_writer,
    aws_iam_policy.shared_services_sso_terraform_state_writer
  ]
}
###############################################################################
# PERMISSION SET: TERRAFORM DEPLOYMENT 
###############################################################################

###############################################################################
# Create permission set TerraformDeployment.
###############################################################################
resource "aws_ssoadmin_permission_set" "terraform_deployment" {
  description  = "Permits creation & management of all unprotected resources."
  name         = "TerraformDeployment"
  instance_arn = local.sso_arn
}

###############################################################################
# Add policy UnprotectedResourceWriter to permission set TerraformDeployment.
###############################################################################
resource "aws_ssoadmin_customer_managed_policy_attachment" "terraform_deployment_unprotected_resource_writer" {
  customer_managed_policy_reference {
    name = "UnprotectedResourceWriter"
  }
  instance_arn       = local.sso_arn
  permission_set_arn = aws_ssoadmin_permission_set.terraform_deployment.arn
  depends_on = [
    aws_iam_policy.dev_unprotected_resource_writer,
    aws_iam_policy.log_archive_unprotected_resource_writer,
    aws_iam_policy.master_unprotected_resource_writer,
    aws_iam_policy.prod_unprotected_resource_writer,
    aws_iam_policy.test_unprotected_resource_writer,
    aws_iam_policy.shared_services_unprotected_resource_writer
  ]
}

###############################################################################
# Add policy SSOTerraformStateWriter to permission set TerraformDeployment.
###############################################################################
resource "aws_ssoadmin_customer_managed_policy_attachment" "terraform_deployment_sso_terraform_state_writer" {
  customer_managed_policy_reference {
    name = "SSOTerraformStateWriter"
  }
  instance_arn       = local.sso_arn
  permission_set_arn = aws_ssoadmin_permission_set.terraform_deployment.arn
  depends_on = [
    aws_iam_policy.dev_sso_terraform_state_writer,
    aws_iam_policy.log_archive_sso_terraform_state_writer,
    aws_iam_policy.master_sso_terraform_state_writer,
    aws_iam_policy.prod_sso_terraform_state_writer,
    aws_iam_policy.test_sso_terraform_state_writer,
    aws_iam_policy.shared_services_sso_terraform_state_writer
  ]
}

###############################################################################
###############################################################################
#### SSO GROUPS
###############################################################################
###############################################################################

###############################################################################
# Create group TerraformAdmin.
###############################################################################
resource "aws_identitystore_group" "terraform_admin" {
  description       = "Terraform administrators can create & manage all resources in all accounts."
  display_name      = "TerraformAdmin"
  identity_store_id = local.sso_id
}

###############################################################################
# GROUP TERRAFORM ADMIN ACCOUNT PERMISSION SETS
###############################################################################

###############################################################################
# Assign permission set terraform_admin to account dev for group terraform_admin.
###############################################################################
resource "aws_ssoadmin_account_assignment" "terraform_admin_dev_terraform_admin" {
  instance_arn       = local.sso_arn
  permission_set_arn = aws_ssoadmin_permission_set.terraform_admin.arn
  principal_id       = aws_identitystore_group.terraform_admin.group_id
  principal_type     = "GROUP"
  target_id          = aws_organizations_account.dev.id
  target_type        = "AWS_ACCOUNT"
  depends_on = [
    aws_ssoadmin_customer_managed_policy_attachment.terraform_admin_sso_terraform_state_writer
  ]
}

###############################################################################
# Assign permission set terraform_admin to account log_archive for group terraform_admin.
###############################################################################
resource "aws_ssoadmin_account_assignment" "terraform_admin_log_archive_terraform_admin" {
  instance_arn       = local.sso_arn
  permission_set_arn = aws_ssoadmin_permission_set.terraform_admin.arn
  principal_id       = aws_identitystore_group.terraform_admin.group_id
  principal_type     = "GROUP"
  target_id          = aws_organizations_account.log_archive.id
  target_type        = "AWS_ACCOUNT"
  depends_on = [
    aws_ssoadmin_customer_managed_policy_attachment.terraform_admin_sso_terraform_state_writer
  ]
}

###############################################################################
# Assign permission set terraform_admin to account master for group terraform_admin.
###############################################################################
resource "aws_ssoadmin_account_assignment" "terraform_admin_master_terraform_admin" {
  instance_arn       = local.sso_arn
  permission_set_arn = aws_ssoadmin_permission_set.terraform_admin.arn
  principal_id       = aws_identitystore_group.terraform_admin.group_id
  principal_type     = "GROUP"
  target_id          = aws_organizations_account.master.id
  target_type        = "AWS_ACCOUNT"
  depends_on = [
    aws_ssoadmin_customer_managed_policy_attachment.terraform_admin_sso_terraform_state_writer
  ]
}

###############################################################################
# Assign permission set terraform_admin to account prod for group terraform_admin.
###############################################################################
resource "aws_ssoadmin_account_assignment" "terraform_admin_prod_terraform_admin" {
  instance_arn       = local.sso_arn
  permission_set_arn = aws_ssoadmin_permission_set.terraform_admin.arn
  principal_id       = aws_identitystore_group.terraform_admin.group_id
  principal_type     = "GROUP"
  target_id          = aws_organizations_account.prod.id
  target_type        = "AWS_ACCOUNT"
  depends_on = [
    aws_ssoadmin_customer_managed_policy_attachment.terraform_admin_sso_terraform_state_writer
  ]
}

###############################################################################
# Assign permission set terraform_admin to account test for group terraform_admin.
###############################################################################
resource "aws_ssoadmin_account_assignment" "terraform_admin_test_terraform_admin" {
  instance_arn       = local.sso_arn
  permission_set_arn = aws_ssoadmin_permission_set.terraform_admin.arn
  principal_id       = aws_identitystore_group.terraform_admin.group_id
  principal_type     = "GROUP"
  target_id          = aws_organizations_account.test.id
  target_type        = "AWS_ACCOUNT"
  depends_on = [
    aws_ssoadmin_customer_managed_policy_attachment.terraform_admin_sso_terraform_state_writer
  ]
}

###############################################################################
# Assign permission set terraform_admin to account shared_services for group terraform_admin.
###############################################################################
resource "aws_ssoadmin_account_assignment" "terraform_admin_shared_services_terraform_admin" {
  instance_arn       = local.sso_arn
  permission_set_arn = aws_ssoadmin_permission_set.terraform_admin.arn
  principal_id       = aws_identitystore_group.terraform_admin.group_id
  principal_type     = "GROUP"
  target_id          = aws_organizations_account.shared_services.id
  target_type        = "AWS_ACCOUNT"
  depends_on = [
    aws_ssoadmin_customer_managed_policy_attachment.terraform_admin_sso_terraform_state_writer
  ]
}
###############################################################################
# Create group TerraformDeployment.
###############################################################################
resource "aws_identitystore_group" "terraform_deployment" {
  description       = "Terraform deployment users can create & manage all unprotected resources in all accounts."
  display_name      = "TerraformDeployment"
  identity_store_id = local.sso_id
}

###############################################################################
# GROUP TERRAFORM DEPLOYMENT ACCOUNT PERMISSION SETS
###############################################################################

###############################################################################
# Assign permission set terraform_deployment to account dev for group terraform_deployment.
###############################################################################
resource "aws_ssoadmin_account_assignment" "terraform_deployment_dev_terraform_deployment" {
  instance_arn       = local.sso_arn
  permission_set_arn = aws_ssoadmin_permission_set.terraform_deployment.arn
  principal_id       = aws_identitystore_group.terraform_deployment.group_id
  principal_type     = "GROUP"
  target_id          = aws_organizations_account.dev.id
  target_type        = "AWS_ACCOUNT"
  depends_on = [
    aws_ssoadmin_customer_managed_policy_attachment.terraform_deployment_sso_terraform_state_writer
  ]
}

###############################################################################
# Assign permission set terraform_deployment to account log_archive for group terraform_deployment.
###############################################################################
resource "aws_ssoadmin_account_assignment" "terraform_deployment_log_archive_terraform_deployment" {
  instance_arn       = local.sso_arn
  permission_set_arn = aws_ssoadmin_permission_set.terraform_deployment.arn
  principal_id       = aws_identitystore_group.terraform_deployment.group_id
  principal_type     = "GROUP"
  target_id          = aws_organizations_account.log_archive.id
  target_type        = "AWS_ACCOUNT"
  depends_on = [
    aws_ssoadmin_customer_managed_policy_attachment.terraform_deployment_sso_terraform_state_writer
  ]
}

###############################################################################
# Assign permission set terraform_deployment to account master for group terraform_deployment.
###############################################################################
resource "aws_ssoadmin_account_assignment" "terraform_deployment_master_terraform_deployment" {
  instance_arn       = local.sso_arn
  permission_set_arn = aws_ssoadmin_permission_set.terraform_deployment.arn
  principal_id       = aws_identitystore_group.terraform_deployment.group_id
  principal_type     = "GROUP"
  target_id          = aws_organizations_account.master.id
  target_type        = "AWS_ACCOUNT"
  depends_on = [
    aws_ssoadmin_customer_managed_policy_attachment.terraform_deployment_sso_terraform_state_writer
  ]
}

###############################################################################
# Assign permission set terraform_deployment to account prod for group terraform_deployment.
###############################################################################
resource "aws_ssoadmin_account_assignment" "terraform_deployment_prod_terraform_deployment" {
  instance_arn       = local.sso_arn
  permission_set_arn = aws_ssoadmin_permission_set.terraform_deployment.arn
  principal_id       = aws_identitystore_group.terraform_deployment.group_id
  principal_type     = "GROUP"
  target_id          = aws_organizations_account.prod.id
  target_type        = "AWS_ACCOUNT"
  depends_on = [
    aws_ssoadmin_customer_managed_policy_attachment.terraform_deployment_sso_terraform_state_writer
  ]
}

###############################################################################
# Assign permission set terraform_deployment to account test for group terraform_deployment.
###############################################################################
resource "aws_ssoadmin_account_assignment" "terraform_deployment_test_terraform_deployment" {
  instance_arn       = local.sso_arn
  permission_set_arn = aws_ssoadmin_permission_set.terraform_deployment.arn
  principal_id       = aws_identitystore_group.terraform_deployment.group_id
  principal_type     = "GROUP"
  target_id          = aws_organizations_account.test.id
  target_type        = "AWS_ACCOUNT"
  depends_on = [
    aws_ssoadmin_customer_managed_policy_attachment.terraform_deployment_sso_terraform_state_writer
  ]
}

###############################################################################
# Assign permission set terraform_deployment to account shared_services for group terraform_deployment.
###############################################################################
resource "aws_ssoadmin_account_assignment" "terraform_deployment_shared_services_terraform_deployment" {
  instance_arn       = local.sso_arn
  permission_set_arn = aws_ssoadmin_permission_set.terraform_deployment.arn
  principal_id       = aws_identitystore_group.terraform_deployment.group_id
  principal_type     = "GROUP"
  target_id          = aws_organizations_account.shared_services.id
  target_type        = "AWS_ACCOUNT"
  depends_on = [
    aws_ssoadmin_customer_managed_policy_attachment.terraform_deployment_sso_terraform_state_writer
  ]
}


