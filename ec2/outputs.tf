output "instance_id" {
  description = "ID dari EC2 instance"
  value       = aws_instance.this.id
}

output "public_ip" {
  description = "Public IP dari EC2 instance"
  value       = aws_instance.this.public_ip
}

output "private_ip" {
  description = "Private IP dari EC2 instance"
  value       = aws_instance.this.private_ip
}
