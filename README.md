# AWS Metastructure

This project is a demo of [Metastructure](https://github.com/karmaniverous/metastructure), a command-line tool than can generate & manage a complex enterprise infrastructure with a YAML config file and a handful of Handlebars templates.

Early days here, so take everything you see with a grain of salt!

## Why?

A typical enterprise needs something that looks like:

- A collection of back-end services that talk to one another and the world through a secure API layer.

- A performant, responsive, well-architected front-end application that consumes this back end across a reusable data layer.

- A PCI-compliant serverless infrastructure-as-code that supports a robust SDLC and offers heavily automated DevOps right out of the box.

Applicable technologies:

- TypeScript
- Serverless Framework (AWS Lambda, API Gateway, DynamoDB, S3, CloudFront, etc.)
- Next.js (AWS Amplify)
- Terraform

This repo addresses the infrastructure corner of this triangle and is a VERY early work in progress, which I am developing as a template to support other ongoing work.

For a preview of the back-end corner, see [this repository](https://github.com/karmaniverous/aws-api-template). It will soon be experiencing a MAJOR facelift, including a complete TS refactor, a ton of config automation, and a couple years' worth of new patters and lessons learned.

For a preview of the front end, see [this repository](https://github.com/karmaniverous/nextjs-template). Same story: big update on the way.

You will note that many of the key dependencies are my own, as along the way I've had to think through some VERY important problems (how DO we do configurable entity management in DynamoDB at scale?) and engineer generic solutions to the same. This project has a single architect and a single developer with 40 years of coding experience under his belt, and I hope it shows.

At the end of the day, what I hope to offer is a truly configuration-driven, fully open-sourced, enterprise-grade application template that can be spun up in a matter of minutes and customized to meet the needs of any serious organization.

Stay tuned.

## About This Repo

This repository contains the Infrastructure-as-Code (IaC) source code and deployment machinery for the Application platform.

The infrastructure is managed using Terraform, and all Terraform configuration code is located in the [`infrastructure`](./src/) directory.

This repository also features extensive tooling to facilitate configuration and (soon) bootstrapping. The code driving this functionality is located in the [`src`](./src/) directory and should not be changed without careful consideration.

The Application's Serverless Framework and Next.js repos create their own AWS resources. The goal of this repo is to provide the opinionated security & DevOps frameworks within which those other repos operate, probably across mutiple `dev`, `test` & `prod` environments spread across several AWS accounts.

## Repo Structure

All Terraform code is contained in the [`infrastructure`](./src/) directory, which features the following key elements:

- The [`env`](./src/env/) directory contains ENVIRONMENT-specific configurations. There may be more than one environment associated with a given AWS account. Each environment has its own Terraform workspace within this directory. Enter `terraform workspace list` to see the current list, and note that the `default` workspace is not used.

- The [`acct`](./src/env/) directory contains ACCOUNT-specific configurations. Each AWS account has its own Terraform workspace within this directory. Enter `terraform workspace list` to see the current list, and note that the `default` workspace is not used.

- The [`global`](./src/global/) directory is a Terraform module that exports configuration values common to all Terraform code.

- [`config.yml`](./src/config.yml) is the configuration file that drives project setup via the `nr init` script. In addition to global configs applicable to all contexts, this file captures key info about AWS accounts, application environments, GitHub branches, and the relationships between them.

- [`license.txt`](./src/license.txt) contains the license text that is added to the header of all supported source code files.

## Configuring Your Development Environment

Working with this repository in your local environment requires the following tools. Follow the links for installation instructions:

- [Git](https://git-scm.com/download)
- [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
- [TFLint](https://github.com/terraform-linters/tflint)
- [AWS CLI](https://aws.amazon.com/cli/)
- [Node.js (v20 LTS)](https://nodejs.org/en/download/package-manager) or MUCH BETTER install it with [NVM](https://github.com/coreybutler/nvm-windows)!
- [Visual Studio Code](https://code.visualstudio.com/Download) — Not _strictly_ required but these instructions assume you are working inside VS Code!

Install globally:

- [@antfu/ni](https://www.npmjs.com/package/@antfu/ni) — Ensures cross-platform shell script compatibility.

Once you've got all this installed, clone this repo & open it in VS Code. VS Code will ask you if you'd like to install recommended extensions. Do so. If you miss this step, you can install them manually by clicking on the Extensions icon in the sidebar and searching for "Recommended".

### Connecting AWS

Still working on bootstrapping SSO. Stay tuned.

### Initializing the Project

Open a terminal in VS Code and run the following commands:

```bash
# Install project dependencies.
ni

# Initialize local repository.
nr init
```

The initialization script consumes `config.yml` to generate a bunch of key Terraform & GitHub Actions configurations. More on this later.

## Bootstrapping AWS

The initial assumption here is that we are starting from zero.

Much of what follows is adamped from [AWS Multi-account Multi-region Bootstrapping with Terraform](https://levelup.gitconnected.com/aws-multi-account-multi-region-bootstrapping-with-terraform-39aeed097ad2). Please review that very excellent reference for a deeper dive.

Some key differences between that reference & this repo:

- Our version control & DevOps machine is based on GitHub & GitHub Actions rather than AWS CodeCommit & CodePipeline.

- Our local automation is articulated in TypeScript rather than shell script.

- The bootstrap process laid out in the reference provisions a specially-permissioned IAM user to complete the bootstrap process, then destroy the user. However, PCI 3.2.1 requires that S3 buckets containing audit logs require MFA for object deletion. This is a permission than can ONLY be activated by the root user. So we're going to bootstrap our accounts with the root user, then disable it.

### Create the Master Account

This needs to be done manually. Follow these steps:

1. [Sign up for a new AWS account](https://signin.aws.amazon.com/signup?request_type=register). Use a unique email; you won't be able to use it again to create another account.

1. Sign into the new account as the root user and choose your desired home region in the upper right corner of the AWS Console.

1. Visit the IAM Identity Center page and enable IAM Identity Center with AWS Organizations (the default choice).

1. In the IAM console (_not_ IAM Identity Center!) create new IAM user `bootstrap-admin`, attaching AWS managed policy `AdministratorAccess`. Once the user is created, attach an additional inline policy using the contents of [`OrgAdminAccessPolicy.json`](./src/bootstrap/OrgAdminAccessPolicy.json). **`bootstrap-admin` now has admin privileges across your entire organization! We'll delete this user at the end of the bootstrapping process.**

1. From the `bootstrap-admin` user page **Security Credentials** tab, create an access key and secret key (choose the _Other_ use case or AWS will hassle you with alternatives). Save these in a secure location.

## External Identity Providers

Most organizations will want to use some kind of external identity provider as their source for user authentication & accounts. This project is designed to be agnostic to that decision. Once externally-sourced users are assigned to the SSO Groups defined in [`metastructure.yml`](./src/metastructure.yml), they will be able to create AWS profiles and leverage their assigned permissions just like any user.

Here are some references for setting up external identity providers:

- [Setup AWS SSO with Google as an external identity provider](https://ethtool.medium.com/setup-aws-sso-with-google-as-identity-provider-5e0b61d0a1e5)

To faciitate demonstration, this project will create users directly in AWS SSO.

## Some Gotchas

### Removing & Destroying Accounts

When you remove or destroy an account hooked into SSO, you also implicitly destroy any Metastructure-managed policies in that account. It takes a few seconds for a policy in an organization account to register that it has been detached from its related SSO permission sets in the master account, so Terraform may throw an error indicating that the policy is still in use, and `terraform apply` may fail. Just wait a few seconds and try again.

Also, before an Organization account can be destroyed, it must be detached from the Organization. This action is subject to some constraints, notably that the account much have a valid payment method configured. If an account to be destroyed violates any of these contraints, Terraform will throw an error identifying the issue. Resolve the issue, then try again.
