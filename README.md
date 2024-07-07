# Deploy infrastructure with terraform
This repository is destined to deploy AWS resources using Terraform

Terraform documentation fo AWS: https://developer.hashicorp.com/terraform/tutorials/aws-get-started

Before you start, we need to:

1) Create and AWS Account to create Security Credentials (IAM credentials)

https://docs.aws.amazon.com/IAM/latest/UserGuide/security-creds.html

2) Install Terraform

https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

3) Install AWS CLI

https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

4) Verify installations

To verify if AWS CLI was installed, run "aws --version"
To verify if Terraform was installed, run "terraform --version"

We have many methods to use your IAM credentials to authenticate the Terraform AWS provider:

https://registry.terraform.io/providers/hashicorp/aws/latest/docs?ajs_aid=7178871d-9222-4967-bb36-3708610962c6&product_intent=terraform#environment-variables

and 

https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html

Dont' forget to grant the proper policy name to your user, you can use AdministratorAccess policy to allow full power to your user

Useful Terraform commands:
- terraform apply
- terraform apply -destroy
- terraform init
- terraform validate
- terraform output
- OBS: Always use this sequence (terraform init --> commit changes --> terraform validate --> terraform apply)

