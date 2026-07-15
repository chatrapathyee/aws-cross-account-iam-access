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