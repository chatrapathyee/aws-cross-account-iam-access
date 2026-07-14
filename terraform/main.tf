resource "aws_iam_role" "security_audit_role" {

  name = "SecurityAuditRole"

  description = "Cross-account role for Security Account security audits"


  assume_role_policy = file("${path.module}/policies/trust_policy.json")

  max_session_duration = 3600
}