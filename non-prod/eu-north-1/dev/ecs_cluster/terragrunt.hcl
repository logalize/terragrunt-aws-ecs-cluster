locals {
  # Automatically load environment-level variables
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))

  # Extract out common variables for reuse
  env = local.environment_vars.locals.environment
}

# Terragrunt will copy the Terraform configurations specified by the source parameter, along with any files in the
# working directory, into a temporary folder, and execute your Terraform commands in that folder.
terraform {
  source = "git::git@github.com:trussworks/terraform-aws-ecs-cluster.git?ref=v3.01"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

dependencies {
  paths = ["../aws-data", "../vpc", "../security-group"]
}

dependency "aws-data" {
  config_path = "../aws-data"
}

dependency "vpc" {
  config_path = "../vpc"
}

dependency "security-group" {
  config_path = "../security-group"
}

# These are the variables we have to pass in to use the module specified in the terragrunt configuration above
inputs = {
  name        = "test-ecs-cluster"
  environment = "dev"

  image_id      = dependency.aws-data.outputs.ecs_ami_aws_ami_id
  instance_type = "t3.micro"

  vpc_id             = dependency.vpc.outputs.vpc_id
  subnet_ids         = dependency.vpc.outputs.private_subnets
  security_group_ids = [dependency.security-group.outputs.this_security_group_id]
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1
}
