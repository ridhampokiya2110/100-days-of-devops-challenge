provider "aws" {
  region = "ap-south-1"
}

module "dev_environment" {
  source        = "./modules/ec2"
  ami_id        = "ami-0c2af51e265bd5e0e" 
  instance_type = "t2.micro"              
  server_name   = "Dev-App-Server"
}

# 2. Calling the SAME module for PROD Environment
module "prod_environment" {
  source        = "./modules/ec2"
  ami_id        = "ami-0c2af51e265bd5e0e"
  instance_type = "t3.micro"              
  server_name   = "Prod-App-Server"
}