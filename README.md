# 🚀 Deploy AWS Infrastructure with Terraform

## 🌟 Introduction

Hello folks, you have come to the right place if you want to learn Terrafom and AWS.

This repository is dedicated to deploying AWS resources using Terraform. This is an educational project, the solutions presented are not intended for production level. The goal of this repository is to teach how to use Terrafom with AWS resources.

## 📚 Documentation

**Terraform documentation for AWS**

- [Getting Started with AWS and Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started)

For documentation on each resource implemented in this project, refer to the README file of each module.

## 🚀 Before You Start

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

In this project, your_profile_name is defined in variables.tf and is used in providers.tf.

## 🛠️ Useful Terraform Commands
   - terraform apply
   - terraform apply -destroy
   - terraform init --upgrade
   - terraform validate
   - terraform plan
   - terraform output

   Execution Sequence:
   
   terraform init → terraform validate → terraform plan → terraform apply → terraform output
