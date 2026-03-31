provider "aws" {
  region = "eu-north-1"
}

# 1. Network Details (VPC & Subnets)
data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# 2. Security Group
resource "aws_security_group" "web_sg" {
  name        = "asg-web-sg"
  description = "Allow HTTP and SSH"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
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

# 3. ALB & Target Group (Traffic Police & Register)
resource "aws_lb" "my_alb" {
  name               = "devops-alb-day46"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.web_sg.id]
  subnets            = data.aws_subnets.default.ids
}

resource "aws_lb_target_group" "my_tg" {
  name     = "devops-tg-day46"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.default.id
}

resource "aws_lb_listener" "my_listener" {
  load_balancer_arn = aws_lb.my_alb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my_tg.arn
  }
}

# 4. NEW: Launch Template (Server ka Blueprint)
resource "aws_launch_template" "my_template" {
  name_prefix   = "devops-lt-"
  image_id      = "ami-0014ce3e52359afbd" 
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  # ASG requires base64 encoded user_data
  user_data = base64encode(<<-EOF
              #!/bin/bash
              apt update -y
              apt install -y apache2
              echo "<h1> Auto Scaled Server! Managed by ASG.</h1>" > /var/www/html/index.html
              systemctl start apache2
              systemctl enable apache2
              EOF
  )
}

# 5. NEW: Auto Scaling Group (The Robot Manager)
resource "aws_autoscaling_group" "my_asg" {
  name                = "devops-asg-day46"
  vpc_zone_identifier = data.aws_subnets.default.ids
  target_group_arns   = [aws_lb_target_group.my_tg.arn] 
  
  desired_capacity    = 2 
  min_size            = 1 
  max_size            = 4 
  
  launch_template {
    id      = aws_launch_template.my_template.id
    version = "$Latest"
  }
}