variable "environment" {
  description = "Environment name used in resource names and tags."
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC containing the target group."
  type        = string
}

variable "public_subnet_ids" {
  description = "IDs of public subnets in at least two availability zones."
  type        = list(string)

  validation {
    condition     = length(var.public_subnet_ids) >= 2
    error_message = "At least two public subnet IDs are required for the ALB."
  }
}

variable "alb_sg_id" {
  description = "Security group ID for the ALB."
  type        = string
}

variable "target_port" {
  description = "Port on which application instances receive traffic."
  type        = number
  default     = 80
}

variable "health_check_path" {
  description = "HTTP path used for target health checks."
  type        = string
  default     = "/"
}

variable "deregistration_delay" {
  description = "Seconds to wait while draining targets."
  type        = number
  default     = 30
}

variable "enable_deletion_protection" {
  description = "Protect the ALB from accidental deletion."
  type        = bool
  default     = false
}

variable "certificate_arn" {
  description = "Optional ACM certificate ARN. When set, HTTP redirects to HTTPS."
  type        = string
  default     = null
  nullable    = true
}

variable "ssl_policy" {
  description = "TLS security policy for the HTTPS listener."
  type        = string
  default     = "ELBSecurityPolicy-TLS13-1-2-2021-06"
}
