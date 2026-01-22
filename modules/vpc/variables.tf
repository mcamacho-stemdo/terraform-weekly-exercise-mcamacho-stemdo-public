variable "instances" {
  type = map(object({
    name = string
  }))
}

variable "project_name" {
  description = "Project name"
  type = string
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for the public subnets"
  type = map(object({
    cidr_blocks = string
  }))
}