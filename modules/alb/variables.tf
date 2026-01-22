variable "vpc_id" {
  description = "ID of the VPC"
  type = string
}

variable "project_name" {
  description = "Project name"
  type = string
}

variable "subnet_ids" {
  description = "ID of the subnets"
  type = list(string)
}