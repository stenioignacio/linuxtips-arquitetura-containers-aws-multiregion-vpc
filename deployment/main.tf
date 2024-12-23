module "vpc" {
  source = "github.com/stenioignacio/linuxtips-arquitetura-containers-aws-modules//vpc?ref=v1.0.0"

  project_name = var.project_name

  cidr_block = var.cidr

  project_region = var.region

  availability_zones = var.availability_zones
  public_subnets     = var.public_subnets
  private_subnets    = var.private_subnets
}
