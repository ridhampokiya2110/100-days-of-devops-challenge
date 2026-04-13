provider "aws" {
  region = "eu-north-1"
}

data "aws_subnets" "available" {}

data "aws_ami" "latest_ubuntu" {
  most_recent = true
  owners      = ["099720109477"] 
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

data "aws_ssm_parameter" "my_secret_key" {
  name            = "/prod/api/key"
  with_decryption = true 
}

resource "aws_instance" "secure_server" {
  ami                         = data.aws_ami.latest_ubuntu.id
  instance_type               = "t3.micro"
  subnet_id                   = tolist(data.aws_subnets.available.ids)[0]
  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              # Creating a secure file with the API key inside the server
              echo "API_KEY=${data.aws_ssm_parameter.my_secret_key.value}" > /home/ubuntu/secret_config.env
              chmod 400 /home/ubuntu/secret_config.env
              EOF

  tags = {
    Name = "Day58-Secure-Vault-Server"
  }
}

output "server_ip" {
  value = aws_instance.secure_server.public_ip
}