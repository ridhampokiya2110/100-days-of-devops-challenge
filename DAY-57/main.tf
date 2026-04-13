provider "aws" {
  region = "eu-north-1"
}

data "aws_subnets" "available" {}

data "aws_ami" "latest_ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical (Ubuntu) ka official AWS Account ID

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
  
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_security_group" "web_sg" {
  name        = "day57-dynamic-sg"
  description = "Allow HTTP"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "web_server" {
  ami                         = data.aws_ami.latest_ubuntu.id 
  instance_type               = "t3.micro"
  subnet_id                   = tolist(data.aws_subnets.available.ids)[0]
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  associate_public_ip_address = true

  user_data = templatefile("install.sh.tpl", {
    environment = "PRODUCTION"
    department  = "Cloud DevOps Team"
  })

  tags = {
    Name = "Day57-Dynamic-Server"
  }
}

output "website_url" {
  value = "http://${aws_instance.web_server.public_ip}"
}