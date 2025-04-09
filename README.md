# 🚀 Deploy AWS Infrastructure with Terraform 🚀

## Introduction

Hello folks, you have come to the right place if you want to learn Terrafom and AWS.

This repository is dedicated to deploying AWS resources using Terraform. This is an educational project, the solutions presented are not intended for production level. The goal of this repository is to teach how to use Terrafom with AWS resources.

The mission of this repository is simple: Given a Public API, use AWS Glue to extract data from it and send the data to a database inside AWS RDS. We can create the RDS Instance using the Default VPC or using a Custom VPC where the RDS Instance will be place inside a Public Subnet.

With this repository, you will learn the following AWS resources using Terraform:
- AWS VPC: https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html
- AWS RDS: https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Welcome.html
- AWS Glue: https://docs.amazonaws.cn/en_us/glue/latest/dg/what-is-glue.html
- AWS Security Group: https://docs.aws.amazon.com/vpc/latest/userguide/vpc-security-groups.html
- AWS IAM Role: https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html
- AWS CloudWatch: https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/WhatIsCloudWatch.html
- AWS Secrets Manager: https://docs.aws.amazon.com/secretsmanager/latest/userguide/intro.html

## QuickStart

Use the following repository structure:

   ```bash
      my-local-repository/
      │── main.tf                   # We call deploy_aws_infrastructure_with_terraform module here
      │── python                    
      │   │── my_glue_job.py       # AWS Glue will execute this code
   ```

You can call deploy_aws_infrastructure_with_terraform module this way (copy code below into main.tf):

   ```bash
   # create_custom_vpc
   #    true = create all AWS resouces inside a Custom VPC Public Subne 
   #    false = use Default VPC

   module "deploy_aws_infrastructure_with_terraform"{
      source              = "git::https://github.com/RaulPontello/deploy_aws_infrastructure_with_terraform.git"
      profile_name        = "my_profile"
      aws_region          = "us-east-1"
      environment         = "dev"
      owner               = "raul pontello"
      project_name        = "deploy-aws-with-terraform"
      python_file_name    = "from_API_to_RDS"
      create_custom_vpc   = false
   }
   ```

If you want a python file sample that extracts data from a public API, you can find it [here](https://github.com/RaulPontello/Python/blob/master/from_API_to_RDS.py)

## Tagging

All AWS resources are tagged using Terraform provider's default_tags property:

   ```bash
      provider "aws" {
         region = var.aws_region
         profile = var.profile_name
         default_tags {
            tags = {
            environment  = var.environment
            project_name = var.project_name
            terraform    = "true"
            }
         }
         }
   ```

## Documentation

**Terraform documentation for AWS**

- [Getting Started with AWS and Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started)

For documentation on each resource implemented in this project, refer to the README file of each module:
   - [VPC README](https://github.com/RaulPontello/deploy_aws_infrastructure_with_terraform/blob/main/modules/vpc/README.md)
   - [RDS README](https://github.com/RaulPontello/deploy_aws_infrastructure_with_terraform/blob/main/modules/rds/README.md)
   - [GLUE README](https://github.com/RaulPontello/deploy_aws_infrastructure_with_terraform/blob/main/modules/glue/README.md)

## Before You Start

1. **Create an AWS Account**
   - [AWS Account](https://aws.amazon.com/resources/create-account/)

2. **Create an AWS IAM User to generate Security Credentials (IAM credentials)**
   - [AWS IAM User](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_create.html)
   - [AWS IAM Security Credentials](https://docs.aws.amazon.com/IAM/latest/UserGuide/security-creds.html)

   ⚠️ Don't forget to grant the proper policy name to your user! You can use the AdministratorAccess policy to allow AWS full access to your user ⚠️

3. **Install Terraform**
   - [Terraform Installation Guide](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

4. **Install AWS CLI**
   - [AWS CLI Installation Guide](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

5. **Verify Installations**

   - To verify if AWS CLI was installed, run:  
     <span style="color:blue;">`aws --version`</span>
   - To verify if Terraform was installed, run:  
     <span style="color:blue;">`terraform --version`</span>

6. **AWS Authentication in Terraform**

   We have several methods to use your IAM credentials to authenticate the Terraform AWS provider:

   - [AWS Provider Authentication Methods](https://registry.terraform.io/providers/hashicorp/aws/latest/docs?ajs_aid=7178871d-9222-4967-bb36-3708610962c6&product_intent=terraform#environment-variables)
   - [Shared Configuration and Credential Files](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html)

   If you're going to use shared configuration and credential files, create a new profile with the following command:

   ```bash
   aws configure --profile your_profile_name   # Create a new profile called 'your_profile_name'
   aws configure list-profiles                 # List all profiles
   ```

In this project, your_profile_name is defined in variables.tf and is used in providers.tf.

## Useful Terraform Commands
   - terraform init --upgrade
   - terraform validate
   - terraform plan
   - terraform apply
   - terraform output
   - terraform apply -destroy

These Terraform commands initialize and upgrade dependencies (init --upgrade), validate the configuration (validate), create an execution plan (plan), apply changes (apply), retrieve output values (output), and destroy resources (apply -destroy).

   Execution Sequence:
   
   terraform init → terraform validate → terraform plan → terraform apply → terraform output

To create automatic Terraform documentation, you can use this command:

   ```bash
   terraform-docs markdown . > README.md
   ```

Follow this official GIT repository for more information and how to install terraform-docs: https://github.com/terraform-docs/terraform-docs

To verify if terraform-docs was installed, run:  

   ```bash
   terraform-docs --version
   ```