module "web" {
  source                = "../../modules/terraform-2instance"
  aws_region           = var.aws_region
  vpc_cidr             = var.vpc_cidr
  subnet_cidrs         = var.subnet_cidrs
  availability_zones   = var.availability_zones
  allow_ssh_cidr       = var.allow_ssh_cidr
  ami_value            = var.ami_value
  key_name             = var.key_name
  public_key_path      = var.public_key_path
  private_key_path     = var.private_key_path
  instance_config      = var.instance_config
  install_tomcat       = var.install_tomcat
}

# output "instance_ips" {
#   value = module.web.instance_public_ips
# }