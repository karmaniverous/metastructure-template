###############################################################################
###############################################################################
####                                                                       ####
####              THIS FILE WAS GENERATED WITH METASTRUCTURE               ####
####                       DO NOT EDIT IT MANUALLY!                        ####
####                                                                       ####
###############################################################################
###############################################################################

terraform { 
    backend "s3" { 
        bucket = "karma003-terraform-state"
        dynamodb_table = "terraform-state-lock" 
        encrypt = true 
        key = "terraform.tfstate"
        region = "us-east-1" 
        role_arn = "arn:aws:iam::975050301644:role/OrganizationAccountAccessRole"
        workspace_key_prefix = "bootstrap" 
    } 
}