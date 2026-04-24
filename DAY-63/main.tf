provider "aws" {
  region = "eu-north-1"
}

# 1. LOCAL VARIABLES (Environment ke hisaab se server size decide karo)
locals {
  # Ek dictionary/map banate hain
  env_size = {
    default = "t3.micro"  # Agar koi workspace na ho
    dev     = "t3.micro"  # Dev environment (Sasta server)
    prod    = "t3.small"  # Production environment (Bada server)
  }
}

# 2. LATEST UBUNTU AMI FETCH KARO
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]
  filter { 
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"] 
  }
}

# 3. THE MAGIC RESOURCE
resource "aws_instance" "app_server" {
  ami           = data.aws_ami.ubuntu.id
  
  # MAGIC: Current workspace ke hisaab se size uthao (lookup function)
  instance_type = lookup(local.env_size, terraform.workspace, "t3.micro")

  tags = {
    # Naam mein automatically workspace ka naam add ho jayega!
    Name        = "Day63-Server-${terraform.workspace}"
    Environment = terraform.workspace
  }
}

# Konsa environment bana hai, wo CLI par print karo
output "current_environment" {
  value = "Deployed in Workspace: ${terraform.workspace}"
}