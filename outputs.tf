# ===============================
# OUTPUT EC2 PUBLIC IP
# ===============================
# This shows your server IP after terraform apply

output "ec2_public_ip" {
  value = aws_instance.api_server.public_ip
}

output "alb_dns_name" {
  value = aws_lb.api_alb.dns_name
}
