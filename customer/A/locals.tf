locals {
  common_tags = {
    Application = "customer-a"
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}
