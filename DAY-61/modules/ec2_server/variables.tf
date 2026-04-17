variable "ami_id" {
  description = "The AMI ID for the server"
  type        = string
}

variable "instance_size" {
  description = "Size of the EC2 instance"
  type        = string
  default     = "t3.micro"
}

variable "server_name" {
  description = "Name tag for the server"
  type        = string
}