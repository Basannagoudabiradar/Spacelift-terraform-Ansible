variable "aws_region" {}
variable "vpc_cidr" {}
variable "subnet_cidrs" {
  type = list(string)
}
variable "availability_zones" {
  type = list(string)
}
variable "allow_ssh_cidr" { default = "0.0.0.0/0" }
variable "ami_value" {}
variable "key_name" {}
variable "public_key_path" {}
variable "private_key_path" {}
variable "instance_config" {
  type = map(string)
}
variable "install_tomcat" {
  description = "Whether to install Tomcat and allow port 8080"
  type        = map(bool)
  default     = {}
}
# variable "install_tomcat" {
#   description = "Map to define which instances require Tomcat"
#   type        = map(bool)
# }

