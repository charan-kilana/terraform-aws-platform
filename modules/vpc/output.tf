output "vpc_id" {
  description = "ID of the VPC."
  value       = aws_vpc.this.id
}

output "public_subnet_ids" {
  description = "IDs of the public subnets."
  value       = values(aws_subnet.public)[*].id
}

output "app_subnet_ids" {
  description = "IDs of the private application subnets."
  value       = values(aws_subnet.app)[*].id
}

output "nat_gateway_ids" {
  description = "NAT gateway IDs keyed by availability zone."
  value       = { for az, gateway in aws_nat_gateway.this : az => gateway.id }
}
