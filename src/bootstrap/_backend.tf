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

terraform {
  backend "s3" {
    assume_role = {
      role_arn = "arn:aws:iam::730335248075:role/AWSReservedSSO_TerraformAdmin_1c44ff89e9d7dfcb"
    }
    bucket               = "metastructure-001-terraform-state"
    dynamodb_table       = "terraform-state-lock"
    encrypt              = true
    key                  = "terraform.tfstate"
    region               = "us-east-1"
    workspace_key_prefix = "bootstrap"
  }
}