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
    bucket               = "metastructure-001-terraform-state"
    dynamodb_table       = "terraform-state-lock"
    encrypt              = true
    key                  = "terraform.tfstate"
    profile              = "shared_services"
    region               = "us-east-1"
    shared_config_files  = ["./_shared_config.local"]
    workspace_key_prefix = "bootstrap"
  }
}