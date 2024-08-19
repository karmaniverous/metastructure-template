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

output "config" {
  description = "Global config."
  value = {
    accounts = {
      dev = {
        email               = "my-email+namespace-000-dev@gmail.com"
        name                = "Development Account"
        organizational_unit = "dev"
      }
      log_archive = {
        email               = "my-email+namespace-000-log_archive@gmail.com"
        name                = "Log Archive Account"
        organizational_unit = "security"
      }
      master = {
        email = "my-email+namespace-000-master@gmail.com"
        name  = "Master Account"
      }
      prod = {
        email               = "my-email+namespace-000-prod@gmail.com"
        name                = "Production Account"
        organizational_unit = "prod"
      }
      test = {
        email               = "my-email+namespace-000-test@gmail.com"
        name                = "Testing Account"
        organizational_unit = "test"
      }
      shared_services = {
        email               = "my-email+namespace-000-shared_services@gmail.com"
        name                = "Shared Services Account"
        organizational_unit = "infrastructure"
      }
    }
    applications = {
      api = {
        environments = {
          bali = {
            account = "dev"
          }
          dev = {
            account = "dev"
          }
          prod = {
            account = "prod"
          }
          release = {
            account = "test"
          }
          seattle = {
            account = "dev"
          }
        }
      }
    }
    config_override_path = "src/metastructure.local.yml"
    organization = {
      id = "my-organization-id"
      key_accounts = {
        master          = "master"
        terraform_state = "shared_services"
        log_archive     = "log_archive"
      }
      aws_region = "us-east-1"
      tokens = {
        domain        = "gmail.com"
        owner         = "my-email"
        namespace     = "namespace-000"
        audit_log     = "audit-logs"
        s3_access_log = "s3-access-logs"
      }
    }
    organizational_units = {
      dev = {
        name   = "Dev Workloads OU"
        parent = "workloads"
      }
      infrastructure = {
        name = "Infrastructure OU"
      }
      prod = {
        name   = "Prod Workloads OU"
        parent = "workloads"
      }
      security = {
        name = "Security OU"
      }
      test = {
        name   = "Test Workloads OU"
        parent = "workloads"
      }
      workloads = {
        name = "Workloads OU"
      }
    }
    partials = {
      header_generated = "src/partials/header_generated.hbs"
      provider         = "src/partials/provider.hbs"
    }
    sso = {
      groups = {
        terraform_admin = {
          account_permission_sets = {
            dev = [
              "terraform_admin"
            ]
            log_archive = [
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
          name        = "TerraformAdmin"
          description = "Terraform administrators can create & manage all resources in all accounts."
        }
        terraform_deployment = {
          account_permission_sets = {
            dev = [
              "terraform_deployment"
            ]
            log_archive = [
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
          name        = "TerraformDeployment"
          description = "Terraform deployment users can create & manage all unprotected resources in all accounts."
        }
      }
      permission_sets = {
        terraform_admin = {
          name = "TerraformAdmin"
          policies = [
            "AdministratorAccess",
            "sso_terraform_state_writer"
          ]
          description = "Permits creation & management of all resources."
        }
        terraform_deployment = {
          name = "TerraformDeployment"
          policies = [
            "unprotected_resource_writer",
            "sso_terraform_state_writer"
          ]
          description = "Permits creation & management of all unprotected resources."
        }
      }
      policies = {
        sso_terraform_state_writer = {
          name        = "SSOTerraformStateWriter"
          description = "Permits writing to the Terraform state bucket & state lock table."
        }
        unprotected_resource_writer = {
          name        = "UnprotectedResourceWriter"
          description = "Permits creation & management of unprotected resources."
        }
      }
      start_url = "https://my-sso-domain.awsapps.com/start#/"
      users = {
        test = {
          email = "my-email@gmail.com"
          groups = [
            "terraform_admin"
          ]
          display_name = "Test User"
          name = {
            given_name  = "Test"
            family_name = "User"
          }
        }
      }
      reference = {
        account_permission_sets = {
          dev = [
            "terraform_admin",
            "terraform_deployment"
          ]
          log_archive = [
            "terraform_admin",
            "terraform_deployment"
          ]
          master = [
            "terraform_admin",
            "terraform_deployment"
          ]
          prod = [
            "terraform_admin",
            "terraform_deployment"
          ]
          test = [
            "terraform_admin",
            "terraform_deployment"
          ]
          shared_services = [
            "terraform_admin",
            "terraform_deployment"
          ]
        }
        account_policies = {
          dev = [
            "sso_terraform_state_writer",
            "unprotected_resource_writer"
          ]
          log_archive = [
            "sso_terraform_state_writer",
            "unprotected_resource_writer"
          ]
          master = [
            "sso_terraform_state_writer",
            "unprotected_resource_writer"
          ]
          prod = [
            "sso_terraform_state_writer",
            "unprotected_resource_writer"
          ]
          test = [
            "sso_terraform_state_writer",
            "unprotected_resource_writer"
          ]
          shared_services = [
            "sso_terraform_state_writer",
            "unprotected_resource_writer"
          ]
        }
        group_account_permission_set_policies = {
          terraform_admin = {
            dev = {
              terraform_admin = [
                "sso_terraform_state_writer"
              ]
            }
            log_archive = {
              terraform_admin = [
                "sso_terraform_state_writer"
              ]
            }
            master = {
              terraform_admin = [
                "sso_terraform_state_writer"
              ]
            }
            prod = {
              terraform_admin = [
                "sso_terraform_state_writer"
              ]
            }
            test = {
              terraform_admin = [
                "sso_terraform_state_writer"
              ]
            }
            shared_services = {
              terraform_admin = [
                "sso_terraform_state_writer"
              ]
            }
          }
          terraform_deployment = {
            dev = {
              terraform_deployment = [
                "sso_terraform_state_writer"
              ]
            }
            log_archive = {
              terraform_deployment = [
                "sso_terraform_state_writer"
              ]
            }
            master = {
              terraform_deployment = [
                "sso_terraform_state_writer"
              ]
            }
            prod = {
              terraform_deployment = [
                "sso_terraform_state_writer"
              ]
            }
            test = {
              terraform_deployment = [
                "sso_terraform_state_writer"
              ]
            }
            shared_services = {
              terraform_deployment = [
                "sso_terraform_state_writer"
              ]
            }
          }
        }
        permission_set_accounts = {
          terraform_admin = [
            "dev",
            "log_archive",
            "master",
            "prod",
            "test",
            "shared_services"
          ]
          terraform_deployment = [
            "dev",
            "log_archive",
            "master",
            "prod",
            "test",
            "shared_services"
          ]
        }
        policy_accounts = {
          sso_terraform_state_writer = [
            "dev",
            "log_archive",
            "master",
            "prod",
            "test",
            "shared_services"
          ]
          unprotected_resource_writer = [
            "dev",
            "log_archive",
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
        bucket     = "namespace-000-terraform-state"
        key        = "terraform.tfstate"
        lock_table = "terraform-state-lock"
      }
      terraform_version = ">= 1.9.0"
    }
  }
}
