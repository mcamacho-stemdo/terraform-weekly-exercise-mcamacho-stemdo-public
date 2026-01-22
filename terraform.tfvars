# Variables globales

project_name = "mcamacho-terraform-weekly"
aws_region = "eu-west-3"

# VPC

public_subnet_cidrs = {
  "subnet-cidrs-1" = {
    cidr_blocks = "10.0.1.0/24"
  }

  "subnet-cidrs-2" = {
    cidr_blocks = "10.0.2.0/24"
  }
}

# EC2

ami = "ami-0c73f2f84f9def529"
instance_type = "t2.micro"

# Instancias

instances = {
  "ec2-1" = {
    name = "EC2 - 1"
  }

  "ec2-2" = {
    name = "EC2 - 2"
  }
}