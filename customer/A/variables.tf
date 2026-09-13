variable "aws_region" {
  description = "AWS region in which to deploy the platform."
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment name used in resource names and tags."
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
}

variable "public_subnet_cidrs" {
  description = "Map of availability zone to public subnet CIDR."
  type        = map(string)
}

variable "app_subnet_cidrs" {
  description = "Map of availability zone to private application subnet CIDR."
  type        = map(string)
}

variable "app_port" {
  description = "Port on which the application listens."
  type        = number
  default     = 80
}

variable "alb_ingress_cidr" {
  description = "IPv4 CIDR allowed to access the public ALB."
  type        = string
  default     = "0.0.0.0/0"
}

variable "certificate_arn" {
  description = "Optional ACM certificate ARN. Null enables HTTP only."
  type        = string
  default     = null
}

variable "instance_type" {
  description = "EC2 instance type used by the application ASG."
  type        = string
  default     = "t3.micro"
}

variable "min_size" {
  description = "Minimum ASG capacity."
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Maximum ASG capacity."
  type        = number
  default     = 2
}

variable "desired_capacity" {
  description = "Desired ASG capacity."
  type        = number
  default     = 1
}

variable "enable_alb_deletion_protection" {
  description = "Protect the ALB from accidental deletion."
  type        = bool
  default     = false
}
