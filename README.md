# AWS Cross Account IAM Access

Terraform uses the AWS provider in [terraform/providers.tf](terraform/providers.tf) and expects a valid AWS credential source.

## Local setup

Use either a named AWS profile or standard AWS environment variables before running Terraform. Terraform cannot plan until one of these credential sources is available:

```powershell
$env:AWS_PROFILE = "your-profile"
terraform plan
```

Or use access keys in the current shell session:

```powershell
$env:AWS_ACCESS_KEY_ID = "..."
$env:AWS_SECRET_ACCESS_KEY = "..."
$env:AWS_SESSION_TOKEN = "..." # only if you are using temporary credentials
terraform plan
```

Or pass a profile directly:

```powershell
terraform plan -var='aws_profile=your-profile'
```

For the required account inputs, copy [terraform/terraform.tfvars.example](terraform/terraform.tfvars.example) to `terraform.tfvars` and fill in `security_account_id` and `production_account_id` with 12-digit AWS account IDs.

If no AWS credentials are available, Terraform will still fail during provider initialization.
