variable "name" {
  description = "Nama Security Group"
  type        = string
}

variable "description" {
  description = "Deskripsi Security Group"
  type        = string
  default     = "Managed by Terraform"
}

variable "vpc_id" {
  description = "VPC ID tempat Security Group dibuat"
  type        = string
}

variable "ingress_rules" {
  description = "List aturan ingress (inbound)"
  type = list(object({
    from_port        = number
    to_port          = number
    protocol         = string
    description      = optional(string)
    cidr_blocks      = optional(list(string))
    ipv6_cidr_blocks = optional(list(string))
    security_groups  = optional(list(string))
  }))
  default = []
}

variable "egress_rules" {
  description = "List aturan egress (outbound)"
  type = list(object({
    from_port        = number
    to_port          = number
    protocol         = string
    description      = optional(string)
    cidr_blocks      = optional(list(string))
    ipv6_cidr_blocks = optional(list(string))
  }))
  default = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

variable "tags" {
  description = "Map of tags untuk Security Group"
  type        = map(string)
  default     = {}
}
