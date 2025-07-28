output "instance_ips" {
  description = "Mapping of instance names to their public IPs"
  value       = module.web.instance_public_ips
}
