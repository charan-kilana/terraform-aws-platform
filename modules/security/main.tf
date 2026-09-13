resource "aws_security_group" "alb" {
  name_prefix = "${var.environment}-alb-"
  description = "Allow public web traffic to the application load balancer"
  vpc_id      = var.vpc_id

  tags = {
    Name = "${var.environment}-alb-sg"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_vpc_security_group_ingress_rule" "alb" {
  for_each = toset([for port in var.alb_ingress_ports : tostring(port)])

  security_group_id = aws_security_group.alb.id
  cidr_ipv4         = var.alb_ingress_cidr
  from_port         = tonumber(each.value)
  to_port           = tonumber(each.value)
  ip_protocol       = "tcp"
  description       = "Public web traffic on port ${each.value}"
}

resource "aws_vpc_security_group_egress_rule" "alb" {
  security_group_id = aws_security_group.alb.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
  description       = "Allow outbound traffic"
}

resource "aws_security_group" "app" {
  name_prefix = "${var.environment}-app-"
  description = "Allow application traffic only from the ALB"
  vpc_id      = var.vpc_id

  tags = {
    Name = "${var.environment}-app-sg"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_vpc_security_group_ingress_rule" "app_from_alb" {
  security_group_id            = aws_security_group.app.id
  referenced_security_group_id = aws_security_group.alb.id
  from_port                    = var.app_port
  to_port                      = var.app_port
  ip_protocol                  = "tcp"
  description                  = "Application traffic from the ALB"
}

resource "aws_vpc_security_group_egress_rule" "app" {
  security_group_id = aws_security_group.app.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
  description       = "Allow application outbound traffic"
}
