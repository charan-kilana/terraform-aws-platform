aws_region  = "us-east-1"
environment = "customer-a-npe"

vpc_cidr = "10.10.0.0/16"

public_subnet_cidrs = {
  "us-east-1a" = "10.10.1.0/24"
  "us-east-1b" = "10.10.2.0/24"
}

app_subnet_cidrs = {
  "us-east-1a" = "10.10.11.0/24"
  "us-east-1b" = "10.10.12.0/24"
}

app_port                       = 80
alb_ingress_cidr               = "0.0.0.0/0"
certificate_arn                = null
instance_type                  = "t3.micro"
min_size                       = 1
max_size                       = 2
desired_capacity               = 1
enable_alb_deletion_protection = false
