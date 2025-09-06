variable "name" {
  type        = string
  description = "Nama untuk vpc yang di inginkan (ex: Dio-VPC)"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR untuk VPC (ex: 10.0.0.0/16)"
}

variable "azs" {
  type        = list(string)
  description = "List Availability Zones untuk membuat subnet (ex: [\"ap-southeast-1a\",\"ap-southeast-1b\"])"
}

# 2 pilihan untuk subnet: either explicit cidrs, or auto-calc via mask
variable "public_subnet_cidrs" {
  type        = list(string)
  default     = null
  description = "List CIDR untuk public subnets; jika null, akan dihitung otomatis dari vpc_cidr"
}

variable "private_subnet_cidrs" {
  type        = list(string)
  default     = null
  description = "List CIDR untuk private subnets; jika null, akan dihitung otomatis dari vpc_cidr"
}

variable "public_subnet_newbits" {
  type        = number
  default     = 8
  description = "Jika public_subnet_cidrs null -> cidrsubnet(vpc_cidr, newbits, index) digunakan; newbits=8 untuk /24 dari /16"
}

variable "create_nat_gateway" {
  type    = bool
  default = true
  description = "Buat NAT Gateway di setiap public subnet (bila ingin private subnet accès ke internet)"
}

variable "enable_flow_logs" {
  type    = bool
  default = false
}

variable "tags" {
  type    = map(string)
  default = {}
}
