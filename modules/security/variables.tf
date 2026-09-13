variable "environment" {
  description = "Environment name used in resource names and tags."
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC in which to create security groups."
  type        = string
}

variable "alb_ingress_ports" {
  description = "TCP ports exposed publicly by the ALB security group."
  type        = list(number)
  default     = [80]
}

variable "alb_ingress_cidr" {
  description = "IPv4 CIDR allowed to reach the ALB."
  type        = string
  default     = "0.0.0.0/0"
}

variable "app_port" {
  description = "TCP port on which the application listens."
  type        = number
  default     = 80
}
