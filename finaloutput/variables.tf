variable "aws_region" {
  description = "AWS region"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
}

variable "subnet_cidr" {
  description = "CIDR block for the subnet"
}

variable "availability_zone" {
  description = "Availability Zone for the subnet"
}

variable "allow_ssh_cidr" {
  description = "CIDR for allowing SSH/HTTP"
  default     = "0.0.0.0/0"
}

variable "ami_value" {
  description = "AMI ID for the EC2 instance"
}

variable "instance_type_value" {
  description = "EC2 instance type"
}

variable "key_name" {
  description = "Existing AWS key pair name"
}
