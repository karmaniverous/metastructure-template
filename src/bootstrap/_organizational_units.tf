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
# Create organizational unit Dev Workloads OU. 
###############################################################################
resource "aws_organizations_organizational_unit" "dev" {
  name      = "Dev Workloads OU"
  parent_id = aws_organizations_organizational_unit.workloads.id
}


###############################################################################
# Create organizational unit Infrastructure OU. 
###############################################################################
resource "aws_organizations_organizational_unit" "infrastructure" {
  name      = "Infrastructure OU"
  parent_id = one(aws_organizations_organization.org.roots).id
}


###############################################################################
# Create organizational unit Prod Workloads OU. 
###############################################################################
resource "aws_organizations_organizational_unit" "prod" {
  name      = "Prod Workloads OU"
  parent_id = aws_organizations_organizational_unit.workloads.id
}


###############################################################################
# Create organizational unit Security OU. 
###############################################################################
resource "aws_organizations_organizational_unit" "security" {
  name      = "Security OU"
  parent_id = one(aws_organizations_organization.org.roots).id
}


###############################################################################
# Create organizational unit Test Workloads OU. 
###############################################################################
resource "aws_organizations_organizational_unit" "test" {
  name      = "Test Workloads OU"
  parent_id = aws_organizations_organizational_unit.workloads.id
}


###############################################################################
# Create organizational unit Workloads OU. 
###############################################################################
resource "aws_organizations_organizational_unit" "workloads" {
  name      = "Workloads OU"
  parent_id = one(aws_organizations_organization.org.roots).id
}


