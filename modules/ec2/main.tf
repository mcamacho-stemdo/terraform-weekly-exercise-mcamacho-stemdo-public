resource "aws_security_group" "ec2_sg" {
  vpc_id = var.vpc_id

    ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      security_groups = [var.alb_security_group_id]
    }

    egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "ec2" {
    for_each = var.instances

    ami = var.ami
    instance_type = var.instance_type
    subnet_id = var.subnet_ids[index(keys(var.instances), each.key) % length(var.subnet_ids)]
    vpc_security_group_ids = [aws_security_group.ec2_sg.id]

    user_data = file("${path.module}/script.sh")

    tags = {
        Name = each.value.name 
    }
}

resource "aws_lb_target_group_attachment" "alb_tg_attachment" {
  for_each = var.instances

  target_id = aws_instance.ec2[each.key].id
  target_group_arn = var.target_group_arn
  port = 80
}