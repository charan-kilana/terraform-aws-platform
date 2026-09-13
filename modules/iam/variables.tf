variable "environment" {
  description = "Environment name used in resource names and tags."
  type        = string
}

variable "additional_managed_policy_arns" {
  description = "Additional managed IAM policies to attach to the EC2 role."
  type        = set(string)
  default     = []
}
