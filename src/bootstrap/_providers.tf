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
  # assume_role {
  #   tags = {
  #     Generator = "Terraform"
  #   }
  #   transitive_tag_keys = ["Generator"]
  # }
  default_tags {
    tags = {
      Generator = "Terraform"
    }
  }
  region  = module.global.config.organization.aws_region
}

###############################################################################
# Create a provider to assume the TerraformAdmin permission set role on 
# the Terraform state account.
###############################################################################
provider "aws" {
  alias   = "terraform_state_account"
  assume_role { 
    role_arn = "arn:aws:iam::${aws_organizations_account.shared_services.id}:role/AWSReservedSSO_TerraformAdmin_1c44ff89e9d7dfcb"
    # tags = {
    #   Generator = "Terraform"
    # }
    # transitive_tag_keys = ["Generator"]
  }
  default_tags {
    tags = {
      Generator = "Terraform"
    }
  }
  region = module.global.config.organization.aws_region
}
###############################################################################
# Create a provider to assume the TerraformAdmin permission set role 
# on account Development Account.
###############################################################################
provider "aws" { 
  alias   = "dev" 
  assume_role { 
    role_arn = "arn:aws:iam::${aws_organizations_account.dev.id}:role/AWSReservedSSO_TerraformAdmin_1c44ff89e9d7dfcb"
    # tags = {
    #   Generator = "Terraform"
    # }
    # transitive_tag_keys = ["Generator"]
  } 
  default_tags {
    tags = {
      Generator = "Terraform"
    }
  }
  region = module.global.config.organization.aws_region
}

###############################################################################
# Create a provider to assume the TerraformAdmin permission set role 
# on account Master Account.
###############################################################################
provider "aws" { 
  alias   = "master" 
  assume_role { 
    role_arn = "arn:aws:iam::${aws_organizations_account.master.id}:role/AWSReservedSSO_TerraformAdmin_1c44ff89e9d7dfcb"
    # tags = {
    #   Generator = "Terraform"
    # }
    # transitive_tag_keys = ["Generator"]
  } 
  default_tags {
    tags = {
      Generator = "Terraform"
    }
  }
  region = module.global.config.organization.aws_region
}

###############################################################################
# Create a provider to assume the TerraformAdmin permission set role 
# on account Production Account.
###############################################################################
provider "aws" { 
  alias   = "prod" 
  assume_role { 
    role_arn = "arn:aws:iam::${aws_organizations_account.prod.id}:role/AWSReservedSSO_TerraformAdmin_1c44ff89e9d7dfcb"
    # tags = {
    #   Generator = "Terraform"
    # }
    # transitive_tag_keys = ["Generator"]
  } 
  default_tags {
    tags = {
      Generator = "Terraform"
    }
  }
  region = module.global.config.organization.aws_region
}

###############################################################################
# Create a provider to assume the TerraformAdmin permission set role 
# on account Testing Account.
###############################################################################
provider "aws" { 
  alias   = "test" 
  assume_role { 
    role_arn = "arn:aws:iam::${aws_organizations_account.test.id}:role/AWSReservedSSO_TerraformAdmin_1c44ff89e9d7dfcb"
    # tags = {
    #   Generator = "Terraform"
    # }
    # transitive_tag_keys = ["Generator"]
  } 
  default_tags {
    tags = {
      Generator = "Terraform"
    }
  }
  region = module.global.config.organization.aws_region
}

###############################################################################
# Create a provider to assume the TerraformAdmin permission set role 
# on account Shared Services Account.
###############################################################################
provider "aws" { 
  alias   = "shared_services" 
  assume_role { 
    role_arn = "arn:aws:iam::${aws_organizations_account.shared_services.id}:role/AWSReservedSSO_TerraformAdmin_1c44ff89e9d7dfcb"
    # tags = {
    #   Generator = "Terraform"
    # }
    # transitive_tag_keys = ["Generator"]
  } 
  default_tags {
    tags = {
      Generator = "Terraform"
    }
  }
  region = module.global.config.organization.aws_region
}

