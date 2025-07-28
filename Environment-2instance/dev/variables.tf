variable "aws_region" {
  description = "AWS region to deploy resources."
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
}

variable "subnet_cidrs" {
  description = "List of CIDR blocks for the public subnets."
  type        = list(string)
}

variable "availability_zones" {
  description = "List of availability zones for subnets and instances."
  type        = list(string)
}

variable "allow_ssh_cidr" {
  description = "CIDR block allowed to access via SSH."
  default     = "0.0.0.0/0"
}

variable "ami_value" {
  description = "AMI ID to use for EC2 instance."
}

variable "key_name" {
  description = "Key pair name for SSH access."
}

variable "public_key_path" {
  description = "Path to your public key file."
}

variable "private_key_path" {
  description = "Path to your private key file."
}

variable "instance_config" {
  description = "Map of instance names to instance types."
  type        = map(string)
}
variable "install_tomcat" {
  description = "Whether to install Tomcat and allow port 8080"
  type        = map(bool)
  default     = {}
}