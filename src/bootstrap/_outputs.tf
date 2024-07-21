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
#### LOOKUP ACCOUNT PERMISSION SET ROLES
###############################################################################
###############################################################################

###############################################################################
# ACCOUNT: DEVELOPMENT ACCOUNT 
###############################################################################

###############################################################################
# Permission Set: TerraformAdmin 
###############################################################################
data "aws_iam_roles" "dev_terraform_admin" {
  provider = aws.dev
  name_regex = "AWSReservedSSO_TerraformAdmin_.*"
}

###############################################################################
# Permission Set: TerraformDeployment 
###############################################################################
data "aws_iam_roles" "dev_terraform_deployment" {
  provider = aws.dev
  name_regex = "AWSReservedSSO_TerraformDeployment_.*"
}

###############################################################################
# ACCOUNT: MASTER ACCOUNT 
###############################################################################

###############################################################################
# Permission Set: TerraformAdmin 
###############################################################################
data "aws_iam_roles" "master_terraform_admin" {
  provider = aws.master
  name_regex = "AWSReservedSSO_TerraformAdmin_.*"
}

###############################################################################
# Permission Set: TerraformDeployment 
###############################################################################
data "aws_iam_roles" "master_terraform_deployment" {
  provider = aws.master
  name_regex = "AWSReservedSSO_TerraformDeployment_.*"
}

###############################################################################
# ACCOUNT: PRODUCTION ACCOUNT 
###############################################################################

###############################################################################
# Permission Set: TerraformAdmin 
###############################################################################
data "aws_iam_roles" "prod_terraform_admin" {
  provider = aws.prod
  name_regex = "AWSReservedSSO_TerraformAdmin_.*"
}

###############################################################################
# Permission Set: TerraformDeployment 
###############################################################################
data "aws_iam_roles" "prod_terraform_deployment" {
  provider = aws.prod
  name_regex = "AWSReservedSSO_TerraformDeployment_.*"
}

###############################################################################
# ACCOUNT: TESTING ACCOUNT 
###############################################################################

###############################################################################
# Permission Set: TerraformAdmin 
###############################################################################
data "aws_iam_roles" "test_terraform_admin" {
  provider = aws.test
  name_regex = "AWSReservedSSO_TerraformAdmin_.*"
}

###############################################################################
# Permission Set: TerraformDeployment 
###############################################################################
data "aws_iam_roles" "test_terraform_deployment" {
  provider = aws.test
  name_regex = "AWSReservedSSO_TerraformDeployment_.*"
}

###############################################################################
# ACCOUNT: SHARED SERVICES ACCOUNT 
###############################################################################

###############################################################################
# Permission Set: TerraformAdmin 
###############################################################################
data "aws_iam_roles" "shared_services_terraform_admin" {
  provider = aws.shared_services
  name_regex = "AWSReservedSSO_TerraformAdmin_.*"
}

###############################################################################
# Permission Set: TerraformDeployment 
###############################################################################
data "aws_iam_roles" "shared_services_terraform_deployment" {
  provider = aws.shared_services
  name_regex = "AWSReservedSSO_TerraformDeployment_.*"
}



###############################################################################
###############################################################################
#### GENERATE OUTPUT
###############################################################################
###############################################################################

output "accounts" {
  value = { 
    dev = {
      id = aws_organizations_account.dev.id 
      permission_set_roles = { 
        terraform_admin = one(data.aws_iam_roles.dev_terraform_admin.names) 
        terraform_deployment = one(data.aws_iam_roles.dev_terraform_deployment.names) 
      }
    } 
    master = {
      id = aws_organizations_account.master.id 
      permission_set_roles = { 
        terraform_admin = one(data.aws_iam_roles.master_terraform_admin.names) 
        terraform_deployment = one(data.aws_iam_roles.master_terraform_deployment.names) 
      }
    } 
    prod = {
      id = aws_organizations_account.prod.id 
      permission_set_roles = { 
        terraform_admin = one(data.aws_iam_roles.prod_terraform_admin.names) 
        terraform_deployment = one(data.aws_iam_roles.prod_terraform_deployment.names) 
      }
    } 
    test = {
      id = aws_organizations_account.test.id 
      permission_set_roles = { 
        terraform_admin = one(data.aws_iam_roles.test_terraform_admin.names) 
        terraform_deployment = one(data.aws_iam_roles.test_terraform_deployment.names) 
      }
    } 
    shared_services = {
      id = aws_organizations_account.shared_services.id 
      permission_set_roles = { 
        terraform_admin = one(data.aws_iam_roles.shared_services_terraform_admin.names) 
        terraform_deployment = one(data.aws_iam_roles.shared_services_terraform_deployment.names) 
      }
    } 
  }
}

output "organization" {
  value = { 
    id = aws_organizations_organization.org.id
  }
}

output "organizational_units" {
  value = { 
    dev = {
      id = aws_organizations_organizational_unit.dev.id
    } 
    infrastructure = {
      id = aws_organizations_organizational_unit.infrastructure.id
    } 
    prod = {
      id = aws_organizations_organizational_unit.prod.id
    } 
    security = {
      id = aws_organizations_organizational_unit.security.id
    } 
    test = {
      id = aws_organizations_organizational_unit.test.id
    } 
    workloads = {
      id = aws_organizations_organizational_unit.workloads.id
    } 
  }
}
