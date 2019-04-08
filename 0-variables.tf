/*
  POC Playground Provider Management
   22.03.2019
*/

variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_key_path" {}
variable "aws_key_name" {}

variable "aws_region" {
    description = "EC2 Region for the VPC"
    default = "eu-west-3"
}

variable "availability_zone" {
    description = "EC2 Region for the VPC"
    default = "eu-west-3a"
}

variable "remote_user" {
    description = "remote user"
    default = "centos"
}
variable "amis" {
    description = "CentOS by region"
    default = {
        eu-west-3 = "ami-0de5f716d353e37c9"
    }
}

variable "vpc_cidr" {
    description = "CIDR for the whole VPC"
    default = "10.0.1.0/24"
}

variable "subnet_cidr" {
    description = "CIDR for the Subnet"
    default = "10.0.1.0/24"
}
