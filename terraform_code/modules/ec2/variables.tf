variable "ami_id" {}
variable "instance_type" {}
variable "subnet_id" {}
variable "security_group" {}
variable "key_name" {}
variable "user_data" {}

variable "instance_name" {
  type = string
}
variable "common_tags" {
  type = map(string)

}
variable "tags" {
  type = map(string)

}
