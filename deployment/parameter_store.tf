resource "aws_ssm_parameter" "vpc" {
  name      = format("/%s/v-c/vpc_id", var.project_name)
  type      = "String"
  value     = module.vpc.vpc_id
  overwrite = true
}

resource "aws_ssm_parameter" "private_subnets" {
  count = length(var.private_subnets)

  name      = format("/%s/vpc/private/%s", var.project_name, var.private_subnets[count.index].availability_zones)
  type      = "String"
  value     = module.vpc.private_subnets[count.index]
  overwrite = true
}

resource "aws_ssm_parameter" "public_subnets" {
  count = length(var.public_subnets)

  name      = format("/%s/vpc/public/%s", var.project_name, var.public_subnets[count.index].availability_zones)
  type      = "String"
  value     = module.vpc.public_subnets[count.index]
  overwrite = true
}
