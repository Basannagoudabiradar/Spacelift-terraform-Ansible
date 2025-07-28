provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "terraform_vpc" {
  cidr_block = var.vpc_cidr
  tags = { Name = "TerraformVPC" }
}

resource "aws_subnet" "terraform_public_subnet" {
  count                   = length(var.subnet_cidrs)
  vpc_id                  = aws_vpc.terraform_vpc.id
  cidr_block              = var.subnet_cidrs[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true
  tags = { Name = "TerraformPublicSubnet-${count.index + 1}" }
}

resource "aws_internet_gateway" "terraform_igw" {
  vpc_id = aws_vpc.terraform_vpc.id
  tags = { Name = "TerraformInternetGateway" }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.terraform_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terraform_igw.id
  }
  tags = { Name = "PublicRouteTable" }
}

resource "aws_route_table_association" "public_assoc" {
  count          = length(var.subnet_cidrs)
  subnet_id      = aws_subnet.terraform_public_subnet[count.index].id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_security_group" "web_sg" {
  name   = "web_sg"
  vpc_id = aws_vpc.terraform_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.allow_ssh_cidr]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.allow_ssh_cidr]
  }
  
   # 👇 Only open port 8080 if Tomcat is enabled
  dynamic "ingress" {
    for_each = { for k, v in var.install_tomcat : k => v if v == true }
    content {
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "WebSecurityGroup" }
}

resource "aws_key_pair" "generated" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}

resource "aws_instance" "web_server" {
  for_each                    = var.instance_config
  ami                         = var.ami_value
  instance_type               = each.value
  subnet_id                   = element(aws_subnet.terraform_public_subnet[*].id, index(keys(var.instance_config), each.key))
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  key_name                    = aws_key_pair.generated.key_name
  associate_public_ip_address = true

  tags = {
    Name = each.key
  }

    provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install -y python3"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      # private_key = file("${path.module}/../../terrformansible.pem")
      private_key = file(var.private_key_path)
      host        = self.public_ip
    }
  }
}

# output "instance_public_ips" {
#   value = { for name, instance in aws_instance.web_server : name => instance.public_ip }
# }