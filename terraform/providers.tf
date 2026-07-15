provider "aws" {
  region  = var.region
  profile = "security-admin"
}

provider "aws" {
  region = var.region
  profile = "security-admin"
  alias  = "production"

  assume_role {
    role_arn     = "arn:aws:iam::${var.production_account_id}:role/SecurityAuditRole"
    session_name = "TerraformSecuritySession"
  }
}