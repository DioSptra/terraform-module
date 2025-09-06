resource "aws_instance" "this" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.sg_ids
  associate_public_ip_address = var.associate_public_ip

  # Optional key_name (bisa untuk SSH manual atau automation)
  key_name = var.key_name

  tags = merge(
    var.tags,
    {
      Name = var.name
    }
  )
}
