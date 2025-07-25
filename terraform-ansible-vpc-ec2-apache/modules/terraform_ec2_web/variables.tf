variable "aws_region" {
  description = "The AWS region where the resources will be deployed (e.g., us-east-1)."
}

variable "vpc_cidr" {
  description = "CIDR block for the custom VPC (e.g., 10.0.0.0/16)."
}

variable "subnet_cidr" {
  description = "CIDR block for the public subnet within the VPC (e.g., 10.0.1.0/24)."
}

variable "availability_zone" {
  description = "The availability zone to deploy the subnet and instance (e.g., us-east-1a)."
}

variable "allow_ssh_cidr" {
  description = "CIDR block that is allowed to access the instance via SSH (default is open to all)."
  default     = "0.0.0.0/0"
}

variable "ami_value" {
  description = "AMI ID to use for the EC2 instance (e.g., ami-020cba7c55df1f615 for Ubuntu in us-east-1)."
}

variable "instance_type_value" {
  description = "The instance type for the EC2 (e.g., t2.micro)."
}

variable "key_name" {
  description = "The name of the key pair to use for SSH access (e.g., terrformansible)."
}

variable "public_key_path" {
  description = "Path to your public key file."
}
variable "private_key_path" {
  description = "Path to the SSH private key (e.g., ~/.ssh/id_rsa)."
}
