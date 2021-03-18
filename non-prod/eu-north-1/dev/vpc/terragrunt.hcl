terraform {
  source = "git::git@github.com:terraform-aws-modules/terraform-aws-vpc.git?ref=v2.77.0"
}

include {
  path = find_in_parent_folders()
}

###########################################################
# View all available inputs for this module:
# https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/2.18.0?tab=inputs
###########################################################
inputs = {
  security_groups = ""
  name            = "test_vpc"
  cidr            = "10.0.0.0/16"
  azs             = ["eu-north-1a", "eu-north-1b", "eu-north-1c"]
  private_subnets = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  public_subnets  = ["10.0.104.0/24", "10.0.105.0/24", "10.0.106.0/24"]
  enable_nat_gateway = true
  single_nat_gateway = true
}