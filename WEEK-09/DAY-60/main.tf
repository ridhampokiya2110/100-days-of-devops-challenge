provider "aws" {
  region = "eu-north-1"
}

provider "aws" {
  alias  = "mumbai" 
  region = "ap-south-1"
}


data "aws_ami" "ubuntu_stockholm" {
  most_recent = true
  owners      = ["099720109477"]
  filter { name = "name", values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"] }
}

data "aws_ami" "ubuntu_mumbai" {
  provider    = aws.mumbai 
  most_recent = true
  owners      = ["099720109477"]
  filter { name = "name", values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"] }
}


resource "aws_instance" "primary_server" {
  ami           = data.aws_ami.ubuntu_stockholm.id
  instance_type = "t3.micro"
  
  tags = {
    Name = "Day60-Primary-Stockholm"
    Role = "Active"
  }
}

resource "aws_instance" "dr_server" {
  provider      = aws.mumbai 
  ami           = data.aws_ami.ubuntu_mumbai.id
  instance_type = "t2.micro" # Mumbai supports t2.micro
  
  tags = {
    Name = "Day60-DR-Backup-Mumbai"
    Role = "Passive"
  }
}