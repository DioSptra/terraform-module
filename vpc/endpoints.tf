resource "aws_vpc_endpoint" "s3" {
  vpc_id       = aws_vpc.this.id
  service_name = "com.amazonaws.${data.aws_region.current.name}.s3"
  route_table_ids = [ for r in aws_route_table.public : r.id ] # atau specific RTs
  tags = merge(var.tags, { Name = "${var.name}-endpoint-s3" })
}
