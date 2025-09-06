variable "name" {
  description = "Nama EC2 instance"
  type        = string
}

variable "ami_id" {
  description = "AMI ID untuk instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "subnet_id" {
  description = "Subnet ID tempat instance dibuat"
  type        = string
}

variable "sg_ids" {
  description = "List Security Group IDs untuk instance"
  type        = list(string)
  default     = []
}

variable "associate_public_ip" {
  description = "Apakah instance punya public IP"
  type        = bool
  default     = true
}

variable "key_name" {
  description = "SSH Key Pair name (optional)"
  type        = string
  default     = null
}

variable "tags" {
  description = "Map of tags untuk EC2"
  type        = map(string)
  default     = {}
}
