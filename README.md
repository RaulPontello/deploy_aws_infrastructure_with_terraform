# 🚀 Deploy AWS Infrastructure with Terraform

## 🌟 Introduction

This repository is dedicated to deploying AWS resources using **Terraform**.

## 📚 Documentation

**Terraform documentation for AWS:**

- [Getting Started with AWS and Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started)

For documentation on each resource implemented in this project, refer to the README file of each module.

## 🚀 Before You Start

1. **Create an AWS Account to generate Security Credentials (IAM credentials):**
   - [AWS IAM Security Credentials](https://docs.aws.amazon.com/IAM/latest/UserGuide/security-creds.html)

2. **Install Terraform:**
   - [Terraform Installation Guide](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

3. **Install AWS CLI:**
   - [AWS CLI Installation Guide](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

4. **Verify Installations:**

   - To verify if AWS CLI was installed, run:  
     <span style="color:blue;">`aws --version`</span>
   - To verify if Terraform was installed, run:  
     <span style="color:blue;">`terraform --version`</span>

5. **AWS Authentication in Terraform:**

   We have several methods to use your IAM credentials to authenticate the Terraform AWS provider:

   - [AWS Provider Authentication Methods](https://registry.terraform.io/providers/hashicorp/aws/latest/docs?ajs_aid=7178871d-9222-4967-bb36-3708610962c6&product_intent=terraform#environment-variables)
   - [Shared Configuration and Credential Files](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html)

   If you're going to use shared configuration and credential files, create a new profile with the following command:

   ```bash
   aws configure --profile your_profile_name   # Create a new profile called 'your_profile_name'
   aws configure list-profiles                 # List all profiles

   In this project, your_profile_name is defined in variables.tf and is used in providers.tf.

   ⚠️ Don't forget to grant the proper policy name to your user! You can use the AdministratorAccess policy to allow full access to your user

## 🛠️ Useful Terraform Commands
   - terraform apply
   - terraform apply -destroy
   - terraform init --upgrade
   - terraform validate
   - terraform plan
   - terraform output

   Execution Sequence:
   
   terraform init → terraform validate → terraform plan → terraform apply → terraform output
