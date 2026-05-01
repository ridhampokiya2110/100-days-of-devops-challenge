provider "aws" {
  region = "eu-north-1"
}

# 1. THE VARIABLES (Ports ki list)
variable "sg_ports" {
  description = "List of ports to open in the Security Group"
  type        = list(number)
  default     = [22, 80, 443, 8080, 9090] # Ek hi jagah saare ports!
}

# Default VPC fetch karne ke liye (taaki SG wahan ban sake)
data "aws_vpc" "default" {
  default = true
}

# 2. THE SECURITY GROUP WITH DYNAMIC BLOCK
resource "aws_security_group" "dynamic_web_sg" {
  name        = "day64-dynamic-sg"
  description = "Security Group built using Terraform Dynamic Blocks"
  vpc_id      = data.aws_vpc.default.id

  # THE MAGIC: Dynamic Ingress Block
  dynamic "ingress" {
    for_each = var.sg_ports # List par loop chalao
    
    # Iterator ka naam default 'ingress' hota hai. 'ingress.value' list ka current number dega.
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Auto-generated port ${ingress.value}"
    }
  }

  # Egress rule (Outbound) - Ye usually ek hi hota hai toh static rakha hai
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Day64-Dynamic-SG"
  }
}

# Output to verify the created SG ID
output "security_group_id" {
  value = aws_security_group.dynamic_web_sg.id
}