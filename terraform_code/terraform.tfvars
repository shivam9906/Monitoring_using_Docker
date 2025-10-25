aws_region = "ap-south-1"

ami_id = "ami-02d26659fd82cf299" # Amazon Linux 2

key_name = "test" # Replace with your AWS EC2 key pair

vpc_cidr = "10.0.0.0/16"

public_subnets = ["10.0.1.0/24"]

allowed_ports = [22, 3000, 9090, 3100]

instance_type = "t3.micro"

# Add VPN EC2 settings
vpn_instance_type = "t3.micro"
vpn_ami_id        = "ami-02d26659fd82cf299" # OpenVPN Access Server




common_tags = {
  Environment = "prod"
  Owner       = "shivam"
  Project     = "Monitoring_stack"
}
