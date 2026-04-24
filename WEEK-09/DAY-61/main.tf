provider "aws" {
  region = "eu-north-1"
}

data "aws_ami" "latest_ubuntu" {
  most_recent = true
  owners      = ["099720109477"]
  filter { name = "name", values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"] }
}

module "frontend_app" {
  source        = "./modules/ec2_server" 
  
  ami_id        = data.aws_ami.latest_ubuntu.id
  instance_size = "t3.micro"
  server_name   = "Day61-Frontend-Server"
}

module "backend_api" {
  source        = "./modules/ec2_server" 
  
  ami_id        = data.aws_ami.latest_ubuntu.id
  instance_size = "t3.small" 
  server_name   = "Day61-Backend-Database"
}