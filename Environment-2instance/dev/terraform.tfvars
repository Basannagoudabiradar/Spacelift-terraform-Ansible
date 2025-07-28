aws_region           = "us-east-1"
vpc_cidr             = "10.0.0.0/16"
subnet_cidrs         = ["10.0.1.0/24", "10.0.2.0/24"]
availability_zones   = ["us-east-1a", "us-east-1b"]
ami_value            = "ami-020cba7c55df1f615"
key_name             = "my-key"
public_key_path      = "~/.ssh/id_rsa.pub"
private_key_path     = "~/.ssh/id_rsa"

instance_config = {
  devinstance1 = "t2.micro"
  devinstance2 = "t2.nano"
}
install_tomcat = {
  devinstance1 = true
  devinstance2 = false
}
