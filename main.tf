module "vpc" {
  source = "git::https://github.com/stemdo-labs/terraform-weekly-exercise-mcamacho-stemdo.git//soluciones/modulo-weekly-exercise/modules/vpc?ref=develop"

  project_name = var.project_name
  instances = var.instances
  public_subnet_cidrs = var.public_subnet_cidrs
}

module "alb" {
  source = "git::https://github.com/stemdo-labs/terraform-weekly-exercise-mcamacho-stemdo.git//soluciones/modulo-weekly-exercise/modules/alb?ref=develop"

  project_name = var.project_name
  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.subnet_ids
}

module "ec2" {
  source = "git::https://github.com/stemdo-labs/terraform-weekly-exercise-mcamacho-stemdo.git//soluciones/modulo-weekly-exercise/modules/ec2?ref=develop"

  project_name = var.project_name
  vpc_id = module.vpc.vpc_id
  ami = var.ami
  instance_type = var.instance_type
  subnet_ids = module.vpc.subnet_ids
  target_group_arn = module.alb.target_group_arn
  instances = var.instances
  alb_security_group_id = module.alb.alb_security_group_id

}
