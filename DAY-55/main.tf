provider "aws" {
  region = "eu-north-1" 
}

data "aws_subnets" "available" {}

resource "aws_instance" "web_server" {
  ami                         = "ami-0014ce3e52359afbd" 
  instance_type               = "t3.micro"
  subnet_id                   = tolist(data.aws_subnets.available.ids)[0]
  associate_public_ip_address = true 

  tags = {
    Name = "Day55-Provisioner-Server"
  }

  provisioner "local-exec" {
    command = "echo 'Server is Ready! The Public IP is: ${self.public_ip}' > server_ips.txt"
  }
}