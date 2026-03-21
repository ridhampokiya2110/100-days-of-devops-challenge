variable "aws_region" {
  description = "AWS Region"
  default     = "eu-north-1"
}

variable "ec2_instance_type" {
  description = "Free tier server"
  default     = "t3.micro"
}

variable "ami_id" {
  description = "Amazon Linux 2023 ka ID:-"
  default     = "ami-0a0f1259dd1c90938" 
}