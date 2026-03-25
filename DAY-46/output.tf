output "alb_dns_name" {
  description = "Load Balancer URL"
  value       = "http://${aws_lb.my_alb.dns_name}"
}