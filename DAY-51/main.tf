provider "aws" {
  region = "eu-north-1" 
}

data "aws_subnets" "available" {}

locals {
  project_servers = {
    "frontend" = { instance_size = "t3.micro", server_name = "Web-UI-Server" }
    "backend"  = { instance_size = "t3.small", server_name = "API-App-Server" }
    "database" = { instance_size = "t3.micro", server_name = "DB-Backend-Server" }
  }
}

resource "aws_instance" "my_fleet" {
  for_each = local.project_servers 

  ami           = "ami-0014ce3e52359afbd" 
  
  instance_type = each.value.instance_size
  subnet_id     = tolist(data.aws_subnets.available.ids)[0]

  tags = {
    Name = each.value.server_name
    Role = each.key 
  }
}