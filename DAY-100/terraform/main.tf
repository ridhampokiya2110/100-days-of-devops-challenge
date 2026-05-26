provider "aws" {
  region = "us-east-1" // North Virginia
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] 

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }
}

resource "aws_instance" "tic_tac_toe_server" {
  ami           = data.aws_ami.ubuntu.id 
  instance_type = "t3.micro"             
  key_name      = "day-89"

  vpc_security_group_ids = [aws_security_group.jenkins_sg_21.id]
  user_data = <<-EOF
              #!/bin/bash
              
              # 0. CREATE 2GB SWAP MEMORY (Saves from OOM crash)
              sudo fallocate -l 2G /swapfile
              sudo chmod 600 /swapfile
              sudo mkswap /swapfile
              sudo swapon /swapfile
              echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

              # 1. Install Docker & Curl
              sudo apt-get update -y
              sudo apt-get install -y docker.io curl
              sudo systemctl start docker
              sudo systemctl enable docker
              sudo usermod -aG docker ubuntu

              # 2. Install Trivy (Security Scanner)
              curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sudo sh -s -- -b /usr/local/bin

              # 3. Install K3s (Lightweight Mode - Disable Traefik to save RAM)
              curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--disable traefik" sh -
              sudo chmod 644 /etc/rancher/k3s/k3s.yaml

              # 4. Install Helm (K8s Package Manager)
              curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
              sudo bash get_helm.sh
  EOF

  tags = {
    Name = "Day92-Docker-Server"
  }
  root_block_device {
    volume_size = 15
    volume_type = "gp2"
  }
}

resource "aws_security_group" "jenkins_sg_21" {
  name        = "sg_jenkins_day_98_v2"
  description = "Allow SSH and HTTP"

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


output "instance_public_ip" {
  value = aws_instance.tic_tac_toe_server.public_ip
}
