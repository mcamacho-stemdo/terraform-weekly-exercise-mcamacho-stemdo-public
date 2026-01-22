variable "instances" {
  type = map(object({
    name = string
  }))
}

variable "project_name" {
  description = "Project name"
  type = string
}

variable "vpc_id" {
  description = "ID of the VPC"
  type = string
}

variable "ami" {
  description = "OS distribution for EC2 machines"
  type = string
}

variable "instance_type" {
  description = "Type of EC2 machine"
  type = string
}

variable "subnet_ids" {
  description = "ID of the subnets"
  type = list(string)
}

variable "target_group_arn" {
  description = "ARN of the target group"
  type = string
}

variable "alb_security_group_id" {
  description = "ID of the load balancer security group"
  type = string
}