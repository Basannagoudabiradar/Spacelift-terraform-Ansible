output "nginx_instance_public_ip" {
  description = "Public IP of the EC2 instance running Nginx"
  value       = aws_instance.server.public_ip
}