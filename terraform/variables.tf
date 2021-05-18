variable "aws_region" {
  description = "Region"
  default     = "eu-central-1"
}

variable "availability_zone" {
  description = "Availability zone for all resources"
  default     = "eu-central-1a"
}

variable "aws_key_pair_name" {
  description = "name of ssh key to create"
  default     = "jenkins"
}

variable "public_key_path" {
  description = "Path to ssh public key used to create this key on AWS"
  default = "../jenkins.pub"
}

variable "private_key_path" {
  description = "Path to the private key used to connect to instance"
  default = "../jenkins.pem"
}

variable "ssh_user" {
  description = "User used to log in to instance"
  default     = "ubuntu"
}

variable "vpc_cidr" {
  description = "CIDR for the whole VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR for the Public Subnet"
  default     = "10.0.0.0/24"
}
