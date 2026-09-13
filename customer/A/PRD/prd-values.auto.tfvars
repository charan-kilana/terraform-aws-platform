aws_region  = "us-east-1"
environment = "customer-a-prd"

vpc_cidr = "10.20.0.0/16"

public_subnet_cidrs = {
  "us-east-1a" = "10.20.1.0/24"
  "us-east-1b" = "10.20.2.0/24"
}

app_subnet_cidrs = {
  "us-east-1a" = "10.20.11.0/24"
  "us-east-1b" = "10.20.12.0/24"
}

app_port                       = 80
alb_ingress_cidr               = "0.0.0.0/0"
certificate_arn                = null
instance_type                  = "t3.small"
min_size                       = 2
max_size                       = 6
desired_capacity               = 2
enable_alb_deletion_protection = true
