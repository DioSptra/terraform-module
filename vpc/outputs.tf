output "vpc_id" {
  value = aws_vpc.this.id
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.private[*].id
  description = "Empty jika create_nat_gateway = false"
}

output "igw_id" {
  value = aws_internet_gateway.igw.id
}

output "nat_gateway_ids" {
  value = var.create_nat_gateway ? aws_nat_gateway.nat[*].id : []
}
