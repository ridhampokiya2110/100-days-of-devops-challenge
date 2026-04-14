terraform {
  backend "s3" {
    bucket         = "day59-state-vault-ridham" 
    key            = "prod/terraform.tfstate"     
    region         = "eu-north-1"
    dynamodb_table = "day59-state-lock"           
    encrypt        = true                         
  }
}

provider "aws" {
  region = "eu-north-1"
}

data "aws_subnets" "available" {}

resource "aws_instance" "test_server" {
  ami           = "ami-0014ce3e52359afbd"
  instance_type = "t3.micro"
  subnet_id     = tolist(data.aws_subnets.available.ids)[0]

  tags = {
    Name = "Day59-Remote-State-Server"
  }
}