# Elastic IP for each NAT Gateway
resource "aws_eip" "nat" {
  for_each = var.public_subnet_cidrs

  domain = "vpc"

  tags = {
    Name = "${var.environment}-nat-eip-${each.key}"
  }
}

# One NAT Gateway in each public subnet
resource "aws_nat_gateway" "this" {
  for_each = aws_subnet.public

  allocation_id = aws_eip.nat[each.key].id
  subnet_id     = each.value.id

  tags = {
    Name = "${var.environment}-nat-${each.key}"
  }

  depends_on = [aws_internet_gateway.this]
}