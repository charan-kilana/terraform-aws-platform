variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string

  validation {
    condition     = can(cidrnetmask(var.vpc_cidr))
    error_message = "vpc_cidr must be a valid IPv4 CIDR block."
  }
}

variable "environment" {
  description = "Environment name used in resource tags."
  type        = string
}

variable "public_subnet_cidrs" {
  description = "Map of availability zone to public subnet CIDR."
  type        = map(string)
}

variable "app_subnet_cidrs" {
  description = "Map of availability zone to private application subnet CIDR. Keys must match public_subnet_cidrs."
  type        = map(string)
}
