output "target_group_arn" {
  description = "ARN of target group"
  value = aws_lb_target_group.alb_tg.arn
}

output "alb_security_group_id" {
  description = "ID of the load balancer security group"
  value = aws_security_group.alb_sg.id
}