# Set account-wide variables. These are automatically pulled in to configure the remote state bucket in the root
# terragrunt.hcl configuration.
locals {
  account_name   = ""     # TODO: replace me with your AWS account NAME!
  aws_account_id = ""     # TODO: replace me with your AWS account ID!
  aws_profile    = ""     # TODO: replace me with your AWS account PROFILE!
}
