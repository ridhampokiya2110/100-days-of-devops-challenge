output "web_server_public_ip" {
  description = "Stockholm (Europe) Public IP address"
  value       = aws_instance.my_web_server.public_ip
}

output "website_url" {
  description = "website link"
  value       = "http://${aws_instance.my_web_server.public_ip}"
}