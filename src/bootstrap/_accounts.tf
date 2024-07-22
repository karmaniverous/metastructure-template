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
# ORGANIZATIONAL UNITS 
###############################################################################

###############################################################################
# Create Dev Workloads OU. 
###############################################################################
resource "aws_organizations_organizational_unit" "dev" {
  name      = "Dev Workloads OU"
  parent_id = aws_organizations_organizational_unit.workloads.id
}

###############################################################################
# Create Infrastructure OU. 
###############################################################################
resource "aws_organizations_organizational_unit" "infrastructure" {
  name      = "Infrastructure OU"
  parent_id = one(aws_organizations_organization.org.roots).id
}

###############################################################################
# Create Prod Workloads OU. 
###############################################################################
resource "aws_organizations_organizational_unit" "prod" {
  name      = "Prod Workloads OU"
  parent_id = aws_organizations_organizational_unit.workloads.id
}

###############################################################################
# Create Security OU. 
###############################################################################
resource "aws_organizations_organizational_unit" "security" {
  name      = "Security OU"
  parent_id = one(aws_organizations_organization.org.roots).id
}

###############################################################################
# Create Test Workloads OU. 
###############################################################################
resource "aws_organizations_organizational_unit" "test" {
  name      = "Test Workloads OU"
  parent_id = aws_organizations_organizational_unit.workloads.id
}

###############################################################################
# Create Workloads OU. 
###############################################################################
resource "aws_organizations_organizational_unit" "workloads" {
  name      = "Workloads OU"
  parent_id = one(aws_organizations_organization.org.roots).id
}


###############################################################################
# ACCOUNTS 
###############################################################################

###############################################################################
# Create Development Account.
###############################################################################
resource "aws_organizations_account" "dev" {
  email = "jscroft+metastructure-001-dev@gmail.com"
  lifecycle {
    ignore_changes = [email, name]
  }
  name      = "Development Account"
  parent_id = aws_organizations_organizational_unit.dev.id
}


###############################################################################
# Create Master Account.
###############################################################################
resource "aws_organizations_account" "master" {
  email = "jscroft+metastructure-001-master@gmail.com"
  lifecycle {
    ignore_changes = [email, name]
  }
  name      = "Master Account"
  parent_id = null
}


###############################################################################
# Import Master Account.
###############################################################################
import {
  to = aws_organizations_account.master
  id = data.aws_caller_identity.me.account_id
}


###############################################################################
# Create Production Account.
###############################################################################
resource "aws_organizations_account" "prod" {
  email = "jscroft+metastructure-001-prod@gmail.com"
  lifecycle {
    ignore_changes = [email, name]
  }
  name      = "Production Account"
  parent_id = aws_organizations_organizational_unit.prod.id
}


###############################################################################
# Create Testing Account.
###############################################################################
resource "aws_organizations_account" "test" {
  email = "jscroft+metastructure-001-test@gmail.com"
  lifecycle {
    ignore_changes = [email, name]
  }
  name      = "Testing Account"
  parent_id = aws_organizations_organizational_unit.test.id
}


###############################################################################
# Create Shared Services Account.
###############################################################################
resource "aws_organizations_account" "shared_services" {
  email = "jscroft+metastructure-001-shared_services@gmail.com"
  lifecycle {
    ignore_changes = [email, name]
  }
  name      = "Shared Services Account"
  parent_id = aws_organizations_organizational_unit.infrastructure.id
}



