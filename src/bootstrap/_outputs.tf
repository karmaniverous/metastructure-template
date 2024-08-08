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
# Organization
###############################################################################
output "organization" {
  value = {
    id = aws_organizations_organization.org.id
  }
}

###############################################################################
# Organizational Units
###############################################################################
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

###############################################################################
# Accounts
###############################################################################
output "accounts" {
  value = {
    dev = {
      id = aws_organizations_account.dev.id
    }
    log_archive = {
      id = aws_organizations_account.log_archive.id
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

