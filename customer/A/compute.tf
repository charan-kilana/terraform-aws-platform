module "compute" {
  source = "../../modules/compute"

  environment           = var.environment
  app_subnet_ids        = module.vpc.app_subnet_ids
  app_sg_id             = module.security.app_sg_id
  target_group_arn      = module.alb.target_group_arn
  instance_profile_name = module.iam.instance_profile_name
  instance_type         = var.instance_type
  app_port              = var.app_port
  min_size              = var.min_size
  max_size              = var.max_size
  desired_capacity      = var.desired_capacity
}
