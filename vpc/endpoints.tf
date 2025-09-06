# Ambil region yang lagi dipakai
data "aws_region" "current" {}

# Opsional: VPC Endpoint untuk S3
resource "aws_vpc_endpoint" "s3" {
  count          = var.enable_s3_endpoint ? 1 : 0
  vpc_id         = aws_vpc.this.id
  service_name   = "com.amazonaws.${data.aws_region.current.name}.s3"

  # attach ke semua public route table
  route_table_ids = [for r in aws_route_table.public : r.id]

  tags = merge(var.tags, {
    Name = "${var.name}-endpoint-s3"
  })
}
