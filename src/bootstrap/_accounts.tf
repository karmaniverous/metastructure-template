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
# Create account Development Account.
###############################################################################
resource "aws_organizations_account" "dev" {
  email = "my-email+namespace-000-dev@gmail.com"
  lifecycle {
    ignore_changes = [email, name]
  }
  name      = "Development Account"
  parent_id = aws_organizations_organizational_unit.dev.id
}


###############################################################################
# Create account Log Archive Account.
###############################################################################
resource "aws_organizations_account" "log_archive" {
  email = "my-email+namespace-000-log_archive@gmail.com"
  lifecycle {
    ignore_changes = [email, name]
  }
  name      = "Log Archive Account"
  parent_id = aws_organizations_organizational_unit.security.id
}


###############################################################################
# Create account Master Account.
###############################################################################
resource "aws_organizations_account" "master" {
  email = "my-email+namespace-000-master@gmail.com"
  lifecycle {
    ignore_changes = [email, name]
  }
  name      = "Master Account"
  parent_id = null
}

###############################################################################
# Import account Master Account.
###############################################################################
import {
  to = aws_organizations_account.master
  id = data.aws_caller_identity.me.account_id
}

###############################################################################
# Create account Production Account.
###############################################################################
resource "aws_organizations_account" "prod" {
  email = "my-email+namespace-000-prod@gmail.com"
  lifecycle {
    ignore_changes = [email, name]
  }
  name      = "Production Account"
  parent_id = aws_organizations_organizational_unit.prod.id
}


###############################################################################
# Create account Testing Account.
###############################################################################
resource "aws_organizations_account" "test" {
  email = "my-email+namespace-000-test@gmail.com"
  lifecycle {
    ignore_changes = [email, name]
  }
  name      = "Testing Account"
  parent_id = aws_organizations_organizational_unit.test.id
}


###############################################################################
# Create account Shared Services Account.
###############################################################################
resource "aws_organizations_account" "shared_services" {
  email = "my-email+namespace-000-shared_services@gmail.com"
  lifecycle {
    ignore_changes = [email, name]
  }
  name      = "Shared Services Account"
  parent_id = aws_organizations_organizational_unit.infrastructure.id
}

