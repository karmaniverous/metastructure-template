###############################################################################
###############################################################################
####                                                                       ####
####              THIS FILE WAS GENERATED WITH METASTRUCTURE               ####
####                       DO NOT EDIT IT MANUALLY!                        ####
####                                                                       ####
###############################################################################
###############################################################################

output "config" { 
    description = "Global config." 
    value = {
      accounts = {
        dev = {
          id = "637423361006"
          email = "jscroft+metastructure.000.dev@gmail.com"
          name = "Development Account"
          organizational_unit = "dev"
        }
        master = {
          id = "654654394187"
          email = "jscroft+metastructure.000.master@gmail.com"
          name = "Master Account"
        }
        prod = {
          id = "211125660719"
          email = "jscroft+metastructure.000.prod@gmail.com"
          name = "Production Account"
          organizational_unit = "prod"
        }
        test = {
          id = "730335315754"
          email = "jscroft+metastructure.000.test@gmail.com"
          name = "Testing Account"
          organizational_unit = "test"
        }
        shared_services = {
          id = "730335248075"
          email = "jscroft+metastructure.000.shared_services@gmail.com"
          name = "Shared Services Account"
          organizational_unit = "infrastructure"
        }
      }
      environments = {
        bali = {
          account = "dev"
          cognito_user_pool_name = "api-user-v0-bali"
          gha_on_push_branches = "preview/**"
        }
        dev = {
          account = "dev"
          cognito_user_pool_name = "api-user-v0-dev"
          gha_on_push_branches = "dev"
        }
        prod = {
          account = "prod"
          cognito_user_pool_name = "api-user-v0-prod"
          gha_on_push_branches = "main"
        }
        release = {
          account = "test"
          cognito_user_pool_name = "api-user-v0-release"
          gha_on_push_branches = "release/**"
        }
        seattle = {
          account = "dev"
          cognito_user_pool_name = "api-user-v0-seattle"
          gha_on_push_branches = "preview/**"
        }
      }
      organization = {
        aws_region = "us-east-1"
        github_org = "metastructureniverous"
        master_account = "master"
        namespace = "metastructure000"
      }
      organizational_units = {
        dev = {
          id = "ou-d1r1-57lwd19o"
          name = "Dev Workloads OU"
          parent = "workloads"
        }
        infrastructure = {
          id = "ou-d1r1-y8cotbce"
          name = "Infrastructure OU"
        }
        prod = {
          id = "ou-d1r1-vzraoavq"
          name = "Prod Workloads OU"
          parent = "workloads"
        }
        security = {
          id = "ou-d1r1-hf0dozrb"
          name = "Security OU"
        }
        test = {
          id = "ou-d1r1-nah0pbxf"
          name = "Test Workloads OU"
          parent = "workloads"
        }
        workloads = {
          id = "ou-d1r1-3nghv48g"
          name = "Workloads OU"
        }
      }
      sso = {
        groups = {
          terraform_admin = {
            account_permission_sets = {
              dev = [
                "terraform_admin"
              ]
              master = [
                "terraform_admin"
              ]
              prod = [
                "terraform_admin"
              ]
              test = [
                "terraform_admin"
              ]
              shared_services = [
                "terraform_admin"
              ]
            }
            description = "Terraform administrators can create & manage all resources in all accounts."
            name = "terraform_admin"
          }
          terraform_deployment = {
            account_permission_sets = {
              dev = [
                "terraform_deployment"
              ]
              master = [
                "terraform_deployment"
              ]
              prod = [
                "terraform_deployment"
              ]
              test = [
                "terraform_deployment"
              ]
              shared_services = [
                "terraform_deployment"
              ]
            }
            description = "Terraform deployment users can create & manage all unprotected resources in all accounts."
            name = "TerraformDeployment"
          }
        }
        permission_sets = {
          terraform_admin = {
            description = "Permits creation & management of all resources."
            name = "TerraformAdmin"
            policies = [
              "AdministratorAccess",
              "terraform_state_writer"
            ]
          }
          terraform_deployment = {
            description = "Permits creation & management of all unprotected resources."
            name = "terraform_deployment"
            policies = [
              "unprotected_resource_writer",
              "terraform_state_writer"
            ]
          }
        }
        policies = {
          terraform_state_writer = "TerraformStateWriter"
          unprotected_resource_writer = "UnprotectedResourceWriter"
        }
        reference = {
          account_policies = {
            dev = [
              "terraform_state_writer",
              "unprotected_resource_writer"
            ]
            master = [
              "terraform_state_writer",
              "unprotected_resource_writer"
            ]
            prod = [
              "terraform_state_writer",
              "unprotected_resource_writer"
            ]
            test = [
              "terraform_state_writer",
              "unprotected_resource_writer"
            ]
            shared_services = [
              "terraform_state_writer",
              "unprotected_resource_writer"
            ]
          }
          group_account_permission_set_policies = {
            terraform_admin = {
              dev = {
                terraform_admin = [
                  "terraform_state_writer"
                ]
              }
              master = {
                terraform_admin = [
                  "terraform_state_writer"
                ]
              }
              prod = {
                terraform_admin = [
                  "terraform_state_writer"
                ]
              }
              test = {
                terraform_admin = [
                  "terraform_state_writer"
                ]
              }
              shared_services = {
                terraform_admin = [
                  "terraform_state_writer"
                ]
              }
            }
            terraform_deployment = {
              dev = {
                terraform_deployment = [
                  "terraform_state_writer"
                ]
              }
              master = {
                terraform_deployment = [
                  "terraform_state_writer"
                ]
              }
              prod = {
                terraform_deployment = [
                  "terraform_state_writer"
                ]
              }
              test = {
                terraform_deployment = [
                  "terraform_state_writer"
                ]
              }
              shared_services = {
                terraform_deployment = [
                  "terraform_state_writer"
                ]
              }
            }
          }
          policy_accounts = {
            terraform_state_writer = [
              "dev",
              "master",
              "prod",
              "test",
              "shared_services"
            ]
            unprotected_resource_writer = [
              "dev",
              "master",
              "prod",
              "test",
              "shared_services"
            ]
          }
        }
      }
      terraform = {
        aws_version = ">= 5.56.1"
        paths = [
          "src"
        ]
        state = {
          account = "shared_services"
          bucket = "metastructure000-terraform-state"
          key = "terraform.tfstate"
          lock_table = "terraform-state-lock"
        }
        terraform_version = ">= 1.9.0"
      }
    } 
}
