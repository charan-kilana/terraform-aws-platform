output "alb_dns_name" {
  description = "DNS name used to access the application."
  value       = module.alb.alb_dns_name
}

output "application_url" {
  description = "URL used to access the application."
  value       = var.certificate_arn == null ? "http://${module.alb.alb_dns_name}" : "https://${module.alb.alb_dns_name}"
}

output "autoscaling_group_name" {
  description = "Name of the application Auto Scaling Group."
  value       = module.compute.autoscaling_group_name
}
