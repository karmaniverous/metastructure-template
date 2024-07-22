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
  region = module.global.config.organization.aws_region
}

###############################################################################
# Create a provider to assume the AWSReservedSSO_TerraformAdmin_1c44ff89e9d7dfcb 
# role on the Terraform state account.
###############################################################################
provider "aws" {
  alias = "terraform_state_account"
  assume_role {
    role_arn = "arn:aws:iam::730335248075:role/AWSReservedSSO_TerraformAdmin_1c44ff89e9d7dfcb"
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
# Create a provider to assume the AWSReservedSSO_TerraformAdmin_64191101df3cdb82 
# role on account Development Account.
###############################################################################
provider "aws" {
  alias = "dev"
  assume_role {
    role_arn = "arn:aws:iam::637423361006:role/AWSReservedSSO_TerraformAdmin_64191101df3cdb82"
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
# Create a provider to assume the AWSReservedSSO_TerraformAdmin_2ddfbbe9c9cfbdd7 
# role on account Master Account.
###############################################################################
provider "aws" {
  alias = "master"
  assume_role {
    role_arn = "arn:aws:iam::654654394187:role/AWSReservedSSO_TerraformAdmin_2ddfbbe9c9cfbdd7"
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
# Create a provider to assume the AWSReservedSSO_TerraformAdmin_98490783e264dada 
# role on account Production Account.
###############################################################################
provider "aws" {
  alias = "prod"
  assume_role {
    role_arn = "arn:aws:iam::211125660719:role/AWSReservedSSO_TerraformAdmin_98490783e264dada"
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
# Create a provider to assume the AWSReservedSSO_TerraformAdmin_7f72f6b45fbc0668 
# role on account Testing Account.
###############################################################################
provider "aws" {
  alias = "test"
  assume_role {
    role_arn = "arn:aws:iam::851725577893:role/AWSReservedSSO_TerraformAdmin_7f72f6b45fbc0668"
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
# Create a provider to assume the AWSReservedSSO_TerraformAdmin_1c44ff89e9d7dfcb 
# role on account Shared Services Account.
###############################################################################
provider "aws" {
  alias = "shared_services"
  assume_role {
    role_arn = "arn:aws:iam::730335248075:role/AWSReservedSSO_TerraformAdmin_1c44ff89e9d7dfcb"
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

