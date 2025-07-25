module "web" {
  source                = "../../modules/terraform_ec2_web"
  aws_region            = var.aws_region
  vpc_cidr              = var.vpc_cidr
  subnet_cidr           = var.subnet_cidr
  availability_zone     = var.availability_zone
  allow_ssh_cidr        = var.allow_ssh_cidr
  ami_value             = var.ami_value
  instance_type_value   = var.instance_type_value
  key_name              = var.key_name
  public_key_path       = var.public_key_path
  private_key_path      = var.private_key_path
}

output "instance_ip" {
  value = module.web.instance_public_ip
}