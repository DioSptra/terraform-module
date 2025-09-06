# buat EIP per public subnet (per AZ)
resource "aws_eip" "nat" {
  count = var.create_nat_gateway ? length(aws_subnet.public) : 0
  tags  = merge(var.tags, { Name = "${var.name}-nat-eip-${count.index}" })
}

resource "aws_nat_gateway" "nat" {
  count         = var.create_nat_gateway ? length(aws_subnet.public) : 0
  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = aws_subnet.public[count.index].id
  tags          = merge(var.tags, { Name = "${var.name}-nat-${count.index}" })
}

# buat private subnets & route tables yang pakai nat
resource "aws_subnet" "private" {
  count = length(local.azs)
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.private_subnet_cidrs != null && length(var.private_subnet_cidrs) > 0 ? var.private_subnet_cidrs[count.index] : cidrsubnet(var.vpc_cidr, var.public_subnet_newbits + 1, count.index)
  availability_zone = local.azs[count.index]
  tags = merge(var.tags, { Name = "${var.name}-private-${local.azs[count.index]}" })
}

resource "aws_route_table" "private" {
  count  = var.create_nat_gateway ? length(local.azs) : 0
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat[count.index].id
  }

  tags = merge(var.tags, { Name = "${var.name}-rt-private-${count.index}" })
}

resource "aws_route_table_association" "private_assoc" {
  count          = var.create_nat_gateway ? length(aws_subnet.private) : 0
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private[count.index].id
}
