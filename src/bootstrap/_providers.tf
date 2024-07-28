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
# Default provider.
###############################################################################
provider "aws" {
  default_tags {
    tags = {
      Generator = "Terraform"
    }
  }
  profile = "META-BOOTSTRAP"
  region  = module.global.config.organization.aws_region
}

###############################################################################
# DIRECT ACCOUNT PROVIDERS
###############################################################################

###############################################################################
# Create a provider to assume the OrganizationAccountAccessRole 
# role on account Development Account.
###############################################################################
provider "aws" {
  alias = "dev"
  assume_role {
    role_arn = "arn:aws:iam::${aws_organizations_account.dev.id}:role/OrganizationAccountAccessRole"
  }
  default_tags {
    tags = {
      Generator = "Terraform"
    }
  }
  profile = "META-BOOTSTRAP"
  region  = module.global.config.organization.aws_region
}

###############################################################################
# Create a provider to assume the OrganizationAccountAccessRole 
# role on account Log Archive Account.
###############################################################################
provider "aws" {
  alias = "log_archive"
  assume_role {
    role_arn = "arn:aws:iam::${aws_organizations_account.log_archive.id}:role/OrganizationAccountAccessRole"
  }
  default_tags {
    tags = {
      Generator = "Terraform"
    }
  }
  profile = "META-BOOTSTRAP"
  region  = module.global.config.organization.aws_region
}

###############################################################################
# Create a provider to assume the OrganizationAccountAccessRole 
# role on account Master Account.
###############################################################################
provider "aws" {
  alias = "master"
  default_tags {
    tags = {
      Generator = "Terraform"
    }
  }
  profile = "META-BOOTSTRAP"
  region  = module.global.config.organization.aws_region
}

###############################################################################
# Create a provider to assume the OrganizationAccountAccessRole 
# role on account Production Account.
###############################################################################
provider "aws" {
  alias = "prod"
  assume_role {
    role_arn = "arn:aws:iam::${aws_organizations_account.prod.id}:role/OrganizationAccountAccessRole"
  }
  default_tags {
    tags = {
      Generator = "Terraform"
    }
  }
  profile = "META-BOOTSTRAP"
  region  = module.global.config.organization.aws_region
}

###############################################################################
# Create a provider to assume the OrganizationAccountAccessRole 
# role on account Testing Account.
###############################################################################
provider "aws" {
  alias = "test"
  assume_role {
    role_arn = "arn:aws:iam::${aws_organizations_account.test.id}:role/OrganizationAccountAccessRole"
  }
  default_tags {
    tags = {
      Generator = "Terraform"
    }
  }
  profile = "META-BOOTSTRAP"
  region  = module.global.config.organization.aws_region
}

###############################################################################
# Create a provider to assume the OrganizationAccountAccessRole 
# role on account Shared Services Account.
###############################################################################
provider "aws" {
  alias = "shared_services"
  assume_role {
    role_arn = "arn:aws:iam::${aws_organizations_account.shared_services.id}:role/OrganizationAccountAccessRole"
  }
  default_tags {
    tags = {
      Generator = "Terraform"
    }
  }
  profile = "META-BOOTSTRAP"
  region  = module.global.config.organization.aws_region
}

###############################################################################
# KEY ACCOUNT PROVIDERS
###############################################################################

###############################################################################
# Create a provider to assume the OrganizationAccountAccessRole 
# role on the master key account.
###############################################################################
provider "aws" {
  alias = "key_account_master"
  default_tags {
    tags = {
      Generator = "Terraform"
    }
  }
  profile = "META-BOOTSTRAP"
  region  = module.global.config.organization.aws_region
}

###############################################################################
# Create a provider to assume the OrganizationAccountAccessRole 
# role on the terraform_state key account.
###############################################################################
provider "aws" {
  alias = "key_account_terraform_state"
  assume_role {
    role_arn = "arn:aws:iam::${aws_organizations_account.shared_services.id}:role/OrganizationAccountAccessRole"
  }
  default_tags {
    tags = {
      Generator = "Terraform"
    }
  }
  profile = "META-BOOTSTRAP"
  region  = module.global.config.organization.aws_region
}

###############################################################################
# Create a provider to assume the OrganizationAccountAccessRole 
# role on the log_archive key account.
###############################################################################
provider "aws" {
  alias = "key_account_log_archive"
  assume_role {
    role_arn = "arn:aws:iam::${aws_organizations_account.log_archive.id}:role/OrganizationAccountAccessRole"
  }
  default_tags {
    tags = {
      Generator = "Terraform"
    }
  }
  profile = "META-BOOTSTRAP"
  region  = module.global.config.organization.aws_region
}

