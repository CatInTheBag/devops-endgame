variable "my_ip" {
  type = string
  description = "ip for ssh"
}

variable "env_prefix" {
  type = string
  description = "environment"
}

variable public_key {}

variable "instance_type" {
  type = string
  description = "ami instance type"
}

variable "az_subnet_prefix"{
  type = string
  description = "AZ subnet"
}

variable "availability_zone"{
  type = string
  description = "AZ"
}

variable "vpc_id" {}
variable "webserver_subnet_id" {}

variable "runner_token" {}
variable "private_key" {}
