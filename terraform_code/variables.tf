variable "aws_region" {}

variable "ami_id" {
  type = string
}

variable "key_name" {}

variable "vpc_cidr" {}

variable "public_subnets" {
  type = list(string)
}

variable "allowed_ports" {
  type = list(number)
}

variable "instance_type" {
  type = string
}
variable "vpn_instance_type" {
  type = string
}
variable "vpn_ami_id" {
  type = string
}

variable "common_tags" {
  type = map(string)
}
