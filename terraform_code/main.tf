provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source         = "./modules/vpc"
  vpc_cidr       = var.vpc_cidr
  public_subnets = var.public_subnets
}

module "security_group" {
  source        = "./modules/security_group"
  vpc_id        = module.vpc.vpc_id
  allowed_ports = var.allowed_ports
}

module "ec2" {
  source         = "./modules/ec2"
  ami_id         = var.ami_id
  instance_type  = var.instance_type
  subnet_id      = module.vpc.public_subnets[0]
  security_group = module.security_group.sg_id
  key_name       = var.key_name
  user_data      = file("userdata.sh")
  instance_name  = "monitoring-ec2"
  common_tags    = var.common_tags
  tags = {
    Role = "APP server"
  }

}

module "vpn_sg" {
  source = "./modules/vpn_sg"
  vpc_id = module.vpc.vpc_id
}

module "vpn_ec2" {
  source         = "./modules/ec2"
  ami_id         = var.vpn_ami_id # OpenVPN Access Server AMI in AWS
  instance_type  = var.vpn_instance_type
  subnet_id      = module.vpc.public_subnets[0]
  security_group = module.vpn_sg.sg_id
  key_name       = var.key_name
  user_data      = "" # AMI already has OpenVPN configured
  instance_name  = "VPN-Server"
  common_tags    = var.common_tags
  tags = {
    Role = "This is VPN server for Monitoring"
  }

}

module "test" {
  source         = "./modules/ec2"
  ami_id         = var.vpn_ami_id # OpenVPN Access Server AMI in AWS
  instance_type  = var.vpn_instance_type
  subnet_id      = module.vpc.public_subnets[0]
  security_group = module.vpn_sg.sg_id
  key_name       = var.key_name
  user_data      = "" # AMI already has OpenVPN configured
  instance_name  = "testing server"

  common_tags = var.common_tags
  tags = {
    Role = "For Testing"
  }
}


