locals {
  azs = var.azs

  # compute public CIDRs if not provided
  public_cidrs = (
    var.public_subnet_cidrs != null && length(var.public_subnet_cidrs) > 0
    ? var.public_subnet_cidrs
    : [for idx in range(length(local.azs)) : cidrsubnet(var.vpc_cidr, var.public_subnet_newbits, idx)]
  )
}

resource "aws_subnet" "public" {
  count                   = length(local.azs)
  vpc_id                  = aws_vpc.this.id
  cidr_block              = local.public_cidrs[count.index]
  availability_zone       = local.azs[count.index]
  map_public_ip_on_launch = true

  tags = merge(var.tags, {
    Name = "${var.name}-public-${local.azs[count.index]}"
  })
}
