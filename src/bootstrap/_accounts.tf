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
# Import Dev Workloads OU.
###############################################################################
import {
  to = aws_organizations_organizational_unit.dev
  id = "ou-b51u-ogux3wiu"
}

###############################################################################
# Create Infrastructure OU. 
###############################################################################
resource "aws_organizations_organizational_unit" "infrastructure" {
  name      = "Infrastructure OU"
  parent_id = one(aws_organizations_organization.org.roots).id
}

###############################################################################
# Import Infrastructure OU.
###############################################################################
import {
  to = aws_organizations_organizational_unit.infrastructure
  id = "ou-b51u-rdgtk5ev"
}

###############################################################################
# Create Prod Workloads OU. 
###############################################################################
resource "aws_organizations_organizational_unit" "prod" {
  name      = "Prod Workloads OU"
  parent_id = aws_organizations_organizational_unit.workloads.id
}

###############################################################################
# Import Prod Workloads OU.
###############################################################################
import {
  to = aws_organizations_organizational_unit.prod
  id = "ou-b51u-znxstv50"
}

###############################################################################
# Create Security OU. 
###############################################################################
resource "aws_organizations_organizational_unit" "security" {
  name      = "Security OU"
  parent_id = one(aws_organizations_organization.org.roots).id
}

###############################################################################
# Import Security OU.
###############################################################################
import {
  to = aws_organizations_organizational_unit.security
  id = "ou-b51u-w4gk5aqc"
}

###############################################################################
# Create Test Workloads OU. 
###############################################################################
resource "aws_organizations_organizational_unit" "test" {
  name      = "Test Workloads OU"
  parent_id = aws_organizations_organizational_unit.workloads.id
}

###############################################################################
# Import Test Workloads OU.
###############################################################################
import {
  to = aws_organizations_organizational_unit.test
  id = "ou-b51u-dh5m52xy"
}

###############################################################################
# Create Workloads OU. 
###############################################################################
resource "aws_organizations_organizational_unit" "workloads" {
  name      = "Workloads OU"
  parent_id = one(aws_organizations_organization.org.roots).id
}

###############################################################################
# Import Workloads OU.
###############################################################################
import {
  to = aws_organizations_organizational_unit.workloads
  id = "ou-b51u-tkmay1hb"
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
# Import Development Account.
###############################################################################
import {
  to = aws_organizations_account.dev
  id = "851725244929"
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
# Import Production Account.
###############################################################################
import {
  to = aws_organizations_account.prod
  id = "339713056709"
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
# Import Testing Account.
###############################################################################
import {
  to = aws_organizations_account.test
  id = "905418424983"
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


###############################################################################
# Import Shared Services Account.
###############################################################################
import {
  to = aws_organizations_account.shared_services
  id = "058264146029"
}



