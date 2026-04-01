provider "aws" {
  region = "eu-north-1" 
}

data "aws_subnets" "available" {}

locals {
  my_instance_type = terraform.workspace == "prod" ? "t3.small" : "t3.micro"
}

resource "aws_instance" "my_server" {
  ami           = "ami-0014ce3e52359afbd" 
  instance_type = local.my_instance_type
  subnet_id     = tolist(data.aws_subnets.available.ids)[0]

  tags = {
    Name        = "Day50-Server-${terraform.workspace}" 
    Environment = terraform.workspace
  }
}