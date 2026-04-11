provider "aws" {
  region = "eu-north-1" 
}

data "aws_subnets" "available" {}

data "aws_subnet" "first_subnet" {
  id = tolist(data.aws_subnets.available.ids)[0]
}

resource "tls_private_key" "my_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = "day56-automated-key"
  public_key = tls_private_key.my_key.public_key_openssh
}

resource "local_file" "private_key_pem" {
  content         = tls_private_key.my_key.private_key_pem
  filename        = "day56-key.pem"
  file_permission = "0400"
}

resource "aws_security_group" "web_sg" {
  name   = "day56-web-sg"
  vpc_id = data.aws_subnet.first_subnet.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
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
  ami                         = "ami-0014ce3e52359afbd" # Ubuntu eu-north-1
  instance_type               = "t3.micro"
  subnet_id                   = data.aws_subnet.first_subnet.id
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  key_name                    = aws_key_pair.generated_key.key_name
  associate_public_ip_address = true

  tags = {
    Name = "Day56-RemoteExec-Server"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = tls_private_key.my_key.private_key_pem
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update -y",
      "sudo apt-get install nginx -y",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx"
    ]
  }
}

output "website_url" {
  value = "http://${aws_instance.web_server.public_ip}"
}