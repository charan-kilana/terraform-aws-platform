module "security" {
  source = "../../modules/security"

  environment       = var.environment
  vpc_id            = module.vpc.vpc_id
  alb_ingress_ports = var.certificate_arn == null ? [80] : [80, 443]
  alb_ingress_cidr  = var.alb_ingress_cidr
  app_port          = var.app_port
}
