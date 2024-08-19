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

data "aws_iam_policy_document" "unprotected_resource_writer" {
  statement {
    sid       = "AllowUnprotectedResourceManagement"
    effect    = "Allow"
    actions   = ["*"]
    resources = ["*"]
  }
}
