> **_Where other tools use special syntax & structure to ENCAPSULATE Terraform code, Metastructure uses a powerful template engine to GENERATE Terraform code._**

# Metastructure Template

[Metastructure](https://github.com/karmaniverous/metastructure) is a command-line tool that works in conjunction with [Terraform](https://www.terraform.io/) and all the other things to generate & manage a complex AWS infrastructure.

With Metastructure you can...

- **_Write a true global configuration._** Manage your entire enterprise from a single YAML file.

- **_Actually use SSO in Terraform._** Zero credentials management, ever.

- **_Integrate all the things._** Your configuration goes where Terraform can't.

- **_DRY up your code base._** Because close doesn't count.

Metastructure leverages the tools you already use to do the things you already do... just faster, smaller, and safer.

---

This repository is template for an enterprise-grade AWS infrastructure that follows the [AWS Well-Architected Framework](https://aws.amazon.com/architecture/well-architected) and leverages the capabilities of Metastructure.

In its current state, this template generates the following assets:

- A multi-account AWS infrastructure with a single master account and multiple organization accounts. Accounts are configurably assigned to a tree of Organizational Units.

- Configurable support for Terraform workspaces and both local & remote backend state management via S3 & DynamoDB.

- Robust IAM Security Center single sign-on (SSO) support, with configurable Group, Permission Sets & Policy assignments. Metastructure transparently integrates SSO with Terraform, supporting cross-account `terraform apply` with NO manual credential management.

- S3 bucket access logs in every account with appropriate permissions.

The goal is to provide a complete, secure, and scalable AWS infrastructure that can be spun up in minutes and customized to meet the needs of any serious organization.

See the [Metastructure Wiki](https://github.com/karmaniverous/metastructure/wiki) for MUCH more information on how to use this template, and stay tuned for future developments!

---

Made with ❤️ on Bali. See more great templates and other tools on
[my GitHub Profile](https://github.com/karmaniverous)!
