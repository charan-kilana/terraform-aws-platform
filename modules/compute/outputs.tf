output "launch_template_id" {
  description = "ID of the EC2 launch template."
  value       = aws_launch_template.this.id
}

output "autoscaling_group_name" {
  description = "Name of the Auto Scaling Group."
  value       = aws_autoscaling_group.this.name
}

output "ami_id" {
  description = "Amazon Linux 2023 AMI selected by the module."
  value       = data.aws_ami.amazon_linux_2023.id
}
