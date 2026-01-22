output "vpc_id" {
  description = "ID of the VPC"
  value = aws_vpc.vpc.id
}

output "subnet_ids" {
  description = "IDs of the subnets"
  value = [for s in aws_subnet.subnets : s.id]
}