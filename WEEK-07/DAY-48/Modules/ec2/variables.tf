variable "ami_id" {
  description = "The AMI ID for the server"
}

variable "instance_type" {
  description = "The size of the server"
}

variable "server_name" {
  description = "Name tag for the server"
}
variable "subnet_id" {
  description = "The Subnet ID to launch the server in"
}