# AWS IAM Cross-Account Access

A production-style implementation of secure cross-account access using **AWS Organizations**, **AWS IAM Identity Center**, **AWS Security Token Service (STS)**, and **Terraform**.

This project demonstrates how enterprise security teams centrally manage access to AWS member accounts without using long-lived IAM users or shared administrator credentials.


## Overview

In enterprise AWS environments, organizations typically separate workloads across multiple AWS accounts. Instead of creating administrators in every account, users authenticate through AWS IAM Identity Center and temporarily assume IAM roles in member accounts using AWS STS.

This project implements that enterprise authentication model using Infrastructure as Code (Terraform).

The architecture consists of:

- AWS Organization
- Security Account
- Production Account
- AWS IAM Identity Center
- Cross-account IAM Role
- Terraform-managed infrastructure


## Architecture

```text
                    AWS Organization
                           │
          ┌────────────────┴────────────────┐
          │                                 │
          ▼                                 ▼
   Security Account                Production Account
          │                                 │
          │                         SecurityAuditRole
          │                                 ▲
          └──────────── AssumeRole ─────────┘
                     (AWS STS)

              IAM Identity Center
                     │
               SecurityAdmin
```


## Features

- Multi-account AWS Organization
- Security and Production account separation
- AWS IAM Identity Center authentication
- Cross-account IAM role assumption
- AWS STS temporary credentials
- Terraform Infrastructure as Code
- IAM trust policies
- Enterprise authentication workflow


## Skills Demonstrated

- AWS Organizations
- Organizational Units (OUs)
- AWS IAM Identity Center
- Permission Sets
- Cross-account IAM Roles
- AWS Security Token Service (STS)
- Terraform
- Infrastructure as Code (IaC)
- AWS CLI with SSO
- IAM Trust Policies


## Repository Structure

```text
aws-cross-account-iam-access/
│
├── README.md
│
└── terraform/
    ├── main.tf
    ├── providers.tf
    ├── variables.tf
    ├── outputs.tf
    ├── versions.tf
    ├── terraform.tfvars.example
    │
    ├── policies/
    │   ├── trust_policy.json
    │   └── security_audit_policy.json
    │
    ├── modules/
    └── environments/
```


## Prerequisites

Before deploying this project, ensure you have:

- AWS Organization
- Security Account
- Production Account
- AWS IAM Identity Center enabled
- AdministratorAccess permission set
- AWS CLI v2
- Terraform >= 1.6
- Git


## Deployment

1. Clone the repository

```bash
git clone <repository-url>
cd aws-cross-account-iam-access/terraform
```

2. Login using AWS IAM Identity Center

```bash
aws sso login --profile security-admin
```

3. Initialize Terraform

```bash
terraform init
```

4. Validate the configuration

```bash
terraform validate
```

5. Review the execution plan

```bash
terraform plan
```

6. Deploy the infrastructure

```bash
terraform apply
```


## Verification

Verify the active AWS identity.

```bash
aws sts get-caller-identity --profile security-admin
```

Verify cross-account role assumption.

```bash
aws sts assume-role \
  --profile security-admin \
  --role-arn arn:aws:iam::<PRODUCTION_ACCOUNT_ID>:role/SecurityAuditRole \
  --role-session-name TestSession
```

Verify Terraform state.

```bash
terraform plan
```

Expected output:

```text
No changes. Your infrastructure matches the configuration.
```


## Learning Outcomes

Through this project I learned:

- Enterprise multi-account AWS architecture
- AWS Organizations and Organizational Units
- AWS IAM Identity Center authentication
- Cross-account IAM trust relationships
- AWS STS AssumeRole workflow
- Terraform provider aliases
- Terraform state management
- Importing existing AWS resources into Terraform
- Debugging Terraform authentication issues with AWS SSO



## Troubleshooting

Common issues encountered during implementation:

- Expired AWS IAM Identity Center (SSO) session
- Terraform provider authentication failures
- IAM trust policy configuration
- Existing AWS resources requiring Terraform import
- Provider alias configuration for cross-account deployments

Each issue was resolved through verification using the AWS CLI, AWS STS, and Terraform.