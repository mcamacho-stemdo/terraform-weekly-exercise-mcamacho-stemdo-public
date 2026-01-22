variable "project_name" {
  description = "Project name"
  type = string
}

variable "aws_region" {
  description = "Region of AWS"
  type = string
}

variable "ami" {
  description = "AMI para las instancias EC2"
  type        = string
}

variable "instance_type" {
    description = "Tipo de instancia EC2"
    type = string
}

variable "instances" {
  type = map(object({
    name = string
  }))
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for the public subnets"
  type = map(object({
    cidr_blocks = string
  }))
}