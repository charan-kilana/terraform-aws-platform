variable "environment" {
  description = "Environment name used in resource names and tags."
  type        = string
}

variable "app_subnet_ids" {
  description = "Private application subnet IDs used by the Auto Scaling Group."
  type        = list(string)

  validation {
    condition     = length(var.app_subnet_ids) >= 2
    error_message = "At least two application subnet IDs are required."
  }
}

variable "app_sg_id" {
  description = "Security group ID attached to application instances."
  type        = string
}

variable "target_group_arn" {
  description = "ARN of the ALB target group."
  type        = string
}

variable "instance_profile_name" {
  description = "Name of the IAM instance profile attached to EC2 instances."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type used by the launch template."
  type        = string
  default     = "t3.micro"
}

variable "app_port" {
  description = "Port on which the bootstrapped HTTP server listens."
  type        = number
  default     = 80
}

variable "min_size" {
  description = "Minimum number of instances in the Auto Scaling Group."
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Maximum number of instances in the Auto Scaling Group."
  type        = number
  default     = 2
}

variable "desired_capacity" {
  description = "Desired number of instances in the Auto Scaling Group."
  type        = number
  default     = 1
}

variable "health_check_grace_period" {
  description = "Seconds allowed for bootstrap before ELB health checks can replace an instance."
  type        = number
  default     = 300
}

variable "enable_detailed_monitoring" {
  description = "Enable one-minute detailed EC2 monitoring."
  type        = bool
  default     = false
}

variable "additional_tags" {
  description = "Additional tags propagated to instances launched by the ASG."
  type        = map(string)
  default     = {}
}
