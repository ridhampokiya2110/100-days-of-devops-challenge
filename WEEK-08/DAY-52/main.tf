provider "aws" {
  region = "eu-north-1" 
}

data "aws_subnets" "available" {}

data "aws_subnet" "first_subnet" {
  id = tolist(data.aws_subnets.available.ids)[0]
}

locals {
  inbound_ports = [22, 80, 443, 8080, 9000] 
}

resource "aws_security_group" "dynamic_sg" {
  name        = "day52-dynamic-sg"
  description = "Security group built with dynamic blocks"
  vpc_id      = data.aws_subnet.first_subnet.vpc_id # Smartly assigned VPC

  dynamic "ingress" {
    for_each = local.inbound_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "my_server" {
  ami                    = "ami-0014ce3e52359afbd" 
  instance_type          = "t3.micro"
  subnet_id              = data.aws_subnet.first_subnet.id
  vpc_security_group_ids = [aws_security_group.dynamic_sg.id]

  tags = {
    Name = "Day52-Dynamic-Server"
  }
}