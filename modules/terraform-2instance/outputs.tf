output "instance_public_ips" {
  description = "Mapping of instance name to public IP"
  value = { for name, instance in aws_instance.web_server : name => instance.public_ip }
}
