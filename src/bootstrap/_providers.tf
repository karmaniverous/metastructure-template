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
  assume_role {
    tags = {
      Generator = "Terraform"
    }
    transitive_tag_keys = ["Generator"]
  }
  default_tags {
    tags = {
      Generator = "Terraform"
    }
  }
  profile             = "master"
  region              = module.global.config.organization.aws_region
  shared_config_files = ["./_shared_config.local"]
}

###############################################################################
# Create a provider to assume the AWSReservedSSO_TerraformAdmin_b73d775513174968 
# role on the Terraform state account.
###############################################################################
provider "aws" {
  alias = "terraform_state_account"
  assume_role {
    tags = {
      Generator = "Terraform"
    }
    transitive_tag_keys = ["Generator"]
  }
  default_tags {
    tags = {
      Generator = "Terraform"
    }
  }
  profile             = "shared_services"
  region              = module.global.config.organization.aws_region
  shared_config_files = ["./_shared_config.local"]
}
###############################################################################
# Create a provider to assume the AWSReservedSSO_TerraformAdmin_14c7146d8c9e3f77 
# role on account Development Account.
###############################################################################
provider "aws" {
  alias = "dev"
  assume_role {
    tags = {
      Generator = "Terraform"
    }
    transitive_tag_keys = ["Generator"]
  }
  default_tags {
    tags = {
      Generator = "Terraform"
    }
  }
  profile             = "dev"
  region              = module.global.config.organization.aws_region
  shared_config_files = ["./_shared_config.local"]
}

###############################################################################
# Create a provider to assume the AWSReservedSSO_TerraformAdmin_53a8f9a4117a4137 
# role on account Master Account.
###############################################################################
provider "aws" {
  alias = "master"
  assume_role {
    tags = {
      Generator = "Terraform"
    }
    transitive_tag_keys = ["Generator"]
  }
  default_tags {
    tags = {
      Generator = "Terraform"
    }
  }
  profile             = "master"
  region              = module.global.config.organization.aws_region
  shared_config_files = ["./_shared_config.local"]
}

###############################################################################
# Create a provider to assume the AWSReservedSSO_TerraformAdmin_1ec326f7d0c74c6d 
# role on account Production Account.
###############################################################################
provider "aws" {
  alias = "prod"
  assume_role {
    tags = {
      Generator = "Terraform"
    }
    transitive_tag_keys = ["Generator"]
  }
  default_tags {
    tags = {
      Generator = "Terraform"
    }
  }
  profile             = "prod"
  region              = module.global.config.organization.aws_region
  shared_config_files = ["./_shared_config.local"]
}

###############################################################################
# Create a provider to assume the AWSReservedSSO_TerraformAdmin_640f3ded95d7dfb2 
# role on account Testing Account.
###############################################################################
provider "aws" {
  alias = "test"
  assume_role {
    tags = {
      Generator = "Terraform"
    }
    transitive_tag_keys = ["Generator"]
  }
  default_tags {
    tags = {
      Generator = "Terraform"
    }
  }
  profile             = "test"
  region              = module.global.config.organization.aws_region
  shared_config_files = ["./_shared_config.local"]
}

###############################################################################
# Create a provider to assume the AWSReservedSSO_TerraformAdmin_b73d775513174968 
# role on account Shared Services Account.
###############################################################################
provider "aws" {
  alias = "shared_services"
  assume_role {
    tags = {
      Generator = "Terraform"
    }
    transitive_tag_keys = ["Generator"]
  }
  default_tags {
    tags = {
      Generator = "Terraform"
    }
  }
  profile             = "shared_services"
  region              = module.global.config.organization.aws_region
  shared_config_files = ["./_shared_config.local"]
}

