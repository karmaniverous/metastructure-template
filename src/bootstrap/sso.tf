###############################################################################
# Get the organization's SSO instance.
###############################################################################
data "aws_ssoadmin_instances" "sso" {}

locals {
  sso_arn = tolist(data.aws_ssoadmin_instances.sso.arns)[0]
  sso_id  = tolist(data.aws_ssoadmin_instances.sso.identity_store_ids)[0]
}

###############################################################################
# Create a Terraform deployment SSO permission set.
###############################################################################
resource "aws_ssoadmin_permission_set" "terraform_deployment" {
  name         = "TerraformDeployment"
  instance_arn = local.sso_arn
}

###############################################################################
# Create a Terraform deployment SSO group.
###############################################################################
resource "aws_identitystore_group" "terraform_deployment" {
  identity_store_id = local.sso_id
  display_name      = "TerraformDeployment"
}

###############################################################################
# Assign all accounts to the Terraform admins group & permission set.
###############################################################################
resource "aws_ssoadmin_account_assignment" "terraform_deployment" {
  for_each           = aws_organizations_account.accounts
  instance_arn       = local.sso_arn
  permission_set_arn = aws_ssoadmin_permission_set.terraform_deployment.arn
  principal_id       = aws_identitystore_group.terraform_deployment.group_id
  principal_type     = "GROUP"
  target_id          = each.value.id
  target_type        = "AWS_ACCOUNT"
}

###############################################################################
# Assign the AdministratorAccess policy to the Terraform deployment permission
# set.
###############################################################################
resource "aws_ssoadmin_managed_policy_attachment" "terraform_deployment_to_terraform_deployment" {
  # Adding an explicit dependency on the account assignment resource will
  # allow the managed attachment to be safely destroyed prior to the removal
  # of the account assignment.
  depends_on = [aws_ssoadmin_account_assignment.terraform_deployment]

  instance_arn       = local.sso_arn
  managed_policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  permission_set_arn = aws_ssoadmin_permission_set.terraform_deployment.arn
}
