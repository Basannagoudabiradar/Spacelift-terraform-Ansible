variable "aws_region" {}
variable "vpc_cidr" {}
variable "subnet_cidr" {}
variable "availability_zone" {}
variable "allow_ssh_cidr" { default = "0.0.0.0/0" }
variable "ami_value" {}
variable "instance_type_value" {}
variable "key_name" {}
variable "public_key_path" {}
variable "private_key_path" {}