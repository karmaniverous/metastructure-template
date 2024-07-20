###############################################################################
###############################################################################
####                                                                       ####
####              THIS FILE WAS GENERATED WITH METASTRUCTURE               ####
####                       DO NOT EDIT IT MANUALLY!                        ####
####                                                                       ####
###############################################################################
###############################################################################

output "accounts" {
  description = "Map of account ids."
  value = { 
    dev = {
      id = aws_organizations_account.dev.id 
    } 
    master = {
      id = aws_organizations_account.master.id 
    } 
    prod = {
      id = aws_organizations_account.prod.id 
    } 
    test = {
      id = aws_organizations_account.test.id 
    } 
    shared_services = {
      id = aws_organizations_account.shared_services.id 
    } 
  }
}

output "organizational_units" {
  description = "Map of organizational unit ids."
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
