module "alb" {
  source = "../../modules/alb"

  environment                = var.environment
  vpc_id                     = module.vpc.vpc_id
  public_subnet_ids          = module.vpc.public_subnet_ids
  alb_sg_id                  = module.security.alb_sg_id
  target_port                = var.app_port
  certificate_arn            = var.certificate_arn
  enable_deletion_protection = var.enable_alb_deletion_protection
}
