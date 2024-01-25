variable "subnet_cidr_block" {
  type = list(string)
  description = "cidr block for vpc and subnets"
}

variable "vpc_cidr_block" {
  type = string
  default = "10.0.0.0/16"
  description = "vpc cidr block"
}

variable "env_prefix" {
  type = string
  description = "environment"
}

variable "availability_zone"{
  type = string
  description = "AZ"
}

variable "availability_zonea"{
  type = string
  description = "AZ"
}

variable "availability_zoneb"{
  type = string
  description = "AZ"
}

variable "az_subnet_prefix"{
  type = string
  description = "AZ subnet"
}

variable "my_ip" {
  description = "The IP address"
  type        = string
  default     = null
}

variable "instance_type" {
  type = string
  description = "ami instance type"
}

variable "public_key" {
  description = "The public SSH key"
  type        = string
  default     = null
}

variable "runner_token" {
  description = "GitHub Runner token"
}

variable "private_key" {}

variable public_key_path {}

variable "webserver_subnet_id" {}