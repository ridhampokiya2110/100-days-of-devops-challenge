output "load_balancer_dns" {
  description = "Your Load Balancer URL Upload Here..!!!"
  value       = "http://${aws_lb.my_alb.dns_name}"
}