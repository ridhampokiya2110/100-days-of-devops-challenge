provider "aws" {
  region = "eu-north-1"
}

variable "allowed_web_ports" {
  description = "List of ports to open in our Security Group"
  type        = list(number)
  default     = [22, 80, 443, 8080, 9090] 
}

data "aws_vpc" "default" {
  default = true
}

resource "aws_security_group" "dynamic_sg" {
  name        = "day65-dynamic-sg"
  description = "Security Group built using Terraform Dynamic Blocks"
  vpc_id      = data.aws_vpc.default.id

  dynamic "ingress" {
    for_each = var.allowed_web_ports 
    
    content {
      from_port   = ingress.value    # Current port number
      to_port     = ingress.value    # Current port number
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Port ${ingress.value} opened dynamically"
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Day65-Dynamic-Security-Group"
  }
}