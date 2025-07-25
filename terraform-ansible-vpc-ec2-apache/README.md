# Spacelift Terraform + Ansible Project

This repository contains infrastructure automation using Terraform and Ansible.

## Subproject
- [Terraform + Ansible for VPC and Apache EC2 Setup](./terraform-ansible-vpc-ec2-apache/readme.md)



what are the changes and commands to be followed to deploy this project

first generate the ssh key 
To generate an SSH key pair (private and public key), use the following command:


ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa
-------------------------------------------------------------------------------

configure the aws to the aws configure 
AWS Access Key ID : 
AWS Secret Access Key : 
Default region name : 
Default output format : 

-------------------------------------------------------------------------------------------

change the .tfvars file of the particular environment 


aws_region           = "us-east-1"  #in which region should all the infra to be created
vpc_cidr             = "10.0.0.0/16"  #change as ur cidr range is 
subnet_cidr          = "10.0.1.0/24"  #according to the cidr divide the subnet 
availability_zone    = "us-east-1a"   # on which avaliabley zone
ami_value            = "ami.id of that instance and "
instance_type_value  = "instamce typr as per the environment"
key_name             = ".pemkeyname"



Steps to Run Terraform for the all the  Environment
Navigate to the  environment folder which we want to run or deploy in it:

--------------------------------------------------------------------------------------------
cd environments/<which environment >

Initialize Terraform (only once we initial environment):
terraform init

Check the execution plan using the terraform.tfvars file:
terraform plan -var-file="terraform.tfvars"


Apply the infrastructure changes:
terraform apply -var-file="terraform.tfvars"

------------------------------------------------------------------------------------------------------------------------------

Create inventory.ini file:
In the project root, create a file named inventory.ini with the following content:


this one is for the pemkey file

[web]
<ip-of-the-instance> ansible_user=ubuntu ansible_ssh_private_key_file=./terrformansible.pem


this is for the sshkey gen
[web]
<ip-of the instance> ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_rsa


Make  apache.yaml playbook 

in root directory apache.yaml
Run the playbook:

ansible-playbook -i inventory.ini apache.yaml


---------------------------------------------------------------------------------------------------


Verify it worked:
Open a browser and go to:

http://<ip-of-the-instance>



