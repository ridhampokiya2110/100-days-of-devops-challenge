resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = var.instance_size

  tags = {
    Name = var.server_name
    Type = "Managed by Terraform Module"
  }
}